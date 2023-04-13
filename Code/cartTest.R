source("Data/Call_data.R")



set.seed(42)

cart <- temporal %>% 
  filter()

train_d <- temporal %>%
  sample_frac(0.8) %>%
   mutate_if(is.numeric, round, digits=0) #%>%
  # rename("MAAT °C"=air_temp,
  #        "mean depth"=meandepth,
  #        "max. depth"=maxdepth,
  #        "watershed slope"=slope,
  #        WSA=ws_area)

#how many lakes in the training dataset?
# length(unique(train_d$Hylak_id))
test_d <- temporal %>%
  dplyr::filter(!lagoslakeid %in% train_d$lagoslakeid) %>%
  dplyr::select(-lagoslakeid,-dWL) %>%
  mutate_if(is.numeric, round, digits=0)#%>%
  # rename("MAAT °C"=air_temp,
  #        "mean depth"=meandepth,
  #        "max. depth"=maxdepth,
  #        "watershed slope"=slope,
  #        WSA=ws_area)
  
train_d <- train_d %>%
  dplyr::select(-lagoslakeid,-dWL) 

prune_mod <-caret::train(
    group ~., data = train_d, method = "rpart",
    trControl = trainControl("boot", number = 100),
    tuneLength = 100
    )

prune_mod
