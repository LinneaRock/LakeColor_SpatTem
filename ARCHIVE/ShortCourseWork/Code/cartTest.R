# Script to run CART analysis on trend data

source("Data/Call_data.R")
source('Code/temporal_restriction.R')
dwl_all <- read.csv('Data/dWL_all.csv')


library(tidyverse)
library(rpart)
library(rsample)
library(caret)
library(rpart.plot)
library(yardstick)

set.seed(42)

# Format dataset for CART analysis ####
cart_data <- dWL_all |>
  select(lagoslakeid, Trend, slope) |>
  distinct() |>
  left_join(temporal |>
  select(lagoslakeid, lake_waterarea_ha, lake_connectivity_class,lake_totalperimeter_m, lake_elevation_m, ws_area_ha, ws_lake_arearatio, lake_centroidstate) |>  ungroup() |> select(-year) |> distinct()) |>
  rename(`Lake area (ha)` = lake_waterarea_ha,
         Connectivity = lake_connectivity_class,
         `Perimeter (m)` = lake_totalperimeter_m,
         Elevation = lake_elevation_m,
         `Residence Time` = ws_lake_arearatio,
         State = lake_centroidstate) |>
  ungroup() |>
  select(-lagoslakeid) |>
  drop_na() |>
  mutate(Trend.new = case_when(Trend %in% c('Blue -> Greener', 'Intensifying Green/brown') ~ 'Greening',
                                Trend %in% c('Green -> Bluer', 'Intensifying Blue') ~ 'Blueing',
                                TRUE ~ 'No trend')) |>
  select(-Trend) |>
  mutate(Trend.new = as.factor(Trend.new))

cart_data |> count(Trend.new)


# Training data ####
# split training and testing data by 60/40% 
test_inds <- initial_split(cart_data, 0.6)
# Split data into test/train 
train <- training(test_inds) 
test <- testing(test_inds) 



# Run CART model ####
CART_mod <- rpart(Trend.new~., data=train, method='class', cp=0.01)

## test cart model ####
test$predict <- predict(CART_mod, test, 'class')
cm <- conf_mat(test, Trend.new, predict)
accuracy(test, Trend.new, predict)
cm

## get the best cp ####
printcp(CART_mod)
bestcp <- CART_mod$cptable[which.min(CART_mod$cptable[,'xerror']), 'CP']

CART_mod_pruned <- prune(CART_mod, cp=bestcp)

## print tree ####
png(file="Figures/cart_model_bad.png",
    width=600, height=400)
plot(CART_mod_pruned)
text(CART_mod_pruned, cex=0.8, use.n=TRUE, xpd=TRUE)
dev.off()


# Plots! ####
## boxplot of trend vs residence time ####
ggplot(cart_data) + 
  geom_boxplot(aes(Trend.new, `Residence Time`)) +
  theme_classic() +
  scale_y_log10() +
  labs(x = '', y = 'log(Residence Time)')

## scatterplot of slope vs resience time ####
ggplot(cart_data) +
  geom_point(aes(`Residence Time`, slope, color=Trend.new)) +
  scale_x_log10()

## boxplot of trend vs elevation ####
ggplot(cart_data) + 
  geom_boxplot(aes(Trend.new, Elevation)) +
  theme_classic() +
  #scale_y_log10() +
  labs(x = '')
ggsave('Figures/trend_elevation.png', width=6, height=4, units='in', dpi=600)

## scatterplot of slope vs elevation ####
ggplot(cart_data) +
  geom_point(aes(Elevation, slope, color=Trend.new))

## distribution of trend vs connectivity ####
ggplot(cart_data) + 
  geom_density(aes(slope, group=Trend.new, fill = Trend.new), alpha=0.5) +
  facet_wrap(~Connectivity) +
  theme_classic() +
  #scale_y_log10() +
  labs(x = '') +
  scale_fill_manual(values=c('blue4','green4', 'grey60'))
ggsave('Figures/density_connectivity.png', width=6, height=4, units='in', dpi=600)
  
ggplot(cart_data) + 
  geom_density(aes(slope, group=Connectivity, fill = Connectivity), alpha=0.2) +
  facet_wrap(~Trend.new) +
  theme_classic() +
  #scale_y_log10() +
  labs(x = '') 
ggsave('Figures/density_connectivity2.png', width=6, height=4, units='in', dpi=600)

ggplot(cart_data) +
  geom_density(aes(slope, group=Trend.new, fill = Trend.new), alpha=0.5) +
  facet_wrap(~State) +
  theme_classic() +
  #scale_y_log10() +
  labs(x = '') +
  scale_fill_manual(values=c('blue4','green4', 'grey60'))
ggsave('Figures/density_state.png', width=6, height=4, units='in', dpi=600)
