
inUrl1  <- "https://pasta.lternet.edu/package/data/eml/edi/854/1/007ca4f5ec02bb5809fc661dcfa7a903" 
infile1 <- tempfile()
try(download.file(inUrl1,infile1,method="curl"))
if (is.na(file.size(infile1))) download.file(inUrl1,infile1,method="auto")


locus1 <-read.csv(infile1,header=F 
               ,skip=1
               ,sep=","  
               ,quot='"' 
               , col.names=c(
                 "lagoslakeid",     
                 "lake_nhdid",     
                 "lake_nhdfcode",     
                 "lake_nhdftype",     
                 "lake_reachcode",     
                 "lake_namegnis",     
                 "lake_namelagos",     
                 "lake_onlandborder",     
                 "lake_ismultipart",     
                 "lake_missingws",     
                 "lake_shapeflag",     
                 "lake_lat_decdeg",     
                 "lake_lon_decdeg",     
                 "lake_elevation_m",     
                 "lake_centroidstate",     
                 "lake_states",     
                 "lake_county",     
                 "lake_countyfips",     
                 "lake_huc12",     
                 "buff100_zoneid",     
                 "buff500_zoneid",     
                 "ws_zoneid",     
                 "nws_zoneid",     
                 "hu12_zoneid",     
                 "hu8_zoneid",     
                 "hu4_zoneid",     
                 "county_zoneid",     
                 "state_zoneid",     
                 "epanutr_zoneid",     
                 "omernik3_zoneid",     
                 "wwf_zoneid",     
                 "mlra_zoneid",     
                 "bailey_zoneid",     
                 "neon_zoneid"    ), check.names=TRUE)

unlink(infile1)

# Fix any interval or ratio columns mistakenly read in as nominal and nominal columns read as numeric or dates read as strings

if (class(locus1$lagoslakeid)=="factor") locus1$lagoslakeid <-as.numeric(levels(locus1$lagoslakeid))[as.integer(locus1$lagoslakeid) ]               
if (class(locus1$lagoslakeid)=="character") locus1$lagoslakeid <-as.numeric(locus1$lagoslakeid)
if (class(locus1$lake_nhdid)!="factor") locus1$lake_nhdid<- as.factor(locus1$lake_nhdid)
if (class(locus1$lake_nhdfcode)!="factor") locus1$lake_nhdfcode<- as.factor(locus1$lake_nhdfcode)
if (class(locus1$lake_nhdftype)!="factor") locus1$lake_nhdftype<- as.factor(locus1$lake_nhdftype)
if (class(locus1$lake_reachcode)!="factor") locus1$lake_reachcode<- as.factor(locus1$lake_reachcode)
if (class(locus1$lake_namegnis)!="factor") locus1$lake_namegnis<- as.factor(locus1$lake_namegnis)
if (class(locus1$lake_namelagos)!="factor") locus1$lake_namelagos<- as.factor(locus1$lake_namelagos)
if (class(locus1$lake_onlandborder)!="factor") locus1$lake_onlandborder<- as.factor(locus1$lake_onlandborder)
if (class(locus1$lake_ismultipart)!="factor") locus1$lake_ismultipart<- as.factor(locus1$lake_ismultipart)
if (class(locus1$lake_missingws)!="factor") locus1$lake_missingws<- as.factor(locus1$lake_missingws)
if (class(locus1$lake_shapeflag)!="factor") locus1$lake_shapeflag<- as.factor(locus1$lake_shapeflag)
if (class(locus1$lake_lat_decdeg)=="factor") locus1$lake_lat_decdeg <-as.numeric(levels(locus1$lake_lat_decdeg))[as.integer(locus1$lake_lat_decdeg) ]               
if (class(locus1$lake_lat_decdeg)=="character") locus1$lake_lat_decdeg <-as.numeric(locus1$lake_lat_decdeg)
if (class(locus1$lake_lon_decdeg)=="factor") locus1$lake_lon_decdeg <-as.numeric(levels(locus1$lake_lon_decdeg))[as.integer(locus1$lake_lon_decdeg) ]               
if (class(locus1$lake_lon_decdeg)=="character") locus1$lake_lon_decdeg <-as.numeric(locus1$lake_lon_decdeg)
if (class(locus1$lake_elevation_m)=="factor") locus1$lake_elevation_m <-as.numeric(levels(locus1$lake_elevation_m))[as.integer(locus1$lake_elevation_m) ]               
if (class(locus1$lake_elevation_m)=="character") locus1$lake_elevation_m <-as.numeric(locus1$lake_elevation_m)
if (class(locus1$lake_centroidstate)!="factor") locus1$lake_centroidstate<- as.factor(locus1$lake_centroidstate)
if (class(locus1$lake_states)!="factor") locus1$lake_states<- as.factor(locus1$lake_states)
if (class(locus1$lake_county)!="factor") locus1$lake_county<- as.factor(locus1$lake_county)
if (class(locus1$lake_countyfips)!="factor") locus1$lake_countyfips<- as.factor(locus1$lake_countyfips)
if (class(locus1$lake_huc12)!="factor") locus1$lake_huc12<- as.factor(locus1$lake_huc12)
if (class(locus1$buff100_zoneid)!="factor") locus1$buff100_zoneid<- as.factor(locus1$buff100_zoneid)
if (class(locus1$buff500_zoneid)!="factor") locus1$buff500_zoneid<- as.factor(locus1$buff500_zoneid)
if (class(locus1$ws_zoneid)!="factor") locus1$ws_zoneid<- as.factor(locus1$ws_zoneid)
if (class(locus1$nws_zoneid)!="factor") locus1$nws_zoneid<- as.factor(locus1$nws_zoneid)
if (class(locus1$hu12_zoneid)!="factor") locus1$hu12_zoneid<- as.factor(locus1$hu12_zoneid)
if (class(locus1$hu8_zoneid)!="factor") locus1$hu8_zoneid<- as.factor(locus1$hu8_zoneid)
if (class(locus1$hu4_zoneid)!="factor") locus1$hu4_zoneid<- as.factor(locus1$hu4_zoneid)
if (class(locus1$county_zoneid)!="factor") locus1$county_zoneid<- as.factor(locus1$county_zoneid)
if (class(locus1$state_zoneid)!="factor") locus1$state_zoneid<- as.factor(locus1$state_zoneid)
if (class(locus1$epanutr_zoneid)!="factor") locus1$epanutr_zoneid<- as.factor(locus1$epanutr_zoneid)
if (class(locus1$omernik3_zoneid)!="factor") locus1$omernik3_zoneid<- as.factor(locus1$omernik3_zoneid)
if (class(locus1$wwf_zoneid)!="factor") locus1$wwf_zoneid<- as.factor(locus1$wwf_zoneid)
if (class(locus1$mlra_zoneid)!="factor") locus1$mlra_zoneid<- as.factor(locus1$mlra_zoneid)
if (class(locus1$bailey_zoneid)!="factor") locus1$bailey_zoneid<- as.factor(locus1$bailey_zoneid)
if (class(locus1$neon_zoneid)!="factor") locus1$neon_zoneid<- as.factor(locus1$neon_zoneid)

# Convert Missing Values to NA for non-dates

