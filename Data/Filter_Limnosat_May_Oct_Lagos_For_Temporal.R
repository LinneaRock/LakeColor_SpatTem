require(tidyverse)
load("2024-07-30_Limnosat_May_Oct_Lagos.RData")

#starting number of lakes
length(unique(limnosat_may_oct_lagos$lake_nhdid))


#############################################################################
#### Filter the sites x years by only those with at least 3 observations ####
#############################################################################
observations_bySite_byYear <- limnosat_may_oct_lagos %>%
        group_by(lake_nhdid, year) %>% 
        summarize(Count = n()) 
# unqiue sites and years
nrow(observations_bySite_byYear)


morethan3obsperyear<-observations_bySite_byYear[observations_bySite_byYear$Count>=3,]
#number of unique sites and years retained
nrow(morethan3obsperyear)

#% of unique sites and years
nrow(morethan3obsperyear)/nrow(observations_bySite_byYear)

#subset the main dataframe by the years and sites that have at least 3 observations
morethan3obsperyear$lake_year<-paste(morethan3obsperyear$lake_nhdid,morethan3obsperyear$year,sep="@")
head(morethan3obsperyear)
limnosat_may_oct_lagos$lake_year<-paste(limnosat_may_oct_lagos$lake_nhdid,limnosat_may_oct_lagos$year,sep="@")
limnosat_may_oct_lagos$lake_year[1:6]

#percent of observations lost
table(limnosat_may_oct_lagos$lake_year%in%morethan3obsperyear$lake_year) 

# starting number of observations
nrow(limnosat_may_oct_lagos)

limnosat_may_oct_lagos_3obs<-limnosat_may_oct_lagos[limnosat_may_oct_lagos$lake_year%in%morethan3obsperyear$lake_year,]
# observations after removing ones with 3 observations
nrow(limnosat_may_oct_lagos_3obs)



###########################################################################
#### Filter the sites by those with 30+ years of limnosat observations #### 
###########################################################################
unique_years_bySite <- limnosat_may_oct_lagos_3obs %>%
        group_by(lake_nhdid) %>%  # Group by lake
        summarize(Number_Years = n_distinct(year))  

head(unique_years_bySite)
Yrs30<-unique_years_bySite[unique_years_bySite$Number_Years>=30,]
#number of lakes with 30_ years of data
nrow(Yrs30)


limnosat_may_oct_lagos_30yrs<-limnosat_may_oct_lagos_3obs[limnosat_may_oct_lagos_3obs$lake_nhdid%in%Yrs30$lake_nhdid,]
# should match tne number of sites
length(unique(limnosat_may_oct_lagos_30yrs$lake_nhdid))


############################################################################
#### Filter the lakes that have observations no more than 5 years apart #### 
############################################################################
limnosat_may_oct_lagos_30yrs <-limnosat_may_oct_lagos_30yrs %>% 
        arrange(lake_nhdid, year)
lake_year<-limnosat_may_oct_lagos_30yrs%>%
        select(lake_nhdid, year,date) #this grabs date too even if you don't add it here
lake_year$date<-NULL
nrow(lake_year)

#lake years after distinct
lake_year<-distinct(lake_year)
nrow(lake_year)

#number of lakes
length(unique(lake_year$lake_nhdid))



lakes_rm<-NULL
i=1
j=1
for(i in 1:length(unique(lake_year$lake_nhdid))){
        sub<-lake_year[lake_year$lake_nhdid==unique(lake_year$lake_nhdid)[i],]
        for(j in 1:(nrow(sub)-1)){
                if(sub[j+1,]$year - sub[j,]$year > 5){
                        lakes_rm<-c(lakes_rm, as.character(sub[1,1]))   
                }
        }
        print(i)
}
save.image(paste0(Sys.Date(),"_TEMPORAL_Tempfile.RData"))

limnosat_may_oct_lagos_30Yr_3ObsYr_No5Yr<-limnosat_may_oct_lagos_30yrs[limnosat_may_oct_lagos_30yrs$lake_nhdid%in%setdiff(limnosat_may_oct_lagos_30yrs$lake_nhdid,lakes_rm),]


#how many lakes?
length(unique(limnosat_may_oct_lagos_30Yr_3ObsYr_No5Yr$lake_nhdid))


length(unique(limnosat_may_oct_lagos_30Yr_3ObsYr_No5Yr$lake_nhdid))/length(unique(limnosat_may_oct_lagos$lake_nhdid))


#rename to something short and easy to work with
limnosat<-limnosat_may_oct_lagos_30Yr_3ObsYr_No5Yr
write.csv(lakes_rm,"lakes_removed_5YearsNoData.csv")
rm(list=setdiff(ls(), "limnosat"))

write_rds(limnosat,paste0(Sys.Date(),"_Limnosat_Lagos.rds"))