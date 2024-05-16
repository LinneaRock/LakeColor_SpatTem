library(tidyverse)




#Full Data:
lake_cover_trends <- read.csv("/Users/matthewdunkle/Desktop/2024-04-25_lakecolor_climate_landcover_trends.csv") %>% 
  select(-X) %>% filter(complete.cases(across(everything()))) %>% 
  mutate(basic_trend_cat=case_when(lm_slope_color > 0 & lm_pval_color <= 0.05~ "Trending green", 
                                   lm_slope_color < 0 & lm_pval_color <= 0.05~ "Trending blue", 
                                   lm_pval_color > 0.05~ "No trend")) %>% 
  filter(basic_trend_cat == "Trending blue") %>% select(-basic_trend_cat)


#1) Train a model
library(tidymodels)
lakecolor_split <- initial_split(lake_cover_trends, strata = trend_cat)
lakecolor_train <- training(lakecolor_split)
lakecolor_test <- testing(lakecolor_split)


#set a recipe (i.e. a model that has NOT been trained on data) and a prep (i.e. model that has been trained on data)
lcol_rec <- recipe(lm_slope_color ~ ., data = lakecolor_train) %>%
  update_role(c(lake_nhdid,resid_slope_color,dwl_prior2002,resid_yint_color,lm_pval_color,resid_pval_color,resid_rsq_color,range_dwl_site, mean_range_dwl_site,avg_range_dwl_site,lm_rsq_color,lm_yint_color,avg_dwl_site,trend_cat,epanutr_zoneid,hu12_zoneid,lake_connectivity_class,lake_connectivity_permanent,trend_cat_switch, obs_year_prism, nlcd_cultcrop82_diff), new_role = "ID") %>% #keeps ep name around but doesn't use it as a predictor
  step_zv(all_numeric(), -all_outcomes()) %>% #remove any numbers with zero variance
  step_normalize(all_numeric(), -all_outcomes()) #normalize (center and scale) all numeric variables (IMPORTANT FOR LASSO REGULARIZATION)

lcol_prep <- lcol_rec %>%
  prep(strings_as_factors = FALSE)

#Specify and Fit models
lasso_spec <- linear_reg(penalty = 0.1, mixture = 1) %>%
  set_engine("glmnet")

wf <- workflow() %>%
  add_recipe(lcol_rec)

lasso_fit <- wf %>%
  add_model(lasso_spec) %>%
  fit(data = lakecolor_train)

lasso_fit %>%
  pull_workflow_fit() %>%
  tidy()


#Tune parameters

set.seed(1234)
lcol_boot <- bootstraps(lakecolor_train, strata = trend_cat) #set a bootstrap to resample the model

tune_spec <- linear_reg(penalty = tune(), mixture = 1) %>% #set the penalty to tune instead of using a single value
  set_engine("glmnet")

lambda_grid <- grid_regular(penalty(), levels = 50) #put it in the proper grid to regularize model


#tune the grid in aparallel
doParallel::registerDoParallel()

set.seed(2020)
lasso_grid <- tune_grid(
  wf %>% add_model(tune_spec),
  resamples =lcol_boot,
  grid = lambda_grid
)

#resultls:
lasso_grid %>%
  collect_metrics()
#visulaize
lasso_grid %>%
  collect_metrics() %>%
  ggplot(aes(penalty, mean, color = .metric)) +
  geom_errorbar(aes(
    ymin = mean - std_err,
    ymax = mean + std_err
  ),
  alpha = 0.5
  ) +
  geom_line(size = 1.5) +
  facet_wrap(~.metric, scales = "free", nrow = 2) +
  scale_x_log10() +
  theme(legend.position = "none")

#select one with lowest RMSE
lowest_rmse <- lasso_grid %>%
  select_best("rmse", maximize = FALSE)

final_lasso <- finalize_workflow(
  wf %>% add_model(tune_spec),
  lowest_rmse
)

#fit finalized worlflow on training data:
library(vip)
library(forcats)
final_lasso %>%
  fit(lakecolor_train) %>%
  pull_workflow_fit() %>%
  vi(lambda = lowest_rmse$penalty) %>%
  mutate(
    Importance = abs(Importance),
    Variable = fct_reorder(Variable, Importance)
  ) %>%
  ggplot(aes(x = Importance, y = Variable, fill = Sign)) +
  geom_col() +
  scale_x_continuous(expand = c(0, 0)) +
  labs(y = NULL)


last_fit(
  final_lasso,
  lakecolor_split
) %>%
  collect_metrics()