locus1$lagoslakeid <- ifelse((trimws(as.character(locus1$lagoslakeid))==trimws("NA")),NA,locus1$lagoslakeid)               
suppressWarnings(locus1$lagoslakeid <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(locus1$lagoslakeid))==as.character(as.numeric("NA"))),NA,locus1$lagoslakeid))
locus1$lake_nhdid <- as.factor(ifelse((trimws(as.character(locus1$lake_nhdid))==trimws("NA")),NA,as.character(locus1$lake_nhdid)))
locus1$lake_nhdfcode <- as.factor(ifelse((trimws(as.character(locus1$lake_nhdfcode))==trimws("NA")),NA,as.character(locus1$lake_nhdfcode)))
locus1$lake_nhdftype <- as.factor(ifelse((trimws(as.character(locus1$lake_nhdftype))==trimws("NA")),NA,as.character(locus1$lake_nhdftype)))
locus1$lake_reachcode <- as.factor(ifelse((trimws(as.character(locus1$lake_reachcode))==trimws("NA")),NA,as.character(locus1$lake_reachcode)))
locus1$lake_namegnis <- as.factor(ifelse((trimws(as.character(locus1$lake_namegnis))==trimws("NA")),NA,as.character(locus1$lake_namegnis)))
locus1$lake_namelagos <- as.factor(ifelse((trimws(as.character(locus1$lake_namelagos))==trimws("NA")),NA,as.character(locus1$lake_namelagos)))
locus1$lake_onlandborder <- as.factor(ifelse((trimws(as.character(locus1$lake_onlandborder))==trimws("NA")),NA,as.character(locus1$lake_onlandborder)))
locus1$lake_ismultipart <- as.factor(ifelse((trimws(as.character(locus1$lake_ismultipart))==trimws("NA")),NA,as.character(locus1$lake_ismultipart)))
locus1$lake_missingws <- as.factor(ifelse((trimws(as.character(locus1$lake_missingws))==trimws("NA")),NA,as.character(locus1$lake_missingws)))
locus1$lake_shapeflag <- as.factor(ifelse((trimws(as.character(locus1$lake_shapeflag))==trimws("NA")),NA,as.character(locus1$lake_shapeflag)))
locus1$lake_lat_decdeg <- ifelse((trimws(as.character(locus1$lake_lat_decdeg))==trimws("NA")),NA,locus1$lake_lat_decdeg)               
suppressWarnings(locus1$lake_lat_decdeg <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(locus1$lake_lat_decdeg))==as.character(as.numeric("NA"))),NA,locus1$lake_lat_decdeg))
locus1$lake_lon_decdeg <- ifelse((trimws(as.character(locus1$lake_lon_decdeg))==trimws("NA")),NA,locus1$lake_lon_decdeg)               
suppressWarnings(locus1$lake_lon_decdeg <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(locus1$lake_lon_decdeg))==as.character(as.numeric("NA"))),NA,locus1$lake_lon_decdeg))
locus1$lake_elevation_m <- ifelse((trimws(as.character(locus1$lake_elevation_m))==trimws("NA")),NA,locus1$lake_elevation_m)               
suppressWarnings(locus1$lake_elevation_m <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(locus1$lake_elevation_m))==as.character(as.numeric("NA"))),NA,locus1$lake_elevation_m))
locus1$lake_centroidstate <- as.factor(ifelse((trimws(as.character(locus1$lake_centroidstate))==trimws("NA")),NA,as.character(locus1$lake_centroidstate)))
locus1$lake_states <- as.factor(ifelse((trimws(as.character(locus1$lake_states))==trimws("NA")),NA,as.character(locus1$lake_states)))
locus1$lake_county <- as.factor(ifelse((trimws(as.character(locus1$lake_county))==trimws("NA")),NA,as.character(locus1$lake_county)))
locus1$lake_countyfips <- as.factor(ifelse((trimws(as.character(locus1$lake_countyfips))==trimws("NA")),NA,as.character(locus1$lake_countyfips)))
locus1$lake_huc12 <- as.factor(ifelse((trimws(as.character(locus1$lake_huc12))==trimws("NA")),NA,as.character(locus1$lake_huc12)))
locus1$buff100_zoneid <- as.factor(ifelse((trimws(as.character(locus1$buff100_zoneid))==trimws("NA")),NA,as.character(locus1$buff100_zoneid)))
locus1$buff500_zoneid <- as.factor(ifelse((trimws(as.character(locus1$buff500_zoneid))==trimws("NA")),NA,as.character(locus1$buff500_zoneid)))
locus1$ws_zoneid <- as.factor(ifelse((trimws(as.character(locus1$ws_zoneid))==trimws("NA")),NA,as.character(locus1$ws_zoneid)))
locus1$nws_zoneid <- as.factor(ifelse((trimws(as.character(locus1$nws_zoneid))==trimws("NA")),NA,as.character(locus1$nws_zoneid)))
locus1$hu12_zoneid <- as.factor(ifelse((trimws(as.character(locus1$hu12_zoneid))==trimws("NA")),NA,as.character(locus1$hu12_zoneid)))
locus1$hu8_zoneid <- as.factor(ifelse((trimws(as.character(locus1$hu8_zoneid))==trimws("NA")),NA,as.character(locus1$hu8_zoneid)))
locus1$hu4_zoneid <- as.factor(ifelse((trimws(as.character(locus1$hu4_zoneid))==trimws("NA")),NA,as.character(locus1$hu4_zoneid)))
locus1$county_zoneid <- as.factor(ifelse((trimws(as.character(locus1$county_zoneid))==trimws("NA")),NA,as.character(locus1$county_zoneid)))
locus1$state_zoneid <- as.factor(ifelse((trimws(as.character(locus1$state_zoneid))==trimws("NA")),NA,as.character(locus1$state_zoneid)))
locus1$epanutr_zoneid <- as.factor(ifelse((trimws(as.character(locus1$epanutr_zoneid))==trimws("NA")),NA,as.character(locus1$epanutr_zoneid)))
locus1$omernik3_zoneid <- as.factor(ifelse((trimws(as.character(locus1$omernik3_zoneid))==trimws("NA")),NA,as.character(locus1$omernik3_zoneid)))
locus1$wwf_zoneid <- as.factor(ifelse((trimws(as.character(locus1$wwf_zoneid))==trimws("NA")),NA,as.character(locus1$wwf_zoneid)))
locus1$mlra_zoneid <- as.factor(ifelse((trimws(as.character(locus1$mlra_zoneid))==trimws("NA")),NA,as.character(locus1$mlra_zoneid)))
locus1$bailey_zoneid <- as.factor(ifelse((trimws(as.character(locus1$bailey_zoneid))==trimws("NA")),NA,as.character(locus1$bailey_zoneid)))
locus1$neon_zoneid <- as.factor(ifelse((trimws(as.character(locus1$neon_zoneid))==trimws("NA")),NA,as.character(locus1$neon_zoneid)))


# Here is the structure of the input data frame:
str(locus1)                            
attach(locus1)                            
# The analyses below are basic descriptions of the variables. After testing, they should be replaced.                 

summary(lagoslakeid)
summary(lake_nhdid)
summary(lake_nhdfcode)
summary(lake_nhdftype)
summary(lake_reachcode)
summary(lake_namegnis)
summary(lake_namelagos)
summary(lake_onlandborder)
summary(lake_ismultipart)
summary(lake_missingws)
summary(lake_shapeflag)
summary(lake_lat_decdeg)
summary(lake_lon_decdeg)
summary(lake_elevation_m)
summary(lake_centroidstate)
summary(lake_states)
summary(lake_county)
summary(lake_countyfips)
summary(lake_huc12)
summary(buff100_zoneid)
summary(buff500_zoneid)
summary(ws_zoneid)
summary(nws_zoneid)
summary(hu12_zoneid)
summary(hu8_zoneid)
summary(hu4_zoneid)
summary(county_zoneid)
summary(state_zoneid)
summary(epanutr_zoneid)
summary(omernik3_zoneid)
summary(wwf_zoneid)
summary(mlra_zoneid)
summary(bailey_zoneid)
summary(neon_zoneid) 
# Get more details on character variables

summary(as.factor(locus1$lake_nhdid)) 
summary(as.factor(locus1$lake_nhdfcode)) 
summary(as.factor(locus1$lake_nhdftype)) 
summary(as.factor(locus1$lake_reachcode)) 
summary(as.factor(locus1$lake_namegnis)) 
summary(as.factor(locus1$lake_namelagos)) 
summary(as.factor(locus1$lake_onlandborder)) 
summary(as.factor(locus1$lake_ismultipart)) 
summary(as.factor(locus1$lake_missingws)) 
summary(as.factor(locus1$lake_shapeflag)) 
summary(as.factor(locus1$lake_centroidstate)) 
summary(as.factor(locus1$lake_states)) 
summary(as.factor(locus1$lake_county)) 
summary(as.factor(locus1$lake_countyfips)) 
summary(as.factor(locus1$lake_huc12)) 
summary(as.factor(locus1$buff100_zoneid)) 
summary(as.factor(locus1$buff500_zoneid)) 
summary(as.factor(locus1$ws_zoneid)) 
summary(as.factor(locus1$nws_zoneid)) 
summary(as.factor(locus1$hu12_zoneid)) 
summary(as.factor(locus1$hu8_zoneid)) 
summary(as.factor(locus1$hu4_zoneid)) 
summary(as.factor(locus1$county_zoneid)) 
summary(as.factor(locus1$state_zoneid)) 
summary(as.factor(locus1$epanutr_zoneid)) 
summary(as.factor(locus1$omernik3_zoneid)) 
summary(as.factor(locus1$wwf_zoneid)) 
summary(as.factor(locus1$mlra_zoneid)) 
summary(as.factor(locus1$bailey_zoneid)) 
summary(as.factor(locus1$neon_zoneid))
detach(locus1)               


inUrl2  <- "https://pasta.lternet.edu/package/data/eml/edi/854/1/fd7fe936d290a12bc6dbf5c41047849e" 
infile2 <- tempfile()
try(download.file(inUrl2,infile2,method="curl"))
if (is.na(file.size(infile2))) download.file(inUrl2,infile2,method="auto")


locus2 <-read.csv(infile2,header=F 
               ,skip=1
               ,sep=","  
               ,quot='"' 
               , col.names=c(
                 "lagoslakeid",     
                 "lake_waterarea_ha",     
                 "lake_totalarea_ha",     
                 "lake_islandarea_ha",     
                 "lake_perimeter_m",     
                 "lake_islandperimeter_m",     
                 "lake_shorelinedevfactor",     
                 "lake_mbgconhull_length_m",     
                 "lake_mbgconhull_width_m",     
                 "lake_mbgconhull_orientation_deg",     
                 "lake_mbgrect_length_m",     
                 "lake_mbgrect_width_m",     
                 "lake_mbgrect_arearatio",     
                 "lake_meanwidth_m",     
                 "lake_connectivity_class",     
                 "lake_connectivity_fluctuates",     
                 "lake_connectivity_permanent",     
                 "lake_lakes4ha_upstream_ha",     
                 "lake_lakes4ha_upstream_n",     
                 "lake_lakes1ha_upstream_ha",     
                 "lake_lakes1ha_upstream_n",     
                 "lake_lakes10ha_upstream_n",     
                 "lake_lakes10ha_upstream_ha",     
                 "lake_glaciatedlatewisc"    ), check.names=TRUE)

unlink(infile2)

# Fix any interval or ratio columns mistakenly read in as nominal and nominal columns read as numeric or dates read as strings

