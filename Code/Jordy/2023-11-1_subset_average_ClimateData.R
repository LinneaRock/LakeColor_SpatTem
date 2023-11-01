require(tidyverse)
#read in data files, using spatial because more complete sites (TEMPORAL is subset)
climate<-readRDS("../climate_data.RDS")
load("../2023-10-19_SPATIAL_Limnosat_May_Oct_Lagos_Landcover.RData")

#subset climate data by the hu12_zoneids we have in the spatial dataframe
climate<-climate[climate$hu12_zoneid %in% unique(spatial$hu12_zoneid),]

#subset climate data by the years we have in limnosat
climate<-climate[climate$climate_year %in% unique(spatial$year),]

#order dataframe so that the final file is in order of hu12_zoneid and years
climate<-climate %>%
        arrange(hu12_zoneid,climate_year,climate_month)

# average climate data by MAAT and cumulative precipitation, also record the total number of months of observations

#create empty data frame with final, averaged dataset and column names that will match the limnosat dataframe (climate_year --> year)
climate_YrAvg<-data.frame(hu12_zoneid=character(), year=numeric(), yr_tmean_degc=numeric(), yr_cumu_ppt_mm=numeric(), num_months=numeric(), perc_datacovperc_less100=numeric()) #

i=1
j=1
for(i in 1:length(unique(climate$hu12_zoneid))){
        sub<-climate[climate$hu12_zoneid==unique(climate$hu12_zoneid)[i],]
        for(j in 1:length(unique(sub$climate_year))){
                sub2<-sub[sub$climate_year==(unique(sub$climate_year))[j],]
                climate_YrAvg<-rbind(climate_YrAvg, data.frame(hu12_zoneid=sub2$hu12_zoneid[1], year=sub2$climate_year[1], yr_tmean_degc=mean(sub2$climate_tmean_degc), yr_cumu_ppt_mm=sum(sub2$climate_ppt_mm), num_months=length(unique(sub2$climate_month)), perc_datacovperc_less100=1-(length(which(sub2==100))/nrow(sub2))))
        }
        print(i)
}


climate<-climate_YrAvg #overwrite starting climate dataframe

rm(list=setdiff(ls(), "climate"))
save.image(paste0("../",Sys.Date(),"_ClimateData_Temp_Precip_YrAvg.Rdata"))