if (class(locus2$lagoslakeid)=="factor") locus2$lagoslakeid <-as.numeric(levels(locus2$lagoslakeid))[as.integer(locus2$lagoslakeid) ]               
if (class(locus2$lagoslakeid)=="character") locus2$lagoslakeid <-as.numeric(locus2$lagoslakeid)
if (class(locus2$lake_waterarea_ha)=="factor") locus2$lake_waterarea_ha <-as.numeric(levels(locus2$lake_waterarea_ha))[as.integer(locus2$lake_waterarea_ha) ]               
if (class(locus2$lake_waterarea_ha)=="character") locus2$lake_waterarea_ha <-as.numeric(locus2$lake_waterarea_ha)
if (class(locus2$lake_totalarea_ha)=="factor") locus2$lake_totalarea_ha <-as.numeric(levels(locus2$lake_totalarea_ha))[as.integer(locus2$lake_totalarea_ha) ]               
if (class(locus2$lake_totalarea_ha)=="character") locus2$lake_totalarea_ha <-as.numeric(locus2$lake_totalarea_ha)
if (class(locus2$lake_islandarea_ha)=="factor") locus2$lake_islandarea_ha <-as.numeric(levels(locus2$lake_islandarea_ha))[as.integer(locus2$lake_islandarea_ha) ]               
if (class(locus2$lake_islandarea_ha)=="character") locus2$lake_islandarea_ha <-as.numeric(locus2$lake_islandarea_ha)
if (class(locus2$lake_perimeter_m)=="factor") locus2$lake_perimeter_m <-as.numeric(levels(locus2$lake_perimeter_m))[as.integer(locus2$lake_perimeter_m) ]               
if (class(locus2$lake_perimeter_m)=="character") locus2$lake_perimeter_m <-as.numeric(locus2$lake_perimeter_m)
if (class(locus2$lake_islandperimeter_m)=="factor") locus2$lake_islandperimeter_m <-as.numeric(levels(locus2$lake_islandperimeter_m))[as.integer(locus2$lake_islandperimeter_m) ]               
if (class(locus2$lake_islandperimeter_m)=="character") locus2$lake_islandperimeter_m <-as.numeric(locus2$lake_islandperimeter_m)
if (class(locus2$lake_shorelinedevfactor)=="factor") locus2$lake_shorelinedevfactor <-as.numeric(levels(locus2$lake_shorelinedevfactor))[as.integer(locus2$lake_shorelinedevfactor) ]               
if (class(locus2$lake_shorelinedevfactor)=="character") locus2$lake_shorelinedevfactor <-as.numeric(locus2$lake_shorelinedevfactor)
if (class(locus2$lake_mbgconhull_length_m)=="factor") locus2$lake_mbgconhull_length_m <-as.numeric(levels(locus2$lake_mbgconhull_length_m))[as.integer(locus2$lake_mbgconhull_length_m) ]               
if (class(locus2$lake_mbgconhull_length_m)=="character") locus2$lake_mbgconhull_length_m <-as.numeric(locus2$lake_mbgconhull_length_m)
if (class(locus2$lake_mbgconhull_width_m)=="factor") locus2$lake_mbgconhull_width_m <-as.numeric(levels(locus2$lake_mbgconhull_width_m))[as.integer(locus2$lake_mbgconhull_width_m) ]               
if (class(locus2$lake_mbgconhull_width_m)=="character") locus2$lake_mbgconhull_width_m <-as.numeric(locus2$lake_mbgconhull_width_m)
if (class(locus2$lake_mbgconhull_orientation_deg)=="factor") locus2$lake_mbgconhull_orientation_deg <-as.numeric(levels(locus2$lake_mbgconhull_orientation_deg))[as.integer(locus2$lake_mbgconhull_orientation_deg) ]               
if (class(locus2$lake_mbgconhull_orientation_deg)=="character") locus2$lake_mbgconhull_orientation_deg <-as.numeric(locus2$lake_mbgconhull_orientation_deg)
if (class(locus2$lake_mbgrect_length_m)=="factor") locus2$lake_mbgrect_length_m <-as.numeric(levels(locus2$lake_mbgrect_length_m))[as.integer(locus2$lake_mbgrect_length_m) ]               
if (class(locus2$lake_mbgrect_length_m)=="character") locus2$lake_mbgrect_length_m <-as.numeric(locus2$lake_mbgrect_length_m)
if (class(locus2$lake_mbgrect_width_m)=="factor") locus2$lake_mbgrect_width_m <-as.numeric(levels(locus2$lake_mbgrect_width_m))[as.integer(locus2$lake_mbgrect_width_m) ]               
if (class(locus2$lake_mbgrect_width_m)=="character") locus2$lake_mbgrect_width_m <-as.numeric(locus2$lake_mbgrect_width_m)
if (class(locus2$lake_mbgrect_arearatio)=="factor") locus2$lake_mbgrect_arearatio <-as.numeric(levels(locus2$lake_mbgrect_arearatio))[as.integer(locus2$lake_mbgrect_arearatio) ]               
if (class(locus2$lake_mbgrect_arearatio)=="character") locus2$lake_mbgrect_arearatio <-as.numeric(locus2$lake_mbgrect_arearatio)
if (class(locus2$lake_meanwidth_m)=="factor") locus2$lake_meanwidth_m <-as.numeric(levels(locus2$lake_meanwidth_m))[as.integer(locus2$lake_meanwidth_m) ]               
if (class(locus2$lake_meanwidth_m)=="character") locus2$lake_meanwidth_m <-as.numeric(locus2$lake_meanwidth_m)
if (class(locus2$lake_connectivity_class)!="factor") locus2$lake_connectivity_class<- as.factor(locus2$lake_connectivity_class)
if (class(locus2$lake_connectivity_fluctuates)!="factor") locus2$lake_connectivity_fluctuates<- as.factor(locus2$lake_connectivity_fluctuates)
if (class(locus2$lake_connectivity_permanent)!="factor") locus2$lake_connectivity_permanent<- as.factor(locus2$lake_connectivity_permanent)
if (class(locus2$lake_lakes4ha_upstream_ha)=="factor") locus2$lake_lakes4ha_upstream_ha <-as.numeric(levels(locus2$lake_lakes4ha_upstream_ha))[as.integer(locus2$lake_lakes4ha_upstream_ha) ]               
if (class(locus2$lake_lakes4ha_upstream_ha)=="character") locus2$lake_lakes4ha_upstream_ha <-as.numeric(locus2$lake_lakes4ha_upstream_ha)
if (class(locus2$lake_lakes4ha_upstream_n)=="factor") locus2$lake_lakes4ha_upstream_n <-as.numeric(levels(locus2$lake_lakes4ha_upstream_n))[as.integer(locus2$lake_lakes4ha_upstream_n) ]               
if (class(locus2$lake_lakes4ha_upstream_n)=="character") locus2$lake_lakes4ha_upstream_n <-as.numeric(locus2$lake_lakes4ha_upstream_n)
if (class(locus2$lake_lakes1ha_upstream_ha)=="factor") locus2$lake_lakes1ha_upstream_ha <-as.numeric(levels(locus2$lake_lakes1ha_upstream_ha))[as.integer(locus2$lake_lakes1ha_upstream_ha) ]               
if (class(locus2$lake_lakes1ha_upstream_ha)=="character") locus2$lake_lakes1ha_upstream_ha <-as.numeric(locus2$lake_lakes1ha_upstream_ha)
if (class(locus2$lake_lakes1ha_upstream_n)=="factor") locus2$lake_lakes1ha_upstream_n <-as.numeric(levels(locus2$lake_lakes1ha_upstream_n))[as.integer(locus2$lake_lakes1ha_upstream_n) ]               
if (class(locus2$lake_lakes1ha_upstream_n)=="character") locus2$lake_lakes1ha_upstream_n <-as.numeric(locus2$lake_lakes1ha_upstream_n)
if (class(locus2$lake_lakes10ha_upstream_n)=="factor") locus2$lake_lakes10ha_upstream_n <-as.numeric(levels(locus2$lake_lakes10ha_upstream_n))[as.integer(locus2$lake_lakes10ha_upstream_n) ]               
if (class(locus2$lake_lakes10ha_upstream_n)=="character") locus2$lake_lakes10ha_upstream_n <-as.numeric(locus2$lake_lakes10ha_upstream_n)
if (class(locus2$lake_lakes10ha_upstream_ha)=="factor") locus2$lake_lakes10ha_upstream_ha <-as.numeric(levels(locus2$lake_lakes10ha_upstream_ha))[as.integer(locus2$lake_lakes10ha_upstream_ha) ]               
if (class(locus2$lake_lakes10ha_upstream_ha)=="character") locus2$lake_lakes10ha_upstream_ha <-as.numeric(locus2$lake_lakes10ha_upstream_ha)
if (class(locus2$lake_glaciatedlatewisc)!="factor") locus2$lake_glaciatedlatewisc<- as.factor(locus2$lake_glaciatedlatewisc)

# Convert Missing Values to NA for non-dates

locus2$lagoslakeid <- ifelse((trimws(as.character(locus2$lagoslakeid))==trimws("NA")),NA,locus2$lagoslakeid)               
suppressWarnings(locus2$lagoslakeid <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(locus2$lagoslakeid))==as.character(as.numeric("NA"))),NA,locus2$lagoslakeid))
locus2$lake_waterarea_ha <- ifelse((trimws(as.character(locus2$lake_waterarea_ha))==trimws("NA")),NA,locus2$lake_waterarea_ha)               
suppressWarnings(locus2$lake_waterarea_ha <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(locus2$lake_waterarea_ha))==as.character(as.numeric("NA"))),NA,locus2$lake_waterarea_ha))
locus2$lake_totalarea_ha <- ifelse((trimws(as.character(locus2$lake_totalarea_ha))==trimws("NA")),NA,locus2$lake_totalarea_ha)               
suppressWarnings(locus2$lake_totalarea_ha <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(locus2$lake_totalarea_ha))==as.character(as.numeric("NA"))),NA,locus2$lake_totalarea_ha))
locus2$lake_islandarea_ha <- ifelse((trimws(as.character(locus2$lake_islandarea_ha))==trimws("NA")),NA,locus2$lake_islandarea_ha)               
suppressWarnings(locus2$lake_islandarea_ha <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(locus2$lake_islandarea_ha))==as.character(as.numeric("NA"))),NA,locus2$lake_islandarea_ha))
locus2$lake_perimeter_m <- ifelse((trimws(as.character(locus2$lake_perimeter_m))==trimws("NA")),NA,locus2$lake_perimeter_m)               
suppressWarnings(locus2$lake_perimeter_m <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(locus2$lake_perimeter_m))==as.character(as.numeric("NA"))),NA,locus2$lake_perimeter_m))
locus2$lake_islandperimeter_m <- ifelse((trimws(as.character(locus2$lake_islandperimeter_m))==trimws("NA")),NA,locus2$lake_islandperimeter_m)               
suppressWarnings(locus2$lake_islandperimeter_m <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(locus2$lake_islandperimeter_m))==as.character(as.numeric("NA"))),NA,locus2$lake_islandperimeter_m))
locus2$lake_shorelinedevfactor <- ifelse((trimws(as.character(locus2$lake_shorelinedevfactor))==trimws("NA")),NA,locus2$lake_shorelinedevfactor)               
suppressWarnings(locus2$lake_shorelinedevfactor <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(locus2$lake_shorelinedevfactor))==as.character(as.numeric("NA"))),NA,locus2$lake_shorelinedevfactor))
locus2$lake_mbgconhull_length_m <- ifelse((trimws(as.character(locus2$lake_mbgconhull_length_m))==trimws("NA")),NA,locus2$lake_mbgconhull_length_m)               
suppressWarnings(locus2$lake_mbgconhull_length_m <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(locus2$lake_mbgconhull_length_m))==as.character(as.numeric("NA"))),NA,locus2$lake_mbgconhull_length_m))
locus2$lake_mbgconhull_width_m <- ifelse((trimws(as.character(locus2$lake_mbgconhull_width_m))==trimws("NA")),NA,locus2$lake_mbgconhull_width_m)               
suppressWarnings(locus2$lake_mbgconhull_width_m <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(locus2$lake_mbgconhull_width_m))==as.character(as.numeric("NA"))),NA,locus2$lake_mbgconhull_width_m))
locus2$lake_mbgconhull_orientation_deg <- ifelse((trimws(as.character(locus2$lake_mbgconhull_orientation_deg))==trimws("NA")),NA,locus2$lake_mbgconhull_orientation_deg)               
suppressWarnings(locus2$lake_mbgconhull_orientation_deg <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(locus2$lake_mbgconhull_orientation_deg))==as.character(as.numeric("NA"))),NA,locus2$lake_mbgconhull_orientation_deg))
locus2$lake_mbgrect_length_m <- ifelse((trimws(as.character(locus2$lake_mbgrect_length_m))==trimws("NA")),NA,locus2$lake_mbgrect_length_m)               
suppressWarnings(locus2$lake_mbgrect_length_m <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(locus2$lake_mbgrect_length_m))==as.character(as.numeric("NA"))),NA,locus2$lake_mbgrect_length_m))
locus2$lake_mbgrect_width_m <- ifelse((trimws(as.character(locus2$lake_mbgrect_width_m))==trimws("NA")),NA,locus2$lake_mbgrect_width_m)               
suppressWarnings(locus2$lake_mbgrect_width_m <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(locus2$lake_mbgrect_width_m))==as.character(as.numeric("NA"))),NA,locus2$lake_mbgrect_width_m))
locus2$lake_mbgrect_arearatio <- ifelse((trimws(as.character(locus2$lake_mbgrect_arearatio))==trimws("NA")),NA,locus2$lake_mbgrect_arearatio)               
suppressWarnings(locus2$lake_mbgrect_arearatio <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(locus2$lake_mbgrect_arearatio))==as.character(as.numeric("NA"))),NA,locus2$lake_mbgrect_arearatio))
locus2$lake_meanwidth_m <- ifelse((trimws(as.character(locus2$lake_meanwidth_m))==trimws("NA")),NA,locus2$lake_meanwidth_m)               
suppressWarnings(locus2$lake_meanwidth_m <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(locus2$lake_meanwidth_m))==as.character(as.numeric("NA"))),NA,locus2$lake_meanwidth_m))
locus2$lake_connectivity_class <- as.factor(ifelse((trimws(as.character(locus2$lake_connectivity_class))==trimws("NA")),NA,as.character(locus2$lake_connectivity_class)))
locus2$lake_connectivity_fluctuates <- as.factor(ifelse((trimws(as.character(locus2$lake_connectivity_fluctuates))==trimws("NA")),NA,as.character(locus2$lake_connectivity_fluctuates)))
locus2$lake_connectivity_permanent <- as.factor(ifelse((trimws(as.character(locus2$lake_connectivity_permanent))==trimws("NA")),NA,as.character(locus2$lake_connectivity_permanent)))
locus2$lake_lakes4ha_upstream_ha <- ifelse((trimws(as.character(locus2$lake_lakes4ha_upstream_ha))==trimws("NA")),NA,locus2$lake_lakes4ha_upstream_ha)               
suppressWarnings(locus2$lake_lakes4ha_upstream_ha <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(locus2$lake_lakes4ha_upstream_ha))==as.character(as.numeric("NA"))),NA,locus2$lake_lakes4ha_upstream_ha))
locus2$lake_lakes4ha_upstream_n <- ifelse((trimws(as.character(locus2$lake_lakes4ha_upstream_n))==trimws("NA")),NA,locus2$lake_lakes4ha_upstream_n)               
suppressWarnings(locus2$lake_lakes4ha_upstream_n <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(locus2$lake_lakes4ha_upstream_n))==as.character(as.numeric("NA"))),NA,locus2$lake_lakes4ha_upstream_n))
locus2$lake_lakes1ha_upstream_ha <- ifelse((trimws(as.character(locus2$lake_lakes1ha_upstream_ha))==trimws("NA")),NA,locus2$lake_lakes1ha_upstream_ha)               
suppressWarnings(locus2$lake_lakes1ha_upstream_ha <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(locus2$lake_lakes1ha_upstream_ha))==as.character(as.numeric("NA"))),NA,locus2$lake_lakes1ha_upstream_ha))
locus2$lake_lakes1ha_upstream_n <- ifelse((trimws(as.character(locus2$lake_lakes1ha_upstream_n))==trimws("NA")),NA,locus2$lake_lakes1ha_upstream_n)               
suppressWarnings(locus2$lake_lakes1ha_upstream_n <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(locus2$lake_lakes1ha_upstream_n))==as.character(as.numeric("NA"))),NA,locus2$lake_lakes1ha_upstream_n))
locus2$lake_lakes10ha_upstream_n <- ifelse((trimws(as.character(locus2$lake_lakes10ha_upstream_n))==trimws("NA")),NA,locus2$lake_lakes10ha_upstream_n)               
suppressWarnings(locus2$lake_lakes10ha_upstream_n <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(locus2$lake_lakes10ha_upstream_n))==as.character(as.numeric("NA"))),NA,locus2$lake_lakes10ha_upstream_n))
locus2$lake_lakes10ha_upstream_ha <- ifelse((trimws(as.character(locus2$lake_lakes10ha_upstream_ha))==trimws("NA")),NA,locus2$lake_lakes10ha_upstream_ha)               
suppressWarnings(locus2$lake_lakes10ha_upstream_ha <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(locus2$lake_lakes10ha_upstream_ha))==as.character(as.numeric("NA"))),NA,locus2$lake_lakes10ha_upstream_ha))
locus2$lake_glaciatedlatewisc <- as.factor(ifelse((trimws(as.character(locus2$lake_glaciatedlatewisc))==trimws("NA")),NA,as.character(locus2$lake_glaciatedlatewisc)))


# Here is the structure of the input data frame:
str(locus2)                            
attach(locus2)                            
# The analyses below are basic descriptions of the variables. After testing, they should be replaced.                 

summary(lagoslakeid)
summary(lake_waterarea_ha)
summary(lake_totalarea_ha)
summary(lake_islandarea_ha)
summary(lake_perimeter_m)
summary(lake_islandperimeter_m)
summary(lake_shorelinedevfactor)
summary(lake_mbgconhull_length_m)
summary(lake_mbgconhull_width_m)
summary(lake_mbgconhull_orientation_deg)
summary(lake_mbgrect_length_m)
summary(lake_mbgrect_width_m)
summary(lake_mbgrect_arearatio)
summary(lake_meanwidth_m)
summary(lake_connectivity_class)
summary(lake_connectivity_fluctuates)
summary(lake_connectivity_permanent)
summary(lake_lakes4ha_upstream_ha)
summary(lake_lakes4ha_upstream_n)
summary(lake_lakes1ha_upstream_ha)
summary(lake_lakes1ha_upstream_n)
summary(lake_lakes10ha_upstream_n)
summary(lake_lakes10ha_upstream_ha)
summary(lake_glaciatedlatewisc) 
# Get more details on character variables

summary(as.factor(locus2$lake_connectivity_class)) 
summary(as.factor(locus2$lake_connectivity_fluctuates)) 
summary(as.factor(locus2$lake_connectivity_permanent)) 
summary(as.factor(locus2$lake_glaciatedlatewisc))
detach(locus2)               


inUrl3  <- "https://pasta.lternet.edu/package/data/eml/edi/854/1/8bd86b94234a21a74991eca7bd9ab883" 
infile3 <- tempfile()
try(download.file(inUrl3,infile3,method="curl"))
if (is.na(file.size(infile3))) download.file(inUrl3,infile3,method="auto")


locus3 <-read.csv(infile3,header=F 
               ,skip=1
               ,sep=","  
               ,quot='"' 
               , col.names=c(
                 "lagoslakeid",     
                 "ws_zoneid",     
                 "nws_zoneid",     
                 "ws_subtype",     
                 "ws_equalsnws",     
                 "ws_onlandborder",     
                 "ws_oncoast",     
                 "ws_inusa_pct",     
                 "ws_includeshu4inlet",     
                 "ws_ismultipart",     
                 "ws_sliverflag",     
                 "nws_onlandborder",     
                 "nws_oncoast",     
                 "nws_inusa_pct",     
                 "nws_includeshu4inlet",     
                 "nws_ismultipart",     
                 "ws_states",     
                 "ws_focallakewaterarea_ha",     
                 "ws_area_ha",     
                 "ws_perimeter_m",     
                 "ws_lake_arearatio",     
                 "ws_mbgconhull_length_m",     
                 "ws_mbgconhull_width_m",     
                 "ws_mbgconhull_orientation_deg",     
                 "ws_meanwidth_m",     
                 "ws_lat_decdeg",     
                 "ws_lon_decdeg",     
                 "nws_states",     
                 "nws_focallakewaterarea_ha",     
                 "nws_area_ha",     
                 "nws_perimeter_m",     
                 "nws_lake_arearatio",     
                 "nws_mbgconhull_length_m",     
                 "nws_mbgconhull_width_m",     
                 "nws_mbgconhull_orientation_deg",     
                 "nws_meanwidth_m",     
                 "nws_lat_decdeg",     
                 "nws_lon_decdeg"    ), check.names=TRUE)

unlink(infile3)

# Fix any interval or ratio columns mistakenly read in as nominal and nominal columns read as numeric or dates read as strings

if (class(locus3$lagoslakeid)=="factor") locus3$lagoslakeid <-as.numeric(levels(locus3$lagoslakeid))[as.integer(locus3$lagoslakeid) ]               
if (class(locus3$lagoslakeid)=="character") locus3$lagoslakeid <-as.numeric(locus3$lagoslakeid)
if (class(locus3$ws_zoneid)!="factor") locus3$ws_zoneid<- as.factor(locus3$ws_zoneid)
if (class(locus3$nws_zoneid)!="factor") locus3$nws_zoneid<- as.factor(locus3$nws_zoneid)
if (class(locus3$ws_subtype)!="factor") locus3$ws_subtype<- as.factor(locus3$ws_subtype)
if (class(locus3$ws_equalsnws)!="factor") locus3$ws_equalsnws<- as.factor(locus3$ws_equalsnws)
if (class(locus3$ws_onlandborder)!="factor") locus3$ws_onlandborder<- as.factor(locus3$ws_onlandborder)
if (class(locus3$ws_oncoast)!="factor") locus3$ws_oncoast<- as.factor(locus3$ws_oncoast)
if (class(locus3$ws_inusa_pct)=="factor") locus3$ws_inusa_pct <-as.numeric(levels(locus3$ws_inusa_pct))[as.integer(locus3$ws_inusa_pct) ]               
if (class(locus3$ws_inusa_pct)=="character") locus3$ws_inusa_pct <-as.numeric(locus3$ws_inusa_pct)
if (class(locus3$ws_includeshu4inlet)!="factor") locus3$ws_includeshu4inlet<- as.factor(locus3$ws_includeshu4inlet)
if (class(locus3$ws_ismultipart)!="factor") locus3$ws_ismultipart<- as.factor(locus3$ws_ismultipart)
if (class(locus3$ws_sliverflag)!="factor") locus3$ws_sliverflag<- as.factor(locus3$ws_sliverflag)
if (class(locus3$nws_onlandborder)!="factor") locus3$nws_onlandborder<- as.factor(locus3$nws_onlandborder)
if (class(locus3$nws_oncoast)!="factor") locus3$nws_oncoast<- as.factor(locus3$nws_oncoast)
if (class(locus3$nws_inusa_pct)=="factor") locus3$nws_inusa_pct <-as.numeric(levels(locus3$nws_inusa_pct))[as.integer(locus3$nws_inusa_pct) ]               
if (class(locus3$nws_inusa_pct)=="character") locus3$nws_inusa_pct <-as.numeric(locus3$nws_inusa_pct)
if (class(locus3$nws_includeshu4inlet)!="factor") locus3$nws_includeshu4inlet<- as.factor(locus3$nws_includeshu4inlet)
if (class(locus3$nws_ismultipart)!="factor") locus3$nws_ismultipart<- as.factor(locus3$nws_ismultipart)
if (class(locus3$ws_states)!="factor") locus3$ws_states<- as.factor(locus3$ws_states)
if (class(locus3$ws_focallakewaterarea_ha)=="factor") locus3$ws_focallakewaterarea_ha <-as.numeric(levels(locus3$ws_focallakewaterarea_ha))[as.integer(locus3$ws_focallakewaterarea_ha) ]               
if (class(locus3$ws_focallakewaterarea_ha)=="character") locus3$ws_focallakewaterarea_ha <-as.numeric(locus3$ws_focallakewaterarea_ha)
if (class(locus3$ws_area_ha)=="factor") locus3$ws_area_ha <-as.numeric(levels(locus3$ws_area_ha))[as.integer(locus3$ws_area_ha) ]               
if (class(locus3$ws_area_ha)=="character") locus3$ws_area_ha <-as.numeric(locus3$ws_area_ha)
if (class(locus3$ws_perimeter_m)=="factor") locus3$ws_perimeter_m <-as.numeric(levels(locus3$ws_perimeter_m))[as.integer(locus3$ws_perimeter_m) ]               
if (class(locus3$ws_perimeter_m)=="character") locus3$ws_perimeter_m <-as.numeric(locus3$ws_perimeter_m)
if (class(locus3$ws_lake_arearatio)=="factor") locus3$ws_lake_arearatio <-as.numeric(levels(locus3$ws_lake_arearatio))[as.integer(locus3$ws_lake_arearatio) ]               
if (class(locus3$ws_lake_arearatio)=="character") locus3$ws_lake_arearatio <-as.numeric(locus3$ws_lake_arearatio)
if (class(locus3$ws_mbgconhull_length_m)=="factor") locus3$ws_mbgconhull_length_m <-as.numeric(levels(locus3$ws_mbgconhull_length_m))[as.integer(locus3$ws_mbgconhull_length_m) ]               
if (class(locus3$ws_mbgconhull_length_m)=="character") locus3$ws_mbgconhull_length_m <-as.numeric(locus3$ws_mbgconhull_length_m)
if (class(locus3$ws_mbgconhull_width_m)=="factor") locus3$ws_mbgconhull_width_m <-as.numeric(levels(locus3$ws_mbgconhull_width_m))[as.integer(locus3$ws_mbgconhull_width_m) ]               
if (class(locus3$ws_mbgconhull_width_m)=="character") locus3$ws_mbgconhull_width_m <-as.numeric(locus3$ws_mbgconhull_width_m)
if (class(locus3$ws_mbgconhull_orientation_deg)=="factor") locus3$ws_mbgconhull_orientation_deg <-as.numeric(levels(locus3$ws_mbgconhull_orientation_deg))[as.integer(locus3$ws_mbgconhull_orientation_deg) ]               
if (class(locus3$ws_mbgconhull_orientation_deg)=="character") locus3$ws_mbgconhull_orientation_deg <-as.numeric(locus3$ws_mbgconhull_orientation_deg)
if (class(locus3$ws_meanwidth_m)=="factor") locus3$ws_meanwidth_m <-as.numeric(levels(locus3$ws_meanwidth_m))[as.integer(locus3$ws_meanwidth_m) ]               
if (class(locus3$ws_meanwidth_m)=="character") locus3$ws_meanwidth_m <-as.numeric(locus3$ws_meanwidth_m)
if (class(locus3$ws_lat_decdeg)=="factor") locus3$ws_lat_decdeg <-as.numeric(levels(locus3$ws_lat_decdeg))[as.integer(locus3$ws_lat_decdeg) ]               
if (class(locus3$ws_lat_decdeg)=="character") locus3$ws_lat_decdeg <-as.numeric(locus3$ws_lat_decdeg)
if (class(locus3$ws_lon_decdeg)=="factor") locus3$ws_lon_decdeg <-as.numeric(levels(locus3$ws_lon_decdeg))[as.integer(locus3$ws_lon_decdeg) ]               
if (class(locus3$ws_lon_decdeg)=="character") locus3$ws_lon_decdeg <-as.numeric(locus3$ws_lon_decdeg)
if (class(locus3$nws_states)!="factor") locus3$nws_states<- as.factor(locus3$nws_states)
if (class(locus3$nws_focallakewaterarea_ha)=="factor") locus3$nws_focallakewaterarea_ha <-as.numeric(levels(locus3$nws_focallakewaterarea_ha))[as.integer(locus3$nws_focallakewaterarea_ha) ]               
if (class(locus3$nws_focallakewaterarea_ha)=="character") locus3$nws_focallakewaterarea_ha <-as.numeric(locus3$nws_focallakewaterarea_ha)
if (class(locus3$nws_area_ha)=="factor") locus3$nws_area_ha <-as.numeric(levels(locus3$nws_area_ha))[as.integer(locus3$nws_area_ha) ]               
if (class(locus3$nws_area_ha)=="character") locus3$nws_area_ha <-as.numeric(locus3$nws_area_ha)
if (class(locus3$nws_perimeter_m)=="factor") locus3$nws_perimeter_m <-as.numeric(levels(locus3$nws_perimeter_m))[as.integer(locus3$nws_perimeter_m) ]               
if (class(locus3$nws_perimeter_m)=="character") locus3$nws_perimeter_m <-as.numeric(locus3$nws_perimeter_m)
if (class(locus3$nws_lake_arearatio)=="factor") locus3$nws_lake_arearatio <-as.numeric(levels(locus3$nws_lake_arearatio))[as.integer(locus3$nws_lake_arearatio) ]               
if (class(locus3$nws_lake_arearatio)=="character") locus3$nws_lake_arearatio <-as.numeric(locus3$nws_lake_arearatio)
if (class(locus3$nws_mbgconhull_length_m)=="factor") locus3$nws_mbgconhull_length_m <-as.numeric(levels(locus3$nws_mbgconhull_length_m))[as.integer(locus3$nws_mbgconhull_length_m) ]               
if (class(locus3$nws_mbgconhull_length_m)=="character") locus3$nws_mbgconhull_length_m <-as.numeric(locus3$nws_mbgconhull_length_m)
if (class(locus3$nws_mbgconhull_width_m)=="factor") locus3$nws_mbgconhull_width_m <-as.numeric(levels(locus3$nws_mbgconhull_width_m))[as.integer(locus3$nws_mbgconhull_width_m) ]               
if (class(locus3$nws_mbgconhull_width_m)=="character") locus3$nws_mbgconhull_width_m <-as.numeric(locus3$nws_mbgconhull_width_m)
if (class(locus3$nws_mbgconhull_orientation_deg)=="factor") locus3$nws_mbgconhull_orientation_deg <-as.numeric(levels(locus3$nws_mbgconhull_orientation_deg))[as.integer(locus3$nws_mbgconhull_orientation_deg) ]               
if (class(locus3$nws_mbgconhull_orientation_deg)=="character") locus3$nws_mbgconhull_orientation_deg <-as.numeric(locus3$nws_mbgconhull_orientation_deg)
if (class(locus3$nws_meanwidth_m)=="factor") locus3$nws_meanwidth_m <-as.numeric(levels(locus3$nws_meanwidth_m))[as.integer(locus3$nws_meanwidth_m) ]               
if (class(locus3$nws_meanwidth_m)=="character") locus3$nws_meanwidth_m <-as.numeric(locus3$nws_meanwidth_m)
if (class(locus3$nws_lat_decdeg)=="factor") locus3$nws_lat_decdeg <-as.numeric(levels(locus3$nws_lat_decdeg))[as.integer(locus3$nws_lat_decdeg) ]               
if (class(locus3$nws_lat_decdeg)=="character") locus3$nws_lat_decdeg <-as.numeric(locus3$nws_lat_decdeg)
if (class(locus3$nws_lon_decdeg)=="factor") locus3$nws_lon_decdeg <-as.numeric(levels(locus3$nws_lon_decdeg))[as.integer(locus3$nws_lon_decdeg) ]               
if (class(locus3$nws_lon_decdeg)=="character") locus3$nws_lon_decdeg <-as.numeric(locus3$nws_lon_decdeg)

# Convert Missing Values to NA for non-dates

locus3$lagoslakeid <- ifelse((trimws(as.character(locus3$lagoslakeid))==trimws("NA")),NA,locus3$lagoslakeid)               
suppressWarnings(locus3$lagoslakeid <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(locus3$lagoslakeid))==as.character(as.numeric("NA"))),NA,locus3$lagoslakeid))
locus3$ws_zoneid <- as.factor(ifelse((trimws(as.character(locus3$ws_zoneid))==trimws("NA")),NA,as.character(locus3$ws_zoneid)))
locus3$nws_zoneid <- as.factor(ifelse((trimws(as.character(locus3$nws_zoneid))==trimws("NA")),NA,as.character(locus3$nws_zoneid)))
locus3$ws_subtype <- as.factor(ifelse((trimws(as.character(locus3$ws_subtype))==trimws("NA")),NA,as.character(locus3$ws_subtype)))
locus3$ws_equalsnws <- as.factor(ifelse((trimws(as.character(locus3$ws_equalsnws))==trimws("NA")),NA,as.character(locus3$ws_equalsnws)))
locus3$ws_onlandborder <- as.factor(ifelse((trimws(as.character(locus3$ws_onlandborder))==trimws("NA")),NA,as.character(locus3$ws_onlandborder)))
locus3$ws_oncoast <- as.factor(ifelse((trimws(as.character(locus3$ws_oncoast))==trimws("NA")),NA,as.character(locus3$ws_oncoast)))
locus3$ws_inusa_pct <- ifelse((trimws(as.character(locus3$ws_inusa_pct))==trimws("NA")),NA,locus3$ws_inusa_pct)               
suppressWarnings(locus3$ws_inusa_pct <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(locus3$ws_inusa_pct))==as.character(as.numeric("NA"))),NA,locus3$ws_inusa_pct))
locus3$ws_includeshu4inlet <- as.factor(ifelse((trimws(as.character(locus3$ws_includeshu4inlet))==trimws("NA")),NA,as.character(locus3$ws_includeshu4inlet)))
locus3$ws_ismultipart <- as.factor(ifelse((trimws(as.character(locus3$ws_ismultipart))==trimws("NA")),NA,as.character(locus3$ws_ismultipart)))
locus3$ws_sliverflag <- as.factor(ifelse((trimws(as.character(locus3$ws_sliverflag))==trimws("NA")),NA,as.character(locus3$ws_sliverflag)))
locus3$nws_onlandborder <- as.factor(ifelse((trimws(as.character(locus3$nws_onlandborder))==trimws("NA")),NA,as.character(locus3$nws_onlandborder)))
locus3$nws_oncoast <- as.factor(ifelse((trimws(as.character(locus3$nws_oncoast))==trimws("NA")),NA,as.character(locus3$nws_oncoast)))
locus3$nws_inusa_pct <- ifelse((trimws(as.character(locus3$nws_inusa_pct))==trimws("NA")),NA,locus3$nws_inusa_pct)               
suppressWarnings(locus3$nws_inusa_pct <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(locus3$nws_inusa_pct))==as.character(as.numeric("NA"))),NA,locus3$nws_inusa_pct))
locus3$nws_includeshu4inlet <- as.factor(ifelse((trimws(as.character(locus3$nws_includeshu4inlet))==trimws("NA")),NA,as.character(locus3$nws_includeshu4inlet)))
locus3$nws_ismultipart <- as.factor(ifelse((trimws(as.character(locus3$nws_ismultipart))==trimws("NA")),NA,as.character(locus3$nws_ismultipart)))
locus3$ws_states <- as.factor(ifelse((trimws(as.character(locus3$ws_states))==trimws("NA")),NA,as.character(locus3$ws_states)))
locus3$ws_focallakewaterarea_ha <- ifelse((trimws(as.character(locus3$ws_focallakewaterarea_ha))==trimws("NA")),NA,locus3$ws_focallakewaterarea_ha)               
suppressWarnings(locus3$ws_focallakewaterarea_ha <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(locus3$ws_focallakewaterarea_ha))==as.character(as.numeric("NA"))),NA,locus3$ws_focallakewaterarea_ha))
locus3$ws_area_ha <- ifelse((trimws(as.character(locus3$ws_area_ha))==trimws("NA")),NA,locus3$ws_area_ha)               
suppressWarnings(locus3$ws_area_ha <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(locus3$ws_area_ha))==as.character(as.numeric("NA"))),NA,locus3$ws_area_ha))
locus3$ws_perimeter_m <- ifelse((trimws(as.character(locus3$ws_perimeter_m))==trimws("NA")),NA,locus3$ws_perimeter_m)               
suppressWarnings(locus3$ws_perimeter_m <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(locus3$ws_perimeter_m))==as.character(as.numeric("NA"))),NA,locus3$ws_perimeter_m))
locus3$ws_lake_arearatio <- ifelse((trimws(as.character(locus3$ws_lake_arearatio))==trimws("NA")),NA,locus3$ws_lake_arearatio)               
suppressWarnings(locus3$ws_lake_arearatio <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(locus3$ws_lake_arearatio))==as.character(as.numeric("NA"))),NA,locus3$ws_lake_arearatio))
locus3$ws_mbgconhull_length_m <- ifelse((trimws(as.character(locus3$ws_mbgconhull_length_m))==trimws("NA")),NA,locus3$ws_mbgconhull_length_m)               
suppressWarnings(locus3$ws_mbgconhull_length_m <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(locus3$ws_mbgconhull_length_m))==as.character(as.numeric("NA"))),NA,locus3$ws_mbgconhull_length_m))
locus3$ws_mbgconhull_width_m <- ifelse((trimws(as.character(locus3$ws_mbgconhull_width_m))==trimws("NA")),NA,locus3$ws_mbgconhull_width_m)               
suppressWarnings(locus3$ws_mbgconhull_width_m <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(locus3$ws_mbgconhull_width_m))==as.character(as.numeric("NA"))),NA,locus3$ws_mbgconhull_width_m))
locus3$ws_mbgconhull_orientation_deg <- ifelse((trimws(as.character(locus3$ws_mbgconhull_orientation_deg))==trimws("NA")),NA,locus3$ws_mbgconhull_orientation_deg)               
suppressWarnings(locus3$ws_mbgconhull_orientation_deg <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(locus3$ws_mbgconhull_orientation_deg))==as.character(as.numeric("NA"))),NA,locus3$ws_mbgconhull_orientation_deg))
locus3$ws_meanwidth_m <- ifelse((trimws(as.character(locus3$ws_meanwidth_m))==trimws("NA")),NA,locus3$ws_meanwidth_m)               
suppressWarnings(locus3$ws_meanwidth_m <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(locus3$ws_meanwidth_m))==as.character(as.numeric("NA"))),NA,locus3$ws_meanwidth_m))
locus3$ws_lat_decdeg <- ifelse((trimws(as.character(locus3$ws_lat_decdeg))==trimws("NA")),NA,locus3$ws_lat_decdeg)               
suppressWarnings(locus3$ws_lat_decdeg <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(locus3$ws_lat_decdeg))==as.character(as.numeric("NA"))),NA,locus3$ws_lat_decdeg))
locus3$ws_lon_decdeg <- ifelse((trimws(as.character(locus3$ws_lon_decdeg))==trimws("NA")),NA,locus3$ws_lon_decdeg)               
suppressWarnings(locus3$ws_lon_decdeg <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(locus3$ws_lon_decdeg))==as.character(as.numeric("NA"))),NA,locus3$ws_lon_decdeg))
locus3$nws_states <- as.factor(ifelse((trimws(as.character(locus3$nws_states))==trimws("NA")),NA,as.character(locus3$nws_states)))
locus3$nws_focallakewaterarea_ha <- ifelse((trimws(as.character(locus3$nws_focallakewaterarea_ha))==trimws("NA")),NA,locus3$nws_focallakewaterarea_ha)               
suppressWarnings(locus3$nws_focallakewaterarea_ha <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(locus3$nws_focallakewaterarea_ha))==as.character(as.numeric("NA"))),NA,locus3$nws_focallakewaterarea_ha))
locus3$nws_area_ha <- ifelse((trimws(as.character(locus3$nws_area_ha))==trimws("NA")),NA,locus3$nws_area_ha)               
suppressWarnings(locus3$nws_area_ha <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(locus3$nws_area_ha))==as.character(as.numeric("NA"))),NA,locus3$nws_area_ha))
locus3$nws_perimeter_m <- ifelse((trimws(as.character(locus3$nws_perimeter_m))==trimws("NA")),NA,locus3$nws_perimeter_m)               
suppressWarnings(locus3$nws_perimeter_m <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(locus3$nws_perimeter_m))==as.character(as.numeric("NA"))),NA,locus3$nws_perimeter_m))
locus3$nws_lake_arearatio <- ifelse((trimws(as.character(locus3$nws_lake_arearatio))==trimws("NA")),NA,locus3$nws_lake_arearatio)               
suppressWarnings(locus3$nws_lake_arearatio <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(locus3$nws_lake_arearatio))==as.character(as.numeric("NA"))),NA,locus3$nws_lake_arearatio))
locus3$nws_mbgconhull_length_m <- ifelse((trimws(as.character(locus3$nws_mbgconhull_length_m))==trimws("NA")),NA,locus3$nws_mbgconhull_length_m)               
suppressWarnings(locus3$nws_mbgconhull_length_m <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(locus3$nws_mbgconhull_length_m))==as.character(as.numeric("NA"))),NA,locus3$nws_mbgconhull_length_m))
locus3$nws_mbgconhull_width_m <- ifelse((trimws(as.character(locus3$nws_mbgconhull_width_m))==trimws("NA")),NA,locus3$nws_mbgconhull_width_m)               
suppressWarnings(locus3$nws_mbgconhull_width_m <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(locus3$nws_mbgconhull_width_m))==as.character(as.numeric("NA"))),NA,locus3$nws_mbgconhull_width_m))
locus3$nws_mbgconhull_orientation_deg <- ifelse((trimws(as.character(locus3$nws_mbgconhull_orientation_deg))==trimws("NA")),NA,locus3$nws_mbgconhull_orientation_deg)               
suppressWarnings(locus3$nws_mbgconhull_orientation_deg <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(locus3$nws_mbgconhull_orientation_deg))==as.character(as.numeric("NA"))),NA,locus3$nws_mbgconhull_orientation_deg))
locus3$nws_meanwidth_m <- ifelse((trimws(as.character(locus3$nws_meanwidth_m))==trimws("NA")),NA,locus3$nws_meanwidth_m)               
suppressWarnings(locus3$nws_meanwidth_m <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(locus3$nws_meanwidth_m))==as.character(as.numeric("NA"))),NA,locus3$nws_meanwidth_m))
locus3$nws_lat_decdeg <- ifelse((trimws(as.character(locus3$nws_lat_decdeg))==trimws("NA")),NA,locus3$nws_lat_decdeg)               
suppressWarnings(locus3$nws_lat_decdeg <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(locus3$nws_lat_decdeg))==as.character(as.numeric("NA"))),NA,locus3$nws_lat_decdeg))
locus3$nws_lon_decdeg <- ifelse((trimws(as.character(locus3$nws_lon_decdeg))==trimws("NA")),NA,locus3$nws_lon_decdeg)               
suppressWarnings(locus3$nws_lon_decdeg <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(locus3$nws_lon_decdeg))==as.character(as.numeric("NA"))),NA,locus3$nws_lon_decdeg))


# Here is the structure of the input data frame:
str(locus3)                            
attach(locus3)                            
# The analyses below are basic descriptions of the variables. After testing, they should be replaced.                 

summary(lagoslakeid)
summary(ws_zoneid)
summary(nws_zoneid)
summary(ws_subtype)
summary(ws_equalsnws)
summary(ws_onlandborder)
summary(ws_oncoast)
summary(ws_inusa_pct)
summary(ws_includeshu4inlet)
summary(ws_ismultipart)
summary(ws_sliverflag)
summary(nws_onlandborder)
summary(nws_oncoast)
summary(nws_inusa_pct)
summary(nws_includeshu4inlet)
summary(nws_ismultipart)
summary(ws_states)
summary(ws_focallakewaterarea_ha)
summary(ws_area_ha)
summary(ws_perimeter_m)
summary(ws_lake_arearatio)
summary(ws_mbgconhull_length_m)
summary(ws_mbgconhull_width_m)
summary(ws_mbgconhull_orientation_deg)
summary(ws_meanwidth_m)
summary(ws_lat_decdeg)
summary(ws_lon_decdeg)
summary(nws_states)
summary(nws_focallakewaterarea_ha)
summary(nws_area_ha)
summary(nws_perimeter_m)
summary(nws_lake_arearatio)
summary(nws_mbgconhull_length_m)
summary(nws_mbgconhull_width_m)
summary(nws_mbgconhull_orientation_deg)
summary(nws_meanwidth_m)
summary(nws_lat_decdeg)
summary(nws_lon_decdeg) 
# Get more details on character variables

summary(as.factor(locus3$ws_zoneid)) 
summary(as.factor(locus3$nws_zoneid)) 
summary(as.factor(locus3$ws_subtype)) 
summary(as.factor(locus3$ws_equalsnws)) 
summary(as.factor(locus3$ws_onlandborder)) 
summary(as.factor(locus3$ws_oncoast)) 
summary(as.factor(locus3$ws_includeshu4inlet)) 
summary(as.factor(locus3$ws_ismultipart)) 
summary(as.factor(locus3$ws_sliverflag)) 
summary(as.factor(locus3$nws_onlandborder)) 
summary(as.factor(locus3$nws_oncoast)) 
summary(as.factor(locus3$nws_includeshu4inlet)) 
summary(as.factor(locus3$nws_ismultipart)) 
summary(as.factor(locus3$ws_states)) 
summary(as.factor(locus3$nws_states))
detach(locus3)               


inUrl4  <- "https://pasta.lternet.edu/package/data/eml/edi/854/1/5488e333ce818597fa3dbfc9b4e0c131" 
infile4 <- tempfile()
try(download.file(inUrl4,infile4,method="curl"))
if (is.na(file.size(infile4))) download.file(inUrl4,infile4,method="auto")


locus4 <-read.csv(infile4,header=F 
               ,skip=1
               ,sep=","  
               ,quot='"' 
               , col.names=c(
                 "lagoslakeid",     
                 "lake_nhdid",     
                 "lake_reachcode",     
                 "lake_namegnis",     
                 "lake_namelagos",     
                 "lake_county",     
                 "lake_countyfips",     
                 "lake_lat_decdeg",     
                 "lake_lon_decdeg",     
                 "lake_centroidstate",     
                 "nhdhr_area_sqkm",     
                 "nhdhr_fdate",     
                 "nhdhr_gnisid",     
                 "lagosus_legacysiteid",     
                 "lagosus_legacysitelabel",     
                 "lagosus_legacyprogram",     
                 "wqp_monitoringlocationidentifier",     
                 "wqp_monitoringlocationname",     
                 "wqp_providername",     
                 "nhdplusv2_comid",     
                 "nhdplusv2_reachcode",     
                 "nhdplusv2_area_sqkm",     
                 "lagosne_lagoslakeid",     
                 "lagosne_legacysiteid",     
                 "nla2007_siteid",     
                 "nla2012_siteid",     
                 "nhdplusv2_lakes_n",     
                 "lagosne_lakes_n",     
                 "wqp_sites_n",     
                 "lagosus_legacyids_n"    ), check.names=TRUE)

unlink(infile4)

# Fix any interval or ratio columns mistakenly read in as nominal and nominal columns read as numeric or dates read as strings

if (class(locus4$lagoslakeid)=="factor") locus4$lagoslakeid <-as.numeric(levels(locus4$lagoslakeid))[as.integer(locus4$lagoslakeid) ]               
if (class(locus4$lagoslakeid)=="character") locus4$lagoslakeid <-as.numeric(locus4$lagoslakeid)
if (class(locus4$lake_nhdid)!="factor") locus4$lake_nhdid<- as.factor(locus4$lake_nhdid)
if (class(locus4$lake_reachcode)!="factor") locus4$lake_reachcode<- as.factor(locus4$lake_reachcode)
if (class(locus4$lake_namegnis)!="factor") locus4$lake_namegnis<- as.factor(locus4$lake_namegnis)
if (class(locus4$lake_namelagos)!="factor") locus4$lake_namelagos<- as.factor(locus4$lake_namelagos)
if (class(locus4$lake_county)!="factor") locus4$lake_county<- as.factor(locus4$lake_county)
if (class(locus4$lake_countyfips)!="factor") locus4$lake_countyfips<- as.factor(locus4$lake_countyfips)
if (class(locus4$lake_lat_decdeg)=="factor") locus4$lake_lat_decdeg <-as.numeric(levels(locus4$lake_lat_decdeg))[as.integer(locus4$lake_lat_decdeg) ]               
if (class(locus4$lake_lat_decdeg)=="character") locus4$lake_lat_decdeg <-as.numeric(locus4$lake_lat_decdeg)
if (class(locus4$lake_lon_decdeg)=="factor") locus4$lake_lon_decdeg <-as.numeric(levels(locus4$lake_lon_decdeg))[as.integer(locus4$lake_lon_decdeg) ]               
if (class(locus4$lake_lon_decdeg)=="character") locus4$lake_lon_decdeg <-as.numeric(locus4$lake_lon_decdeg)
if (class(locus4$lake_centroidstate)!="factor") locus4$lake_centroidstate<- as.factor(locus4$lake_centroidstate)
if (class(locus4$nhdhr_area_sqkm)=="factor") locus4$nhdhr_area_sqkm <-as.numeric(levels(locus4$nhdhr_area_sqkm))[as.integer(locus4$nhdhr_area_sqkm) ]               
if (class(locus4$nhdhr_area_sqkm)=="character") locus4$nhdhr_area_sqkm <-as.numeric(locus4$nhdhr_area_sqkm)
if (class(locus4$nhdhr_fdate)!="factor") locus4$nhdhr_fdate<- as.factor(locus4$nhdhr_fdate)
if (class(locus4$nhdhr_gnisid)!="factor") locus4$nhdhr_gnisid<- as.factor(locus4$nhdhr_gnisid)
if (class(locus4$lagosus_legacysiteid)!="factor") locus4$lagosus_legacysiteid<- as.factor(locus4$lagosus_legacysiteid)
if (class(locus4$lagosus_legacysitelabel)!="factor") locus4$lagosus_legacysitelabel<- as.factor(locus4$lagosus_legacysitelabel)
if (class(locus4$lagosus_legacyprogram)!="factor") locus4$lagosus_legacyprogram<- as.factor(locus4$lagosus_legacyprogram)
if (class(locus4$wqp_monitoringlocationidentifier)!="factor") locus4$wqp_monitoringlocationidentifier<- as.factor(locus4$wqp_monitoringlocationidentifier)
if (class(locus4$wqp_monitoringlocationname)!="factor") locus4$wqp_monitoringlocationname<- as.factor(locus4$wqp_monitoringlocationname)
if (class(locus4$wqp_providername)!="factor") locus4$wqp_providername<- as.factor(locus4$wqp_providername)
if (class(locus4$nhdplusv2_comid)!="factor") locus4$nhdplusv2_comid<- as.factor(locus4$nhdplusv2_comid)
if (class(locus4$nhdplusv2_reachcode)!="factor") locus4$nhdplusv2_reachcode<- as.factor(locus4$nhdplusv2_reachcode)
if (class(locus4$nhdplusv2_area_sqkm)=="factor") locus4$nhdplusv2_area_sqkm <-as.numeric(levels(locus4$nhdplusv2_area_sqkm))[as.integer(locus4$nhdplusv2_area_sqkm) ]               
if (class(locus4$nhdplusv2_area_sqkm)=="character") locus4$nhdplusv2_area_sqkm <-as.numeric(locus4$nhdplusv2_area_sqkm)
if (class(locus4$lagosne_lagoslakeid)=="factor") locus4$lagosne_lagoslakeid <-as.numeric(levels(locus4$lagosne_lagoslakeid))[as.integer(locus4$lagosne_lagoslakeid) ]               
if (class(locus4$lagosne_lagoslakeid)=="character") locus4$lagosne_lagoslakeid <-as.numeric(locus4$lagosne_lagoslakeid)
if (class(locus4$lagosne_legacysiteid)!="factor") locus4$lagosne_legacysiteid<- as.factor(locus4$lagosne_legacysiteid)
if (class(locus4$nla2007_siteid)!="factor") locus4$nla2007_siteid<- as.factor(locus4$nla2007_siteid)
if (class(locus4$nla2012_siteid)!="factor") locus4$nla2012_siteid<- as.factor(locus4$nla2012_siteid)
if (class(locus4$nhdplusv2_lakes_n)=="factor") locus4$nhdplusv2_lakes_n <-as.numeric(levels(locus4$nhdplusv2_lakes_n))[as.integer(locus4$nhdplusv2_lakes_n) ]               
if (class(locus4$nhdplusv2_lakes_n)=="character") locus4$nhdplusv2_lakes_n <-as.numeric(locus4$nhdplusv2_lakes_n)
if (class(locus4$lagosne_lakes_n)=="factor") locus4$lagosne_lakes_n <-as.numeric(levels(locus4$lagosne_lakes_n))[as.integer(locus4$lagosne_lakes_n) ]               
if (class(locus4$lagosne_lakes_n)=="character") locus4$lagosne_lakes_n <-as.numeric(locus4$lagosne_lakes_n)
if (class(locus4$wqp_sites_n)=="factor") locus4$wqp_sites_n <-as.numeric(levels(locus4$wqp_sites_n))[as.integer(locus4$wqp_sites_n) ]               
if (class(locus4$wqp_sites_n)=="character") locus4$wqp_sites_n <-as.numeric(locus4$wqp_sites_n)
if (class(locus4$lagosus_legacyids_n)=="factor") locus4$lagosus_legacyids_n <-as.numeric(levels(locus4$lagosus_legacyids_n))[as.integer(locus4$lagosus_legacyids_n) ]               
if (class(locus4$lagosus_legacyids_n)=="character") locus4$lagosus_legacyids_n <-as.numeric(locus4$lagosus_legacyids_n)

# Convert Missing Values to NA for non-dates

locus4$lagoslakeid <- ifelse((trimws(as.character(locus4$lagoslakeid))==trimws("NA")),NA,locus4$lagoslakeid)               
suppressWarnings(locus4$lagoslakeid <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(locus4$lagoslakeid))==as.character(as.numeric("NA"))),NA,locus4$lagoslakeid))
locus4$lake_nhdid <- as.factor(ifelse((trimws(as.character(locus4$lake_nhdid))==trimws("NA")),NA,as.character(locus4$lake_nhdid)))
locus4$lake_reachcode <- as.factor(ifelse((trimws(as.character(locus4$lake_reachcode))==trimws("NA")),NA,as.character(locus4$lake_reachcode)))
locus4$lake_namegnis <- as.factor(ifelse((trimws(as.character(locus4$lake_namegnis))==trimws("NA")),NA,as.character(locus4$lake_namegnis)))
locus4$lake_namelagos <- as.factor(ifelse((trimws(as.character(locus4$lake_namelagos))==trimws("NA")),NA,as.character(locus4$lake_namelagos)))
locus4$lake_county <- as.factor(ifelse((trimws(as.character(locus4$lake_county))==trimws("NA")),NA,as.character(locus4$lake_county)))
locus4$lake_countyfips <- as.factor(ifelse((trimws(as.character(locus4$lake_countyfips))==trimws("NA")),NA,as.character(locus4$lake_countyfips)))
locus4$lake_lat_decdeg <- ifelse((trimws(as.character(locus4$lake_lat_decdeg))==trimws("NA")),NA,locus4$lake_lat_decdeg)               
suppressWarnings(locus4$lake_lat_decdeg <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(locus4$lake_lat_decdeg))==as.character(as.numeric("NA"))),NA,locus4$lake_lat_decdeg))
locus4$lake_lon_decdeg <- ifelse((trimws(as.character(locus4$lake_lon_decdeg))==trimws("NA")),NA,locus4$lake_lon_decdeg)               
suppressWarnings(locus4$lake_lon_decdeg <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(locus4$lake_lon_decdeg))==as.character(as.numeric("NA"))),NA,locus4$lake_lon_decdeg))
locus4$lake_centroidstate <- as.factor(ifelse((trimws(as.character(locus4$lake_centroidstate))==trimws("NA")),NA,as.character(locus4$lake_centroidstate)))
locus4$nhdhr_area_sqkm <- ifelse((trimws(as.character(locus4$nhdhr_area_sqkm))==trimws("NA")),NA,locus4$nhdhr_area_sqkm)               
suppressWarnings(locus4$nhdhr_area_sqkm <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(locus4$nhdhr_area_sqkm))==as.character(as.numeric("NA"))),NA,locus4$nhdhr_area_sqkm))
locus4$nhdhr_fdate <- as.factor(ifelse((trimws(as.character(locus4$nhdhr_fdate))==trimws("NA")),NA,as.character(locus4$nhdhr_fdate)))
locus4$nhdhr_gnisid <- as.factor(ifelse((trimws(as.character(locus4$nhdhr_gnisid))==trimws("NA")),NA,as.character(locus4$nhdhr_gnisid)))
locus4$lagosus_legacysiteid <- as.factor(ifelse((trimws(as.character(locus4$lagosus_legacysiteid))==trimws("NA")),NA,as.character(locus4$lagosus_legacysiteid)))
locus4$lagosus_legacysitelabel <- as.factor(ifelse((trimws(as.character(locus4$lagosus_legacysitelabel))==trimws("NA")),NA,as.character(locus4$lagosus_legacysitelabel)))
locus4$lagosus_legacyprogram <- as.factor(ifelse((trimws(as.character(locus4$lagosus_legacyprogram))==trimws("NA")),NA,as.character(locus4$lagosus_legacyprogram)))
locus4$wqp_monitoringlocationidentifier <- as.factor(ifelse((trimws(as.character(locus4$wqp_monitoringlocationidentifier))==trimws("NA")),NA,as.character(locus4$wqp_monitoringlocationidentifier)))
locus4$wqp_monitoringlocationname <- as.factor(ifelse((trimws(as.character(locus4$wqp_monitoringlocationname))==trimws("NA")),NA,as.character(locus4$wqp_monitoringlocationname)))
locus4$wqp_providername <- as.factor(ifelse((trimws(as.character(locus4$wqp_providername))==trimws("NA")),NA,as.character(locus4$wqp_providername)))
locus4$nhdplusv2_comid <- as.factor(ifelse((trimws(as.character(locus4$nhdplusv2_comid))==trimws("NA")),NA,as.character(locus4$nhdplusv2_comid)))
locus4$nhdplusv2_reachcode <- as.factor(ifelse((trimws(as.character(locus4$nhdplusv2_reachcode))==trimws("NA")),NA,as.character(locus4$nhdplusv2_reachcode)))
locus4$nhdplusv2_area_sqkm <- ifelse((trimws(as.character(locus4$nhdplusv2_area_sqkm))==trimws("NA")),NA,locus4$nhdplusv2_area_sqkm)               
suppressWarnings(locus4$nhdplusv2_area_sqkm <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(locus4$nhdplusv2_area_sqkm))==as.character(as.numeric("NA"))),NA,locus4$nhdplusv2_area_sqkm))
locus4$lagosne_lagoslakeid <- ifelse((trimws(as.character(locus4$lagosne_lagoslakeid))==trimws("NA")),NA,locus4$lagosne_lagoslakeid)               
suppressWarnings(locus4$lagosne_lagoslakeid <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(locus4$lagosne_lagoslakeid))==as.character(as.numeric("NA"))),NA,locus4$lagosne_lagoslakeid))
locus4$lagosne_legacysiteid <- as.factor(ifelse((trimws(as.character(locus4$lagosne_legacysiteid))==trimws("NA")),NA,as.character(locus4$lagosne_legacysiteid)))
locus4$nla2007_siteid <- as.factor(ifelse((trimws(as.character(locus4$nla2007_siteid))==trimws("NA")),NA,as.character(locus4$nla2007_siteid)))
locus4$nla2012_siteid <- as.factor(ifelse((trimws(as.character(locus4$nla2012_siteid))==trimws("NA")),NA,as.character(locus4$nla2012_siteid)))
locus4$nhdplusv2_lakes_n <- ifelse((trimws(as.character(locus4$nhdplusv2_lakes_n))==trimws("NA")),NA,locus4$nhdplusv2_lakes_n)               
suppressWarnings(locus4$nhdplusv2_lakes_n <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(locus4$nhdplusv2_lakes_n))==as.character(as.numeric("NA"))),NA,locus4$nhdplusv2_lakes_n))
locus4$lagosne_lakes_n <- ifelse((trimws(as.character(locus4$lagosne_lakes_n))==trimws("NA")),NA,locus4$lagosne_lakes_n)               
suppressWarnings(locus4$lagosne_lakes_n <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(locus4$lagosne_lakes_n))==as.character(as.numeric("NA"))),NA,locus4$lagosne_lakes_n))
locus4$wqp_sites_n <- ifelse((trimws(as.character(locus4$wqp_sites_n))==trimws("NA")),NA,locus4$wqp_sites_n)               
suppressWarnings(locus4$wqp_sites_n <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(locus4$wqp_sites_n))==as.character(as.numeric("NA"))),NA,locus4$wqp_sites_n))
locus4$lagosus_legacyids_n <- ifelse((trimws(as.character(locus4$lagosus_legacyids_n))==trimws("NA")),NA,locus4$lagosus_legacyids_n)               
suppressWarnings(locus4$lagosus_legacyids_n <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(locus4$lagosus_legacyids_n))==as.character(as.numeric("NA"))),NA,locus4$lagosus_legacyids_n))


# Here is the structure of the input data frame:
str(locus4)                            
attach(locus4)                            
# The analyses below are basic descriptions of the variables. After testing, they should be replaced.                 

summary(lagoslakeid)
summary(lake_nhdid)
summary(lake_reachcode)
summary(lake_namegnis)
summary(lake_namelagos)
summary(lake_county)
summary(lake_countyfips)
summary(lake_lat_decdeg)
summary(lake_lon_decdeg)
summary(lake_centroidstate)
summary(nhdhr_area_sqkm)
summary(nhdhr_fdate)
summary(nhdhr_gnisid)
summary(lagosus_legacysiteid)
summary(lagosus_legacysitelabel)
summary(lagosus_legacyprogram)
summary(wqp_monitoringlocationidentifier)
summary(wqp_monitoringlocationname)
summary(wqp_providername)
summary(nhdplusv2_comid)
summary(nhdplusv2_reachcode)
summary(nhdplusv2_area_sqkm)
summary(lagosne_lagoslakeid)
summary(lagosne_legacysiteid)
summary(nla2007_siteid)
summary(nla2012_siteid)
summary(nhdplusv2_lakes_n)
summary(lagosne_lakes_n)
summary(wqp_sites_n)
summary(lagosus_legacyids_n) 
# Get more details on character variables

summary(as.factor(locus4$lake_nhdid)) 
summary(as.factor(locus4$lake_reachcode)) 
summary(as.factor(locus4$lake_namegnis)) 
summary(as.factor(locus4$lake_namelagos)) 
summary(as.factor(locus4$lake_county)) 
summary(as.factor(locus4$lake_countyfips)) 
summary(as.factor(locus4$lake_centroidstate)) 
summary(as.factor(locus4$nhdhr_fdate)) 
summary(as.factor(locus4$nhdhr_gnisid)) 
summary(as.factor(locus4$lagosus_legacysiteid)) 
summary(as.factor(locus4$lagosus_legacysitelabel)) 
summary(as.factor(locus4$lagosus_legacyprogram)) 
summary(as.factor(locus4$wqp_monitoringlocationidentifier)) 
summary(as.factor(locus4$wqp_monitoringlocationname)) 
summary(as.factor(locus4$wqp_providername)) 
summary(as.factor(locus4$nhdplusv2_comid)) 
summary(as.factor(locus4$nhdplusv2_reachcode)) 
summary(as.factor(locus4$lagosne_legacysiteid)) 
summary(as.factor(locus4$nla2007_siteid)) 
summary(as.factor(locus4$nla2012_siteid))
detach(locus4)               





