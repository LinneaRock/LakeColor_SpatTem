# Package ID: edi.854.1 Cataloging System:https://pasta.edirepository.org.
# Data set title: LAGOS-US LOCUS v1.0: Data module of location, identifiers, and physical characteristics of lakes and their watersheds in the conterminous U.S..
# Data set creator:  Nicole Smith - Michigan State University 
# Data set creator:  Katherine Webster - Michigan State University 
# Data set creator:  Lauren Rodriguez - Michigan State University 
# Data set creator:  Kendra Cheruvelil - Michigan State University 
# Data set creator:  Patricia Soranno - Michigan State University 
# Contact:  Kendra Cheruvelil -  Michigan State University  - ksc@msu.edu
# Stylesheet v2.11 for metadata conversion into program: John H. Porter, Univ. Virginia, jporter@virginia.edu 

inUrl1  <- "https://pasta.lternet.edu/package/data/eml/edi/854/1/007ca4f5ec02bb5809fc661dcfa7a903" 
infile1 <- tempfile()
try(download.file(inUrl1,infile1,method="curl"))
if (is.na(file.size(infile1))) download.file(inUrl1,infile1,method="auto")


dt1 <-read.csv(infile1,header=F 
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

if (class(dt1$lagoslakeid)=="factor") dt1$lagoslakeid <-as.numeric(levels(dt1$lagoslakeid))[as.integer(dt1$lagoslakeid) ]               
if (class(dt1$lagoslakeid)=="character") dt1$lagoslakeid <-as.numeric(dt1$lagoslakeid)
if (class(dt1$lake_nhdid)!="factor") dt1$lake_nhdid<- as.factor(dt1$lake_nhdid)
if (class(dt1$lake_nhdfcode)!="factor") dt1$lake_nhdfcode<- as.factor(dt1$lake_nhdfcode)
if (class(dt1$lake_nhdftype)!="factor") dt1$lake_nhdftype<- as.factor(dt1$lake_nhdftype)
if (class(dt1$lake_reachcode)!="factor") dt1$lake_reachcode<- as.factor(dt1$lake_reachcode)
if (class(dt1$lake_namegnis)!="factor") dt1$lake_namegnis<- as.factor(dt1$lake_namegnis)
if (class(dt1$lake_namelagos)!="factor") dt1$lake_namelagos<- as.factor(dt1$lake_namelagos)
if (class(dt1$lake_onlandborder)!="factor") dt1$lake_onlandborder<- as.factor(dt1$lake_onlandborder)
if (class(dt1$lake_ismultipart)!="factor") dt1$lake_ismultipart<- as.factor(dt1$lake_ismultipart)
if (class(dt1$lake_missingws)!="factor") dt1$lake_missingws<- as.factor(dt1$lake_missingws)
if (class(dt1$lake_shapeflag)!="factor") dt1$lake_shapeflag<- as.factor(dt1$lake_shapeflag)
if (class(dt1$lake_lat_decdeg)=="factor") dt1$lake_lat_decdeg <-as.numeric(levels(dt1$lake_lat_decdeg))[as.integer(dt1$lake_lat_decdeg) ]               
if (class(dt1$lake_lat_decdeg)=="character") dt1$lake_lat_decdeg <-as.numeric(dt1$lake_lat_decdeg)
if (class(dt1$lake_lon_decdeg)=="factor") dt1$lake_lon_decdeg <-as.numeric(levels(dt1$lake_lon_decdeg))[as.integer(dt1$lake_lon_decdeg) ]               
if (class(dt1$lake_lon_decdeg)=="character") dt1$lake_lon_decdeg <-as.numeric(dt1$lake_lon_decdeg)
if (class(dt1$lake_elevation_m)=="factor") dt1$lake_elevation_m <-as.numeric(levels(dt1$lake_elevation_m))[as.integer(dt1$lake_elevation_m) ]               
if (class(dt1$lake_elevation_m)=="character") dt1$lake_elevation_m <-as.numeric(dt1$lake_elevation_m)
if (class(dt1$lake_centroidstate)!="factor") dt1$lake_centroidstate<- as.factor(dt1$lake_centroidstate)
if (class(dt1$lake_states)!="factor") dt1$lake_states<- as.factor(dt1$lake_states)
if (class(dt1$lake_county)!="factor") dt1$lake_county<- as.factor(dt1$lake_county)
if (class(dt1$lake_countyfips)!="factor") dt1$lake_countyfips<- as.factor(dt1$lake_countyfips)
if (class(dt1$lake_huc12)!="factor") dt1$lake_huc12<- as.factor(dt1$lake_huc12)
if (class(dt1$buff100_zoneid)!="factor") dt1$buff100_zoneid<- as.factor(dt1$buff100_zoneid)
if (class(dt1$buff500_zoneid)!="factor") dt1$buff500_zoneid<- as.factor(dt1$buff500_zoneid)
if (class(dt1$ws_zoneid)!="factor") dt1$ws_zoneid<- as.factor(dt1$ws_zoneid)
if (class(dt1$nws_zoneid)!="factor") dt1$nws_zoneid<- as.factor(dt1$nws_zoneid)
if (class(dt1$hu12_zoneid)!="factor") dt1$hu12_zoneid<- as.factor(dt1$hu12_zoneid)
if (class(dt1$hu8_zoneid)!="factor") dt1$hu8_zoneid<- as.factor(dt1$hu8_zoneid)
if (class(dt1$hu4_zoneid)!="factor") dt1$hu4_zoneid<- as.factor(dt1$hu4_zoneid)
if (class(dt1$county_zoneid)!="factor") dt1$county_zoneid<- as.factor(dt1$county_zoneid)
if (class(dt1$state_zoneid)!="factor") dt1$state_zoneid<- as.factor(dt1$state_zoneid)
if (class(dt1$epanutr_zoneid)!="factor") dt1$epanutr_zoneid<- as.factor(dt1$epanutr_zoneid)
if (class(dt1$omernik3_zoneid)!="factor") dt1$omernik3_zoneid<- as.factor(dt1$omernik3_zoneid)
if (class(dt1$wwf_zoneid)!="factor") dt1$wwf_zoneid<- as.factor(dt1$wwf_zoneid)
if (class(dt1$mlra_zoneid)!="factor") dt1$mlra_zoneid<- as.factor(dt1$mlra_zoneid)
if (class(dt1$bailey_zoneid)!="factor") dt1$bailey_zoneid<- as.factor(dt1$bailey_zoneid)
if (class(dt1$neon_zoneid)!="factor") dt1$neon_zoneid<- as.factor(dt1$neon_zoneid)

# Convert Missing Values to NA for non-dates

dt1$lagoslakeid <- ifelse((trimws(as.character(dt1$lagoslakeid))==trimws("NA")),NA,dt1$lagoslakeid)               
suppressWarnings(dt1$lagoslakeid <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt1$lagoslakeid))==as.character(as.numeric("NA"))),NA,dt1$lagoslakeid))
dt1$lake_nhdid <- as.factor(ifelse((trimws(as.character(dt1$lake_nhdid))==trimws("NA")),NA,as.character(dt1$lake_nhdid)))
dt1$lake_nhdfcode <- as.factor(ifelse((trimws(as.character(dt1$lake_nhdfcode))==trimws("NA")),NA,as.character(dt1$lake_nhdfcode)))
dt1$lake_nhdftype <- as.factor(ifelse((trimws(as.character(dt1$lake_nhdftype))==trimws("NA")),NA,as.character(dt1$lake_nhdftype)))
dt1$lake_reachcode <- as.factor(ifelse((trimws(as.character(dt1$lake_reachcode))==trimws("NA")),NA,as.character(dt1$lake_reachcode)))
dt1$lake_namegnis <- as.factor(ifelse((trimws(as.character(dt1$lake_namegnis))==trimws("NA")),NA,as.character(dt1$lake_namegnis)))
dt1$lake_namelagos <- as.factor(ifelse((trimws(as.character(dt1$lake_namelagos))==trimws("NA")),NA,as.character(dt1$lake_namelagos)))
dt1$lake_onlandborder <- as.factor(ifelse((trimws(as.character(dt1$lake_onlandborder))==trimws("NA")),NA,as.character(dt1$lake_onlandborder)))
dt1$lake_ismultipart <- as.factor(ifelse((trimws(as.character(dt1$lake_ismultipart))==trimws("NA")),NA,as.character(dt1$lake_ismultipart)))
dt1$lake_missingws <- as.factor(ifelse((trimws(as.character(dt1$lake_missingws))==trimws("NA")),NA,as.character(dt1$lake_missingws)))
dt1$lake_shapeflag <- as.factor(ifelse((trimws(as.character(dt1$lake_shapeflag))==trimws("NA")),NA,as.character(dt1$lake_shapeflag)))
dt1$lake_lat_decdeg <- ifelse((trimws(as.character(dt1$lake_lat_decdeg))==trimws("NA")),NA,dt1$lake_lat_decdeg)               
suppressWarnings(dt1$lake_lat_decdeg <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt1$lake_lat_decdeg))==as.character(as.numeric("NA"))),NA,dt1$lake_lat_decdeg))
dt1$lake_lon_decdeg <- ifelse((trimws(as.character(dt1$lake_lon_decdeg))==trimws("NA")),NA,dt1$lake_lon_decdeg)               
suppressWarnings(dt1$lake_lon_decdeg <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt1$lake_lon_decdeg))==as.character(as.numeric("NA"))),NA,dt1$lake_lon_decdeg))
dt1$lake_elevation_m <- ifelse((trimws(as.character(dt1$lake_elevation_m))==trimws("NA")),NA,dt1$lake_elevation_m)               
suppressWarnings(dt1$lake_elevation_m <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt1$lake_elevation_m))==as.character(as.numeric("NA"))),NA,dt1$lake_elevation_m))
dt1$lake_centroidstate <- as.factor(ifelse((trimws(as.character(dt1$lake_centroidstate))==trimws("NA")),NA,as.character(dt1$lake_centroidstate)))
dt1$lake_states <- as.factor(ifelse((trimws(as.character(dt1$lake_states))==trimws("NA")),NA,as.character(dt1$lake_states)))
dt1$lake_county <- as.factor(ifelse((trimws(as.character(dt1$lake_county))==trimws("NA")),NA,as.character(dt1$lake_county)))
dt1$lake_countyfips <- as.factor(ifelse((trimws(as.character(dt1$lake_countyfips))==trimws("NA")),NA,as.character(dt1$lake_countyfips)))
dt1$lake_huc12 <- as.factor(ifelse((trimws(as.character(dt1$lake_huc12))==trimws("NA")),NA,as.character(dt1$lake_huc12)))
dt1$buff100_zoneid <- as.factor(ifelse((trimws(as.character(dt1$buff100_zoneid))==trimws("NA")),NA,as.character(dt1$buff100_zoneid)))
dt1$buff500_zoneid <- as.factor(ifelse((trimws(as.character(dt1$buff500_zoneid))==trimws("NA")),NA,as.character(dt1$buff500_zoneid)))
dt1$ws_zoneid <- as.factor(ifelse((trimws(as.character(dt1$ws_zoneid))==trimws("NA")),NA,as.character(dt1$ws_zoneid)))
dt1$nws_zoneid <- as.factor(ifelse((trimws(as.character(dt1$nws_zoneid))==trimws("NA")),NA,as.character(dt1$nws_zoneid)))
dt1$hu12_zoneid <- as.factor(ifelse((trimws(as.character(dt1$hu12_zoneid))==trimws("NA")),NA,as.character(dt1$hu12_zoneid)))
dt1$hu8_zoneid <- as.factor(ifelse((trimws(as.character(dt1$hu8_zoneid))==trimws("NA")),NA,as.character(dt1$hu8_zoneid)))
dt1$hu4_zoneid <- as.factor(ifelse((trimws(as.character(dt1$hu4_zoneid))==trimws("NA")),NA,as.character(dt1$hu4_zoneid)))
dt1$county_zoneid <- as.factor(ifelse((trimws(as.character(dt1$county_zoneid))==trimws("NA")),NA,as.character(dt1$county_zoneid)))
dt1$state_zoneid <- as.factor(ifelse((trimws(as.character(dt1$state_zoneid))==trimws("NA")),NA,as.character(dt1$state_zoneid)))
dt1$epanutr_zoneid <- as.factor(ifelse((trimws(as.character(dt1$epanutr_zoneid))==trimws("NA")),NA,as.character(dt1$epanutr_zoneid)))
dt1$omernik3_zoneid <- as.factor(ifelse((trimws(as.character(dt1$omernik3_zoneid))==trimws("NA")),NA,as.character(dt1$omernik3_zoneid)))
dt1$wwf_zoneid <- as.factor(ifelse((trimws(as.character(dt1$wwf_zoneid))==trimws("NA")),NA,as.character(dt1$wwf_zoneid)))
dt1$mlra_zoneid <- as.factor(ifelse((trimws(as.character(dt1$mlra_zoneid))==trimws("NA")),NA,as.character(dt1$mlra_zoneid)))
dt1$bailey_zoneid <- as.factor(ifelse((trimws(as.character(dt1$bailey_zoneid))==trimws("NA")),NA,as.character(dt1$bailey_zoneid)))
dt1$neon_zoneid <- as.factor(ifelse((trimws(as.character(dt1$neon_zoneid))==trimws("NA")),NA,as.character(dt1$neon_zoneid)))


# Here is the structure of the input data frame:
str(dt1)                            
attach(dt1)                            
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

summary(as.factor(dt1$lake_nhdid)) 
summary(as.factor(dt1$lake_nhdfcode)) 
summary(as.factor(dt1$lake_nhdftype)) 
summary(as.factor(dt1$lake_reachcode)) 
summary(as.factor(dt1$lake_namegnis)) 
summary(as.factor(dt1$lake_namelagos)) 
summary(as.factor(dt1$lake_onlandborder)) 
summary(as.factor(dt1$lake_ismultipart)) 
summary(as.factor(dt1$lake_missingws)) 
summary(as.factor(dt1$lake_shapeflag)) 
summary(as.factor(dt1$lake_centroidstate)) 
summary(as.factor(dt1$lake_states)) 
summary(as.factor(dt1$lake_county)) 
summary(as.factor(dt1$lake_countyfips)) 
summary(as.factor(dt1$lake_huc12)) 
summary(as.factor(dt1$buff100_zoneid)) 
summary(as.factor(dt1$buff500_zoneid)) 
summary(as.factor(dt1$ws_zoneid)) 
summary(as.factor(dt1$nws_zoneid)) 
summary(as.factor(dt1$hu12_zoneid)) 
summary(as.factor(dt1$hu8_zoneid)) 
summary(as.factor(dt1$hu4_zoneid)) 
summary(as.factor(dt1$county_zoneid)) 
summary(as.factor(dt1$state_zoneid)) 
summary(as.factor(dt1$epanutr_zoneid)) 
summary(as.factor(dt1$omernik3_zoneid)) 
summary(as.factor(dt1$wwf_zoneid)) 
summary(as.factor(dt1$mlra_zoneid)) 
summary(as.factor(dt1$bailey_zoneid)) 
summary(as.factor(dt1$neon_zoneid))
detach(dt1)               


inUrl2  <- "https://pasta.lternet.edu/package/data/eml/edi/854/1/fd7fe936d290a12bc6dbf5c41047849e" 
infile2 <- tempfile()
try(download.file(inUrl2,infile2,method="curl"))
if (is.na(file.size(infile2))) download.file(inUrl2,infile2,method="auto")


dt2 <-read.csv(infile2,header=F 
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

if (class(dt2$lagoslakeid)=="factor") dt2$lagoslakeid <-as.numeric(levels(dt2$lagoslakeid))[as.integer(dt2$lagoslakeid) ]               
if (class(dt2$lagoslakeid)=="character") dt2$lagoslakeid <-as.numeric(dt2$lagoslakeid)
if (class(dt2$lake_waterarea_ha)=="factor") dt2$lake_waterarea_ha <-as.numeric(levels(dt2$lake_waterarea_ha))[as.integer(dt2$lake_waterarea_ha) ]               
if (class(dt2$lake_waterarea_ha)=="character") dt2$lake_waterarea_ha <-as.numeric(dt2$lake_waterarea_ha)
if (class(dt2$lake_totalarea_ha)=="factor") dt2$lake_totalarea_ha <-as.numeric(levels(dt2$lake_totalarea_ha))[as.integer(dt2$lake_totalarea_ha) ]               
if (class(dt2$lake_totalarea_ha)=="character") dt2$lake_totalarea_ha <-as.numeric(dt2$lake_totalarea_ha)
if (class(dt2$lake_islandarea_ha)=="factor") dt2$lake_islandarea_ha <-as.numeric(levels(dt2$lake_islandarea_ha))[as.integer(dt2$lake_islandarea_ha) ]               
if (class(dt2$lake_islandarea_ha)=="character") dt2$lake_islandarea_ha <-as.numeric(dt2$lake_islandarea_ha)
if (class(dt2$lake_perimeter_m)=="factor") dt2$lake_perimeter_m <-as.numeric(levels(dt2$lake_perimeter_m))[as.integer(dt2$lake_perimeter_m) ]               
if (class(dt2$lake_perimeter_m)=="character") dt2$lake_perimeter_m <-as.numeric(dt2$lake_perimeter_m)
if (class(dt2$lake_islandperimeter_m)=="factor") dt2$lake_islandperimeter_m <-as.numeric(levels(dt2$lake_islandperimeter_m))[as.integer(dt2$lake_islandperimeter_m) ]               
if (class(dt2$lake_islandperimeter_m)=="character") dt2$lake_islandperimeter_m <-as.numeric(dt2$lake_islandperimeter_m)
if (class(dt2$lake_shorelinedevfactor)=="factor") dt2$lake_shorelinedevfactor <-as.numeric(levels(dt2$lake_shorelinedevfactor))[as.integer(dt2$lake_shorelinedevfactor) ]               
if (class(dt2$lake_shorelinedevfactor)=="character") dt2$lake_shorelinedevfactor <-as.numeric(dt2$lake_shorelinedevfactor)
if (class(dt2$lake_mbgconhull_length_m)=="factor") dt2$lake_mbgconhull_length_m <-as.numeric(levels(dt2$lake_mbgconhull_length_m))[as.integer(dt2$lake_mbgconhull_length_m) ]               
if (class(dt2$lake_mbgconhull_length_m)=="character") dt2$lake_mbgconhull_length_m <-as.numeric(dt2$lake_mbgconhull_length_m)
if (class(dt2$lake_mbgconhull_width_m)=="factor") dt2$lake_mbgconhull_width_m <-as.numeric(levels(dt2$lake_mbgconhull_width_m))[as.integer(dt2$lake_mbgconhull_width_m) ]               
if (class(dt2$lake_mbgconhull_width_m)=="character") dt2$lake_mbgconhull_width_m <-as.numeric(dt2$lake_mbgconhull_width_m)
if (class(dt2$lake_mbgconhull_orientation_deg)=="factor") dt2$lake_mbgconhull_orientation_deg <-as.numeric(levels(dt2$lake_mbgconhull_orientation_deg))[as.integer(dt2$lake_mbgconhull_orientation_deg) ]               
if (class(dt2$lake_mbgconhull_orientation_deg)=="character") dt2$lake_mbgconhull_orientation_deg <-as.numeric(dt2$lake_mbgconhull_orientation_deg)
if (class(dt2$lake_mbgrect_length_m)=="factor") dt2$lake_mbgrect_length_m <-as.numeric(levels(dt2$lake_mbgrect_length_m))[as.integer(dt2$lake_mbgrect_length_m) ]               
if (class(dt2$lake_mbgrect_length_m)=="character") dt2$lake_mbgrect_length_m <-as.numeric(dt2$lake_mbgrect_length_m)
if (class(dt2$lake_mbgrect_width_m)=="factor") dt2$lake_mbgrect_width_m <-as.numeric(levels(dt2$lake_mbgrect_width_m))[as.integer(dt2$lake_mbgrect_width_m) ]               
if (class(dt2$lake_mbgrect_width_m)=="character") dt2$lake_mbgrect_width_m <-as.numeric(dt2$lake_mbgrect_width_m)
if (class(dt2$lake_mbgrect_arearatio)=="factor") dt2$lake_mbgrect_arearatio <-as.numeric(levels(dt2$lake_mbgrect_arearatio))[as.integer(dt2$lake_mbgrect_arearatio) ]               
if (class(dt2$lake_mbgrect_arearatio)=="character") dt2$lake_mbgrect_arearatio <-as.numeric(dt2$lake_mbgrect_arearatio)
if (class(dt2$lake_meanwidth_m)=="factor") dt2$lake_meanwidth_m <-as.numeric(levels(dt2$lake_meanwidth_m))[as.integer(dt2$lake_meanwidth_m) ]               
if (class(dt2$lake_meanwidth_m)=="character") dt2$lake_meanwidth_m <-as.numeric(dt2$lake_meanwidth_m)
if (class(dt2$lake_connectivity_class)!="factor") dt2$lake_connectivity_class<- as.factor(dt2$lake_connectivity_class)
if (class(dt2$lake_connectivity_fluctuates)!="factor") dt2$lake_connectivity_fluctuates<- as.factor(dt2$lake_connectivity_fluctuates)
if (class(dt2$lake_connectivity_permanent)!="factor") dt2$lake_connectivity_permanent<- as.factor(dt2$lake_connectivity_permanent)
if (class(dt2$lake_lakes4ha_upstream_ha)=="factor") dt2$lake_lakes4ha_upstream_ha <-as.numeric(levels(dt2$lake_lakes4ha_upstream_ha))[as.integer(dt2$lake_lakes4ha_upstream_ha) ]               
if (class(dt2$lake_lakes4ha_upstream_ha)=="character") dt2$lake_lakes4ha_upstream_ha <-as.numeric(dt2$lake_lakes4ha_upstream_ha)
if (class(dt2$lake_lakes4ha_upstream_n)=="factor") dt2$lake_lakes4ha_upstream_n <-as.numeric(levels(dt2$lake_lakes4ha_upstream_n))[as.integer(dt2$lake_lakes4ha_upstream_n) ]               
if (class(dt2$lake_lakes4ha_upstream_n)=="character") dt2$lake_lakes4ha_upstream_n <-as.numeric(dt2$lake_lakes4ha_upstream_n)
if (class(dt2$lake_lakes1ha_upstream_ha)=="factor") dt2$lake_lakes1ha_upstream_ha <-as.numeric(levels(dt2$lake_lakes1ha_upstream_ha))[as.integer(dt2$lake_lakes1ha_upstream_ha) ]               
if (class(dt2$lake_lakes1ha_upstream_ha)=="character") dt2$lake_lakes1ha_upstream_ha <-as.numeric(dt2$lake_lakes1ha_upstream_ha)
if (class(dt2$lake_lakes1ha_upstream_n)=="factor") dt2$lake_lakes1ha_upstream_n <-as.numeric(levels(dt2$lake_lakes1ha_upstream_n))[as.integer(dt2$lake_lakes1ha_upstream_n) ]               
if (class(dt2$lake_lakes1ha_upstream_n)=="character") dt2$lake_lakes1ha_upstream_n <-as.numeric(dt2$lake_lakes1ha_upstream_n)
if (class(dt2$lake_lakes10ha_upstream_n)=="factor") dt2$lake_lakes10ha_upstream_n <-as.numeric(levels(dt2$lake_lakes10ha_upstream_n))[as.integer(dt2$lake_lakes10ha_upstream_n) ]               
if (class(dt2$lake_lakes10ha_upstream_n)=="character") dt2$lake_lakes10ha_upstream_n <-as.numeric(dt2$lake_lakes10ha_upstream_n)
if (class(dt2$lake_lakes10ha_upstream_ha)=="factor") dt2$lake_lakes10ha_upstream_ha <-as.numeric(levels(dt2$lake_lakes10ha_upstream_ha))[as.integer(dt2$lake_lakes10ha_upstream_ha) ]               
if (class(dt2$lake_lakes10ha_upstream_ha)=="character") dt2$lake_lakes10ha_upstream_ha <-as.numeric(dt2$lake_lakes10ha_upstream_ha)
if (class(dt2$lake_glaciatedlatewisc)!="factor") dt2$lake_glaciatedlatewisc<- as.factor(dt2$lake_glaciatedlatewisc)

# Convert Missing Values to NA for non-dates

dt2$lagoslakeid <- ifelse((trimws(as.character(dt2$lagoslakeid))==trimws("NA")),NA,dt2$lagoslakeid)               
suppressWarnings(dt2$lagoslakeid <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt2$lagoslakeid))==as.character(as.numeric("NA"))),NA,dt2$lagoslakeid))
dt2$lake_waterarea_ha <- ifelse((trimws(as.character(dt2$lake_waterarea_ha))==trimws("NA")),NA,dt2$lake_waterarea_ha)               
suppressWarnings(dt2$lake_waterarea_ha <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt2$lake_waterarea_ha))==as.character(as.numeric("NA"))),NA,dt2$lake_waterarea_ha))
dt2$lake_totalarea_ha <- ifelse((trimws(as.character(dt2$lake_totalarea_ha))==trimws("NA")),NA,dt2$lake_totalarea_ha)               
suppressWarnings(dt2$lake_totalarea_ha <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt2$lake_totalarea_ha))==as.character(as.numeric("NA"))),NA,dt2$lake_totalarea_ha))
dt2$lake_islandarea_ha <- ifelse((trimws(as.character(dt2$lake_islandarea_ha))==trimws("NA")),NA,dt2$lake_islandarea_ha)               
suppressWarnings(dt2$lake_islandarea_ha <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt2$lake_islandarea_ha))==as.character(as.numeric("NA"))),NA,dt2$lake_islandarea_ha))
dt2$lake_perimeter_m <- ifelse((trimws(as.character(dt2$lake_perimeter_m))==trimws("NA")),NA,dt2$lake_perimeter_m)               
suppressWarnings(dt2$lake_perimeter_m <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt2$lake_perimeter_m))==as.character(as.numeric("NA"))),NA,dt2$lake_perimeter_m))
dt2$lake_islandperimeter_m <- ifelse((trimws(as.character(dt2$lake_islandperimeter_m))==trimws("NA")),NA,dt2$lake_islandperimeter_m)               
suppressWarnings(dt2$lake_islandperimeter_m <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt2$lake_islandperimeter_m))==as.character(as.numeric("NA"))),NA,dt2$lake_islandperimeter_m))
dt2$lake_shorelinedevfactor <- ifelse((trimws(as.character(dt2$lake_shorelinedevfactor))==trimws("NA")),NA,dt2$lake_shorelinedevfactor)               
suppressWarnings(dt2$lake_shorelinedevfactor <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt2$lake_shorelinedevfactor))==as.character(as.numeric("NA"))),NA,dt2$lake_shorelinedevfactor))
dt2$lake_mbgconhull_length_m <- ifelse((trimws(as.character(dt2$lake_mbgconhull_length_m))==trimws("NA")),NA,dt2$lake_mbgconhull_length_m)               
suppressWarnings(dt2$lake_mbgconhull_length_m <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt2$lake_mbgconhull_length_m))==as.character(as.numeric("NA"))),NA,dt2$lake_mbgconhull_length_m))
dt2$lake_mbgconhull_width_m <- ifelse((trimws(as.character(dt2$lake_mbgconhull_width_m))==trimws("NA")),NA,dt2$lake_mbgconhull_width_m)               
suppressWarnings(dt2$lake_mbgconhull_width_m <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt2$lake_mbgconhull_width_m))==as.character(as.numeric("NA"))),NA,dt2$lake_mbgconhull_width_m))
dt2$lake_mbgconhull_orientation_deg <- ifelse((trimws(as.character(dt2$lake_mbgconhull_orientation_deg))==trimws("NA")),NA,dt2$lake_mbgconhull_orientation_deg)               
suppressWarnings(dt2$lake_mbgconhull_orientation_deg <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt2$lake_mbgconhull_orientation_deg))==as.character(as.numeric("NA"))),NA,dt2$lake_mbgconhull_orientation_deg))
dt2$lake_mbgrect_length_m <- ifelse((trimws(as.character(dt2$lake_mbgrect_length_m))==trimws("NA")),NA,dt2$lake_mbgrect_length_m)               
suppressWarnings(dt2$lake_mbgrect_length_m <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt2$lake_mbgrect_length_m))==as.character(as.numeric("NA"))),NA,dt2$lake_mbgrect_length_m))
dt2$lake_mbgrect_width_m <- ifelse((trimws(as.character(dt2$lake_mbgrect_width_m))==trimws("NA")),NA,dt2$lake_mbgrect_width_m)               
suppressWarnings(dt2$lake_mbgrect_width_m <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt2$lake_mbgrect_width_m))==as.character(as.numeric("NA"))),NA,dt2$lake_mbgrect_width_m))
dt2$lake_mbgrect_arearatio <- ifelse((trimws(as.character(dt2$lake_mbgrect_arearatio))==trimws("NA")),NA,dt2$lake_mbgrect_arearatio)               
suppressWarnings(dt2$lake_mbgrect_arearatio <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt2$lake_mbgrect_arearatio))==as.character(as.numeric("NA"))),NA,dt2$lake_mbgrect_arearatio))
dt2$lake_meanwidth_m <- ifelse((trimws(as.character(dt2$lake_meanwidth_m))==trimws("NA")),NA,dt2$lake_meanwidth_m)               
suppressWarnings(dt2$lake_meanwidth_m <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt2$lake_meanwidth_m))==as.character(as.numeric("NA"))),NA,dt2$lake_meanwidth_m))
dt2$lake_connectivity_class <- as.factor(ifelse((trimws(as.character(dt2$lake_connectivity_class))==trimws("NA")),NA,as.character(dt2$lake_connectivity_class)))
dt2$lake_connectivity_fluctuates <- as.factor(ifelse((trimws(as.character(dt2$lake_connectivity_fluctuates))==trimws("NA")),NA,as.character(dt2$lake_connectivity_fluctuates)))
dt2$lake_connectivity_permanent <- as.factor(ifelse((trimws(as.character(dt2$lake_connectivity_permanent))==trimws("NA")),NA,as.character(dt2$lake_connectivity_permanent)))
dt2$lake_lakes4ha_upstream_ha <- ifelse((trimws(as.character(dt2$lake_lakes4ha_upstream_ha))==trimws("NA")),NA,dt2$lake_lakes4ha_upstream_ha)               
suppressWarnings(dt2$lake_lakes4ha_upstream_ha <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt2$lake_lakes4ha_upstream_ha))==as.character(as.numeric("NA"))),NA,dt2$lake_lakes4ha_upstream_ha))
dt2$lake_lakes4ha_upstream_n <- ifelse((trimws(as.character(dt2$lake_lakes4ha_upstream_n))==trimws("NA")),NA,dt2$lake_lakes4ha_upstream_n)               
suppressWarnings(dt2$lake_lakes4ha_upstream_n <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt2$lake_lakes4ha_upstream_n))==as.character(as.numeric("NA"))),NA,dt2$lake_lakes4ha_upstream_n))
dt2$lake_lakes1ha_upstream_ha <- ifelse((trimws(as.character(dt2$lake_lakes1ha_upstream_ha))==trimws("NA")),NA,dt2$lake_lakes1ha_upstream_ha)               
suppressWarnings(dt2$lake_lakes1ha_upstream_ha <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt2$lake_lakes1ha_upstream_ha))==as.character(as.numeric("NA"))),NA,dt2$lake_lakes1ha_upstream_ha))
dt2$lake_lakes1ha_upstream_n <- ifelse((trimws(as.character(dt2$lake_lakes1ha_upstream_n))==trimws("NA")),NA,dt2$lake_lakes1ha_upstream_n)               
suppressWarnings(dt2$lake_lakes1ha_upstream_n <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt2$lake_lakes1ha_upstream_n))==as.character(as.numeric("NA"))),NA,dt2$lake_lakes1ha_upstream_n))
dt2$lake_lakes10ha_upstream_n <- ifelse((trimws(as.character(dt2$lake_lakes10ha_upstream_n))==trimws("NA")),NA,dt2$lake_lakes10ha_upstream_n)               
suppressWarnings(dt2$lake_lakes10ha_upstream_n <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt2$lake_lakes10ha_upstream_n))==as.character(as.numeric("NA"))),NA,dt2$lake_lakes10ha_upstream_n))
dt2$lake_lakes10ha_upstream_ha <- ifelse((trimws(as.character(dt2$lake_lakes10ha_upstream_ha))==trimws("NA")),NA,dt2$lake_lakes10ha_upstream_ha)               
suppressWarnings(dt2$lake_lakes10ha_upstream_ha <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt2$lake_lakes10ha_upstream_ha))==as.character(as.numeric("NA"))),NA,dt2$lake_lakes10ha_upstream_ha))
dt2$lake_glaciatedlatewisc <- as.factor(ifelse((trimws(as.character(dt2$lake_glaciatedlatewisc))==trimws("NA")),NA,as.character(dt2$lake_glaciatedlatewisc)))


# Here is the structure of the input data frame:
str(dt2)                            
attach(dt2)                            
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

summary(as.factor(dt2$lake_connectivity_class)) 
summary(as.factor(dt2$lake_connectivity_fluctuates)) 
summary(as.factor(dt2$lake_connectivity_permanent)) 
summary(as.factor(dt2$lake_glaciatedlatewisc))
detach(dt2)               


inUrl3  <- "https://pasta.lternet.edu/package/data/eml/edi/854/1/8bd86b94234a21a74991eca7bd9ab883" 
infile3 <- tempfile()
try(download.file(inUrl3,infile3,method="curl"))
if (is.na(file.size(infile3))) download.file(inUrl3,infile3,method="auto")


dt3 <-read.csv(infile3,header=F 
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

if (class(dt3$lagoslakeid)=="factor") dt3$lagoslakeid <-as.numeric(levels(dt3$lagoslakeid))[as.integer(dt3$lagoslakeid) ]               
if (class(dt3$lagoslakeid)=="character") dt3$lagoslakeid <-as.numeric(dt3$lagoslakeid)
if (class(dt3$ws_zoneid)!="factor") dt3$ws_zoneid<- as.factor(dt3$ws_zoneid)
if (class(dt3$nws_zoneid)!="factor") dt3$nws_zoneid<- as.factor(dt3$nws_zoneid)
if (class(dt3$ws_subtype)!="factor") dt3$ws_subtype<- as.factor(dt3$ws_subtype)
if (class(dt3$ws_equalsnws)!="factor") dt3$ws_equalsnws<- as.factor(dt3$ws_equalsnws)
if (class(dt3$ws_onlandborder)!="factor") dt3$ws_onlandborder<- as.factor(dt3$ws_onlandborder)
if (class(dt3$ws_oncoast)!="factor") dt3$ws_oncoast<- as.factor(dt3$ws_oncoast)
if (class(dt3$ws_inusa_pct)=="factor") dt3$ws_inusa_pct <-as.numeric(levels(dt3$ws_inusa_pct))[as.integer(dt3$ws_inusa_pct) ]               
if (class(dt3$ws_inusa_pct)=="character") dt3$ws_inusa_pct <-as.numeric(dt3$ws_inusa_pct)
if (class(dt3$ws_includeshu4inlet)!="factor") dt3$ws_includeshu4inlet<- as.factor(dt3$ws_includeshu4inlet)
if (class(dt3$ws_ismultipart)!="factor") dt3$ws_ismultipart<- as.factor(dt3$ws_ismultipart)
if (class(dt3$ws_sliverflag)!="factor") dt3$ws_sliverflag<- as.factor(dt3$ws_sliverflag)
if (class(dt3$nws_onlandborder)!="factor") dt3$nws_onlandborder<- as.factor(dt3$nws_onlandborder)
if (class(dt3$nws_oncoast)!="factor") dt3$nws_oncoast<- as.factor(dt3$nws_oncoast)
if (class(dt3$nws_inusa_pct)=="factor") dt3$nws_inusa_pct <-as.numeric(levels(dt3$nws_inusa_pct))[as.integer(dt3$nws_inusa_pct) ]               
if (class(dt3$nws_inusa_pct)=="character") dt3$nws_inusa_pct <-as.numeric(dt3$nws_inusa_pct)
if (class(dt3$nws_includeshu4inlet)!="factor") dt3$nws_includeshu4inlet<- as.factor(dt3$nws_includeshu4inlet)
if (class(dt3$nws_ismultipart)!="factor") dt3$nws_ismultipart<- as.factor(dt3$nws_ismultipart)
if (class(dt3$ws_states)!="factor") dt3$ws_states<- as.factor(dt3$ws_states)
if (class(dt3$ws_focallakewaterarea_ha)=="factor") dt3$ws_focallakewaterarea_ha <-as.numeric(levels(dt3$ws_focallakewaterarea_ha))[as.integer(dt3$ws_focallakewaterarea_ha) ]               
if (class(dt3$ws_focallakewaterarea_ha)=="character") dt3$ws_focallakewaterarea_ha <-as.numeric(dt3$ws_focallakewaterarea_ha)
if (class(dt3$ws_area_ha)=="factor") dt3$ws_area_ha <-as.numeric(levels(dt3$ws_area_ha))[as.integer(dt3$ws_area_ha) ]               
if (class(dt3$ws_area_ha)=="character") dt3$ws_area_ha <-as.numeric(dt3$ws_area_ha)
if (class(dt3$ws_perimeter_m)=="factor") dt3$ws_perimeter_m <-as.numeric(levels(dt3$ws_perimeter_m))[as.integer(dt3$ws_perimeter_m) ]               
if (class(dt3$ws_perimeter_m)=="character") dt3$ws_perimeter_m <-as.numeric(dt3$ws_perimeter_m)
if (class(dt3$ws_lake_arearatio)=="factor") dt3$ws_lake_arearatio <-as.numeric(levels(dt3$ws_lake_arearatio))[as.integer(dt3$ws_lake_arearatio) ]               
if (class(dt3$ws_lake_arearatio)=="character") dt3$ws_lake_arearatio <-as.numeric(dt3$ws_lake_arearatio)
if (class(dt3$ws_mbgconhull_length_m)=="factor") dt3$ws_mbgconhull_length_m <-as.numeric(levels(dt3$ws_mbgconhull_length_m))[as.integer(dt3$ws_mbgconhull_length_m) ]               
if (class(dt3$ws_mbgconhull_length_m)=="character") dt3$ws_mbgconhull_length_m <-as.numeric(dt3$ws_mbgconhull_length_m)
if (class(dt3$ws_mbgconhull_width_m)=="factor") dt3$ws_mbgconhull_width_m <-as.numeric(levels(dt3$ws_mbgconhull_width_m))[as.integer(dt3$ws_mbgconhull_width_m) ]               
if (class(dt3$ws_mbgconhull_width_m)=="character") dt3$ws_mbgconhull_width_m <-as.numeric(dt3$ws_mbgconhull_width_m)
if (class(dt3$ws_mbgconhull_orientation_deg)=="factor") dt3$ws_mbgconhull_orientation_deg <-as.numeric(levels(dt3$ws_mbgconhull_orientation_deg))[as.integer(dt3$ws_mbgconhull_orientation_deg) ]               
if (class(dt3$ws_mbgconhull_orientation_deg)=="character") dt3$ws_mbgconhull_orientation_deg <-as.numeric(dt3$ws_mbgconhull_orientation_deg)
if (class(dt3$ws_meanwidth_m)=="factor") dt3$ws_meanwidth_m <-as.numeric(levels(dt3$ws_meanwidth_m))[as.integer(dt3$ws_meanwidth_m) ]               
if (class(dt3$ws_meanwidth_m)=="character") dt3$ws_meanwidth_m <-as.numeric(dt3$ws_meanwidth_m)
if (class(dt3$ws_lat_decdeg)=="factor") dt3$ws_lat_decdeg <-as.numeric(levels(dt3$ws_lat_decdeg))[as.integer(dt3$ws_lat_decdeg) ]               
if (class(dt3$ws_lat_decdeg)=="character") dt3$ws_lat_decdeg <-as.numeric(dt3$ws_lat_decdeg)
if (class(dt3$ws_lon_decdeg)=="factor") dt3$ws_lon_decdeg <-as.numeric(levels(dt3$ws_lon_decdeg))[as.integer(dt3$ws_lon_decdeg) ]               
if (class(dt3$ws_lon_decdeg)=="character") dt3$ws_lon_decdeg <-as.numeric(dt3$ws_lon_decdeg)
if (class(dt3$nws_states)!="factor") dt3$nws_states<- as.factor(dt3$nws_states)
if (class(dt3$nws_focallakewaterarea_ha)=="factor") dt3$nws_focallakewaterarea_ha <-as.numeric(levels(dt3$nws_focallakewaterarea_ha))[as.integer(dt3$nws_focallakewaterarea_ha) ]               
if (class(dt3$nws_focallakewaterarea_ha)=="character") dt3$nws_focallakewaterarea_ha <-as.numeric(dt3$nws_focallakewaterarea_ha)
if (class(dt3$nws_area_ha)=="factor") dt3$nws_area_ha <-as.numeric(levels(dt3$nws_area_ha))[as.integer(dt3$nws_area_ha) ]               
if (class(dt3$nws_area_ha)=="character") dt3$nws_area_ha <-as.numeric(dt3$nws_area_ha)
if (class(dt3$nws_perimeter_m)=="factor") dt3$nws_perimeter_m <-as.numeric(levels(dt3$nws_perimeter_m))[as.integer(dt3$nws_perimeter_m) ]               
if (class(dt3$nws_perimeter_m)=="character") dt3$nws_perimeter_m <-as.numeric(dt3$nws_perimeter_m)
if (class(dt3$nws_lake_arearatio)=="factor") dt3$nws_lake_arearatio <-as.numeric(levels(dt3$nws_lake_arearatio))[as.integer(dt3$nws_lake_arearatio) ]               
if (class(dt3$nws_lake_arearatio)=="character") dt3$nws_lake_arearatio <-as.numeric(dt3$nws_lake_arearatio)
if (class(dt3$nws_mbgconhull_length_m)=="factor") dt3$nws_mbgconhull_length_m <-as.numeric(levels(dt3$nws_mbgconhull_length_m))[as.integer(dt3$nws_mbgconhull_length_m) ]               
if (class(dt3$nws_mbgconhull_length_m)=="character") dt3$nws_mbgconhull_length_m <-as.numeric(dt3$nws_mbgconhull_length_m)
if (class(dt3$nws_mbgconhull_width_m)=="factor") dt3$nws_mbgconhull_width_m <-as.numeric(levels(dt3$nws_mbgconhull_width_m))[as.integer(dt3$nws_mbgconhull_width_m) ]               
if (class(dt3$nws_mbgconhull_width_m)=="character") dt3$nws_mbgconhull_width_m <-as.numeric(dt3$nws_mbgconhull_width_m)
if (class(dt3$nws_mbgconhull_orientation_deg)=="factor") dt3$nws_mbgconhull_orientation_deg <-as.numeric(levels(dt3$nws_mbgconhull_orientation_deg))[as.integer(dt3$nws_mbgconhull_orientation_deg) ]               
if (class(dt3$nws_mbgconhull_orientation_deg)=="character") dt3$nws_mbgconhull_orientation_deg <-as.numeric(dt3$nws_mbgconhull_orientation_deg)
if (class(dt3$nws_meanwidth_m)=="factor") dt3$nws_meanwidth_m <-as.numeric(levels(dt3$nws_meanwidth_m))[as.integer(dt3$nws_meanwidth_m) ]               
if (class(dt3$nws_meanwidth_m)=="character") dt3$nws_meanwidth_m <-as.numeric(dt3$nws_meanwidth_m)
if (class(dt3$nws_lat_decdeg)=="factor") dt3$nws_lat_decdeg <-as.numeric(levels(dt3$nws_lat_decdeg))[as.integer(dt3$nws_lat_decdeg) ]               
if (class(dt3$nws_lat_decdeg)=="character") dt3$nws_lat_decdeg <-as.numeric(dt3$nws_lat_decdeg)
if (class(dt3$nws_lon_decdeg)=="factor") dt3$nws_lon_decdeg <-as.numeric(levels(dt3$nws_lon_decdeg))[as.integer(dt3$nws_lon_decdeg) ]               
if (class(dt3$nws_lon_decdeg)=="character") dt3$nws_lon_decdeg <-as.numeric(dt3$nws_lon_decdeg)

# Convert Missing Values to NA for non-dates

dt3$lagoslakeid <- ifelse((trimws(as.character(dt3$lagoslakeid))==trimws("NA")),NA,dt3$lagoslakeid)               
suppressWarnings(dt3$lagoslakeid <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt3$lagoslakeid))==as.character(as.numeric("NA"))),NA,dt3$lagoslakeid))
dt3$ws_zoneid <- as.factor(ifelse((trimws(as.character(dt3$ws_zoneid))==trimws("NA")),NA,as.character(dt3$ws_zoneid)))
dt3$nws_zoneid <- as.factor(ifelse((trimws(as.character(dt3$nws_zoneid))==trimws("NA")),NA,as.character(dt3$nws_zoneid)))
dt3$ws_subtype <- as.factor(ifelse((trimws(as.character(dt3$ws_subtype))==trimws("NA")),NA,as.character(dt3$ws_subtype)))
dt3$ws_equalsnws <- as.factor(ifelse((trimws(as.character(dt3$ws_equalsnws))==trimws("NA")),NA,as.character(dt3$ws_equalsnws)))
dt3$ws_onlandborder <- as.factor(ifelse((trimws(as.character(dt3$ws_onlandborder))==trimws("NA")),NA,as.character(dt3$ws_onlandborder)))
dt3$ws_oncoast <- as.factor(ifelse((trimws(as.character(dt3$ws_oncoast))==trimws("NA")),NA,as.character(dt3$ws_oncoast)))
dt3$ws_inusa_pct <- ifelse((trimws(as.character(dt3$ws_inusa_pct))==trimws("NA")),NA,dt3$ws_inusa_pct)               
suppressWarnings(dt3$ws_inusa_pct <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt3$ws_inusa_pct))==as.character(as.numeric("NA"))),NA,dt3$ws_inusa_pct))
dt3$ws_includeshu4inlet <- as.factor(ifelse((trimws(as.character(dt3$ws_includeshu4inlet))==trimws("NA")),NA,as.character(dt3$ws_includeshu4inlet)))
dt3$ws_ismultipart <- as.factor(ifelse((trimws(as.character(dt3$ws_ismultipart))==trimws("NA")),NA,as.character(dt3$ws_ismultipart)))
dt3$ws_sliverflag <- as.factor(ifelse((trimws(as.character(dt3$ws_sliverflag))==trimws("NA")),NA,as.character(dt3$ws_sliverflag)))
dt3$nws_onlandborder <- as.factor(ifelse((trimws(as.character(dt3$nws_onlandborder))==trimws("NA")),NA,as.character(dt3$nws_onlandborder)))
dt3$nws_oncoast <- as.factor(ifelse((trimws(as.character(dt3$nws_oncoast))==trimws("NA")),NA,as.character(dt3$nws_oncoast)))
dt3$nws_inusa_pct <- ifelse((trimws(as.character(dt3$nws_inusa_pct))==trimws("NA")),NA,dt3$nws_inusa_pct)               
suppressWarnings(dt3$nws_inusa_pct <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt3$nws_inusa_pct))==as.character(as.numeric("NA"))),NA,dt3$nws_inusa_pct))
dt3$nws_includeshu4inlet <- as.factor(ifelse((trimws(as.character(dt3$nws_includeshu4inlet))==trimws("NA")),NA,as.character(dt3$nws_includeshu4inlet)))
dt3$nws_ismultipart <- as.factor(ifelse((trimws(as.character(dt3$nws_ismultipart))==trimws("NA")),NA,as.character(dt3$nws_ismultipart)))
dt3$ws_states <- as.factor(ifelse((trimws(as.character(dt3$ws_states))==trimws("NA")),NA,as.character(dt3$ws_states)))
dt3$ws_focallakewaterarea_ha <- ifelse((trimws(as.character(dt3$ws_focallakewaterarea_ha))==trimws("NA")),NA,dt3$ws_focallakewaterarea_ha)               
suppressWarnings(dt3$ws_focallakewaterarea_ha <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt3$ws_focallakewaterarea_ha))==as.character(as.numeric("NA"))),NA,dt3$ws_focallakewaterarea_ha))
dt3$ws_area_ha <- ifelse((trimws(as.character(dt3$ws_area_ha))==trimws("NA")),NA,dt3$ws_area_ha)               
suppressWarnings(dt3$ws_area_ha <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt3$ws_area_ha))==as.character(as.numeric("NA"))),NA,dt3$ws_area_ha))
dt3$ws_perimeter_m <- ifelse((trimws(as.character(dt3$ws_perimeter_m))==trimws("NA")),NA,dt3$ws_perimeter_m)               
suppressWarnings(dt3$ws_perimeter_m <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt3$ws_perimeter_m))==as.character(as.numeric("NA"))),NA,dt3$ws_perimeter_m))
dt3$ws_lake_arearatio <- ifelse((trimws(as.character(dt3$ws_lake_arearatio))==trimws("NA")),NA,dt3$ws_lake_arearatio)               
suppressWarnings(dt3$ws_lake_arearatio <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt3$ws_lake_arearatio))==as.character(as.numeric("NA"))),NA,dt3$ws_lake_arearatio))
dt3$ws_mbgconhull_length_m <- ifelse((trimws(as.character(dt3$ws_mbgconhull_length_m))==trimws("NA")),NA,dt3$ws_mbgconhull_length_m)               
suppressWarnings(dt3$ws_mbgconhull_length_m <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt3$ws_mbgconhull_length_m))==as.character(as.numeric("NA"))),NA,dt3$ws_mbgconhull_length_m))
dt3$ws_mbgconhull_width_m <- ifelse((trimws(as.character(dt3$ws_mbgconhull_width_m))==trimws("NA")),NA,dt3$ws_mbgconhull_width_m)               
suppressWarnings(dt3$ws_mbgconhull_width_m <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt3$ws_mbgconhull_width_m))==as.character(as.numeric("NA"))),NA,dt3$ws_mbgconhull_width_m))
dt3$ws_mbgconhull_orientation_deg <- ifelse((trimws(as.character(dt3$ws_mbgconhull_orientation_deg))==trimws("NA")),NA,dt3$ws_mbgconhull_orientation_deg)               
suppressWarnings(dt3$ws_mbgconhull_orientation_deg <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt3$ws_mbgconhull_orientation_deg))==as.character(as.numeric("NA"))),NA,dt3$ws_mbgconhull_orientation_deg))
dt3$ws_meanwidth_m <- ifelse((trimws(as.character(dt3$ws_meanwidth_m))==trimws("NA")),NA,dt3$ws_meanwidth_m)               
suppressWarnings(dt3$ws_meanwidth_m <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt3$ws_meanwidth_m))==as.character(as.numeric("NA"))),NA,dt3$ws_meanwidth_m))
dt3$ws_lat_decdeg <- ifelse((trimws(as.character(dt3$ws_lat_decdeg))==trimws("NA")),NA,dt3$ws_lat_decdeg)               
suppressWarnings(dt3$ws_lat_decdeg <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt3$ws_lat_decdeg))==as.character(as.numeric("NA"))),NA,dt3$ws_lat_decdeg))
dt3$ws_lon_decdeg <- ifelse((trimws(as.character(dt3$ws_lon_decdeg))==trimws("NA")),NA,dt3$ws_lon_decdeg)               
suppressWarnings(dt3$ws_lon_decdeg <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt3$ws_lon_decdeg))==as.character(as.numeric("NA"))),NA,dt3$ws_lon_decdeg))
dt3$nws_states <- as.factor(ifelse((trimws(as.character(dt3$nws_states))==trimws("NA")),NA,as.character(dt3$nws_states)))
dt3$nws_focallakewaterarea_ha <- ifelse((trimws(as.character(dt3$nws_focallakewaterarea_ha))==trimws("NA")),NA,dt3$nws_focallakewaterarea_ha)               
suppressWarnings(dt3$nws_focallakewaterarea_ha <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt3$nws_focallakewaterarea_ha))==as.character(as.numeric("NA"))),NA,dt3$nws_focallakewaterarea_ha))
dt3$nws_area_ha <- ifelse((trimws(as.character(dt3$nws_area_ha))==trimws("NA")),NA,dt3$nws_area_ha)               
suppressWarnings(dt3$nws_area_ha <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt3$nws_area_ha))==as.character(as.numeric("NA"))),NA,dt3$nws_area_ha))
dt3$nws_perimeter_m <- ifelse((trimws(as.character(dt3$nws_perimeter_m))==trimws("NA")),NA,dt3$nws_perimeter_m)               
suppressWarnings(dt3$nws_perimeter_m <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt3$nws_perimeter_m))==as.character(as.numeric("NA"))),NA,dt3$nws_perimeter_m))
dt3$nws_lake_arearatio <- ifelse((trimws(as.character(dt3$nws_lake_arearatio))==trimws("NA")),NA,dt3$nws_lake_arearatio)               
suppressWarnings(dt3$nws_lake_arearatio <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt3$nws_lake_arearatio))==as.character(as.numeric("NA"))),NA,dt3$nws_lake_arearatio))
dt3$nws_mbgconhull_length_m <- ifelse((trimws(as.character(dt3$nws_mbgconhull_length_m))==trimws("NA")),NA,dt3$nws_mbgconhull_length_m)               
suppressWarnings(dt3$nws_mbgconhull_length_m <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt3$nws_mbgconhull_length_m))==as.character(as.numeric("NA"))),NA,dt3$nws_mbgconhull_length_m))
dt3$nws_mbgconhull_width_m <- ifelse((trimws(as.character(dt3$nws_mbgconhull_width_m))==trimws("NA")),NA,dt3$nws_mbgconhull_width_m)               
suppressWarnings(dt3$nws_mbgconhull_width_m <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt3$nws_mbgconhull_width_m))==as.character(as.numeric("NA"))),NA,dt3$nws_mbgconhull_width_m))
dt3$nws_mbgconhull_orientation_deg <- ifelse((trimws(as.character(dt3$nws_mbgconhull_orientation_deg))==trimws("NA")),NA,dt3$nws_mbgconhull_orientation_deg)               
suppressWarnings(dt3$nws_mbgconhull_orientation_deg <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt3$nws_mbgconhull_orientation_deg))==as.character(as.numeric("NA"))),NA,dt3$nws_mbgconhull_orientation_deg))
dt3$nws_meanwidth_m <- ifelse((trimws(as.character(dt3$nws_meanwidth_m))==trimws("NA")),NA,dt3$nws_meanwidth_m)               
suppressWarnings(dt3$nws_meanwidth_m <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt3$nws_meanwidth_m))==as.character(as.numeric("NA"))),NA,dt3$nws_meanwidth_m))
dt3$nws_lat_decdeg <- ifelse((trimws(as.character(dt3$nws_lat_decdeg))==trimws("NA")),NA,dt3$nws_lat_decdeg)               
suppressWarnings(dt3$nws_lat_decdeg <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt3$nws_lat_decdeg))==as.character(as.numeric("NA"))),NA,dt3$nws_lat_decdeg))
dt3$nws_lon_decdeg <- ifelse((trimws(as.character(dt3$nws_lon_decdeg))==trimws("NA")),NA,dt3$nws_lon_decdeg)               
suppressWarnings(dt3$nws_lon_decdeg <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt3$nws_lon_decdeg))==as.character(as.numeric("NA"))),NA,dt3$nws_lon_decdeg))


# Here is the structure of the input data frame:
str(dt3)                            
attach(dt3)                            
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

summary(as.factor(dt3$ws_zoneid)) 
summary(as.factor(dt3$nws_zoneid)) 
summary(as.factor(dt3$ws_subtype)) 
summary(as.factor(dt3$ws_equalsnws)) 
summary(as.factor(dt3$ws_onlandborder)) 
summary(as.factor(dt3$ws_oncoast)) 
summary(as.factor(dt3$ws_includeshu4inlet)) 
summary(as.factor(dt3$ws_ismultipart)) 
summary(as.factor(dt3$ws_sliverflag)) 
summary(as.factor(dt3$nws_onlandborder)) 
summary(as.factor(dt3$nws_oncoast)) 
summary(as.factor(dt3$nws_includeshu4inlet)) 
summary(as.factor(dt3$nws_ismultipart)) 
summary(as.factor(dt3$ws_states)) 
summary(as.factor(dt3$nws_states))
detach(dt3)               


inUrl4  <- "https://pasta.lternet.edu/package/data/eml/edi/854/1/5488e333ce818597fa3dbfc9b4e0c131" 
infile4 <- tempfile()
try(download.file(inUrl4,infile4,method="curl"))
if (is.na(file.size(infile4))) download.file(inUrl4,infile4,method="auto")


dt4 <-read.csv(infile4,header=F 
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

if (class(dt4$lagoslakeid)=="factor") dt4$lagoslakeid <-as.numeric(levels(dt4$lagoslakeid))[as.integer(dt4$lagoslakeid) ]               
if (class(dt4$lagoslakeid)=="character") dt4$lagoslakeid <-as.numeric(dt4$lagoslakeid)
if (class(dt4$lake_nhdid)!="factor") dt4$lake_nhdid<- as.factor(dt4$lake_nhdid)
if (class(dt4$lake_reachcode)!="factor") dt4$lake_reachcode<- as.factor(dt4$lake_reachcode)
if (class(dt4$lake_namegnis)!="factor") dt4$lake_namegnis<- as.factor(dt4$lake_namegnis)
if (class(dt4$lake_namelagos)!="factor") dt4$lake_namelagos<- as.factor(dt4$lake_namelagos)
if (class(dt4$lake_county)!="factor") dt4$lake_county<- as.factor(dt4$lake_county)
if (class(dt4$lake_countyfips)!="factor") dt4$lake_countyfips<- as.factor(dt4$lake_countyfips)
if (class(dt4$lake_lat_decdeg)=="factor") dt4$lake_lat_decdeg <-as.numeric(levels(dt4$lake_lat_decdeg))[as.integer(dt4$lake_lat_decdeg) ]               
if (class(dt4$lake_lat_decdeg)=="character") dt4$lake_lat_decdeg <-as.numeric(dt4$lake_lat_decdeg)
if (class(dt4$lake_lon_decdeg)=="factor") dt4$lake_lon_decdeg <-as.numeric(levels(dt4$lake_lon_decdeg))[as.integer(dt4$lake_lon_decdeg) ]               
if (class(dt4$lake_lon_decdeg)=="character") dt4$lake_lon_decdeg <-as.numeric(dt4$lake_lon_decdeg)
if (class(dt4$lake_centroidstate)!="factor") dt4$lake_centroidstate<- as.factor(dt4$lake_centroidstate)
if (class(dt4$nhdhr_area_sqkm)=="factor") dt4$nhdhr_area_sqkm <-as.numeric(levels(dt4$nhdhr_area_sqkm))[as.integer(dt4$nhdhr_area_sqkm) ]               
if (class(dt4$nhdhr_area_sqkm)=="character") dt4$nhdhr_area_sqkm <-as.numeric(dt4$nhdhr_area_sqkm)
if (class(dt4$nhdhr_fdate)!="factor") dt4$nhdhr_fdate<- as.factor(dt4$nhdhr_fdate)
if (class(dt4$nhdhr_gnisid)!="factor") dt4$nhdhr_gnisid<- as.factor(dt4$nhdhr_gnisid)
if (class(dt4$lagosus_legacysiteid)!="factor") dt4$lagosus_legacysiteid<- as.factor(dt4$lagosus_legacysiteid)
if (class(dt4$lagosus_legacysitelabel)!="factor") dt4$lagosus_legacysitelabel<- as.factor(dt4$lagosus_legacysitelabel)
if (class(dt4$lagosus_legacyprogram)!="factor") dt4$lagosus_legacyprogram<- as.factor(dt4$lagosus_legacyprogram)
if (class(dt4$wqp_monitoringlocationidentifier)!="factor") dt4$wqp_monitoringlocationidentifier<- as.factor(dt4$wqp_monitoringlocationidentifier)
if (class(dt4$wqp_monitoringlocationname)!="factor") dt4$wqp_monitoringlocationname<- as.factor(dt4$wqp_monitoringlocationname)
if (class(dt4$wqp_providername)!="factor") dt4$wqp_providername<- as.factor(dt4$wqp_providername)
if (class(dt4$nhdplusv2_comid)!="factor") dt4$nhdplusv2_comid<- as.factor(dt4$nhdplusv2_comid)
if (class(dt4$nhdplusv2_reachcode)!="factor") dt4$nhdplusv2_reachcode<- as.factor(dt4$nhdplusv2_reachcode)
if (class(dt4$nhdplusv2_area_sqkm)=="factor") dt4$nhdplusv2_area_sqkm <-as.numeric(levels(dt4$nhdplusv2_area_sqkm))[as.integer(dt4$nhdplusv2_area_sqkm) ]               
if (class(dt4$nhdplusv2_area_sqkm)=="character") dt4$nhdplusv2_area_sqkm <-as.numeric(dt4$nhdplusv2_area_sqkm)
if (class(dt4$lagosne_lagoslakeid)=="factor") dt4$lagosne_lagoslakeid <-as.numeric(levels(dt4$lagosne_lagoslakeid))[as.integer(dt4$lagosne_lagoslakeid) ]               
if (class(dt4$lagosne_lagoslakeid)=="character") dt4$lagosne_lagoslakeid <-as.numeric(dt4$lagosne_lagoslakeid)
if (class(dt4$lagosne_legacysiteid)!="factor") dt4$lagosne_legacysiteid<- as.factor(dt4$lagosne_legacysiteid)
if (class(dt4$nla2007_siteid)!="factor") dt4$nla2007_siteid<- as.factor(dt4$nla2007_siteid)
if (class(dt4$nla2012_siteid)!="factor") dt4$nla2012_siteid<- as.factor(dt4$nla2012_siteid)
if (class(dt4$nhdplusv2_lakes_n)=="factor") dt4$nhdplusv2_lakes_n <-as.numeric(levels(dt4$nhdplusv2_lakes_n))[as.integer(dt4$nhdplusv2_lakes_n) ]               
if (class(dt4$nhdplusv2_lakes_n)=="character") dt4$nhdplusv2_lakes_n <-as.numeric(dt4$nhdplusv2_lakes_n)
if (class(dt4$lagosne_lakes_n)=="factor") dt4$lagosne_lakes_n <-as.numeric(levels(dt4$lagosne_lakes_n))[as.integer(dt4$lagosne_lakes_n) ]               
if (class(dt4$lagosne_lakes_n)=="character") dt4$lagosne_lakes_n <-as.numeric(dt4$lagosne_lakes_n)
if (class(dt4$wqp_sites_n)=="factor") dt4$wqp_sites_n <-as.numeric(levels(dt4$wqp_sites_n))[as.integer(dt4$wqp_sites_n) ]               
if (class(dt4$wqp_sites_n)=="character") dt4$wqp_sites_n <-as.numeric(dt4$wqp_sites_n)
if (class(dt4$lagosus_legacyids_n)=="factor") dt4$lagosus_legacyids_n <-as.numeric(levels(dt4$lagosus_legacyids_n))[as.integer(dt4$lagosus_legacyids_n) ]               
if (class(dt4$lagosus_legacyids_n)=="character") dt4$lagosus_legacyids_n <-as.numeric(dt4$lagosus_legacyids_n)

# Convert Missing Values to NA for non-dates

dt4$lagoslakeid <- ifelse((trimws(as.character(dt4$lagoslakeid))==trimws("NA")),NA,dt4$lagoslakeid)               
suppressWarnings(dt4$lagoslakeid <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt4$lagoslakeid))==as.character(as.numeric("NA"))),NA,dt4$lagoslakeid))
dt4$lake_nhdid <- as.factor(ifelse((trimws(as.character(dt4$lake_nhdid))==trimws("NA")),NA,as.character(dt4$lake_nhdid)))
dt4$lake_reachcode <- as.factor(ifelse((trimws(as.character(dt4$lake_reachcode))==trimws("NA")),NA,as.character(dt4$lake_reachcode)))
dt4$lake_namegnis <- as.factor(ifelse((trimws(as.character(dt4$lake_namegnis))==trimws("NA")),NA,as.character(dt4$lake_namegnis)))
dt4$lake_namelagos <- as.factor(ifelse((trimws(as.character(dt4$lake_namelagos))==trimws("NA")),NA,as.character(dt4$lake_namelagos)))
dt4$lake_county <- as.factor(ifelse((trimws(as.character(dt4$lake_county))==trimws("NA")),NA,as.character(dt4$lake_county)))
dt4$lake_countyfips <- as.factor(ifelse((trimws(as.character(dt4$lake_countyfips))==trimws("NA")),NA,as.character(dt4$lake_countyfips)))
dt4$lake_lat_decdeg <- ifelse((trimws(as.character(dt4$lake_lat_decdeg))==trimws("NA")),NA,dt4$lake_lat_decdeg)               
suppressWarnings(dt4$lake_lat_decdeg <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt4$lake_lat_decdeg))==as.character(as.numeric("NA"))),NA,dt4$lake_lat_decdeg))
dt4$lake_lon_decdeg <- ifelse((trimws(as.character(dt4$lake_lon_decdeg))==trimws("NA")),NA,dt4$lake_lon_decdeg)               
suppressWarnings(dt4$lake_lon_decdeg <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt4$lake_lon_decdeg))==as.character(as.numeric("NA"))),NA,dt4$lake_lon_decdeg))
dt4$lake_centroidstate <- as.factor(ifelse((trimws(as.character(dt4$lake_centroidstate))==trimws("NA")),NA,as.character(dt4$lake_centroidstate)))
dt4$nhdhr_area_sqkm <- ifelse((trimws(as.character(dt4$nhdhr_area_sqkm))==trimws("NA")),NA,dt4$nhdhr_area_sqkm)               
suppressWarnings(dt4$nhdhr_area_sqkm <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt4$nhdhr_area_sqkm))==as.character(as.numeric("NA"))),NA,dt4$nhdhr_area_sqkm))
dt4$nhdhr_fdate <- as.factor(ifelse((trimws(as.character(dt4$nhdhr_fdate))==trimws("NA")),NA,as.character(dt4$nhdhr_fdate)))
dt4$nhdhr_gnisid <- as.factor(ifelse((trimws(as.character(dt4$nhdhr_gnisid))==trimws("NA")),NA,as.character(dt4$nhdhr_gnisid)))
dt4$lagosus_legacysiteid <- as.factor(ifelse((trimws(as.character(dt4$lagosus_legacysiteid))==trimws("NA")),NA,as.character(dt4$lagosus_legacysiteid)))
dt4$lagosus_legacysitelabel <- as.factor(ifelse((trimws(as.character(dt4$lagosus_legacysitelabel))==trimws("NA")),NA,as.character(dt4$lagosus_legacysitelabel)))
dt4$lagosus_legacyprogram <- as.factor(ifelse((trimws(as.character(dt4$lagosus_legacyprogram))==trimws("NA")),NA,as.character(dt4$lagosus_legacyprogram)))
dt4$wqp_monitoringlocationidentifier <- as.factor(ifelse((trimws(as.character(dt4$wqp_monitoringlocationidentifier))==trimws("NA")),NA,as.character(dt4$wqp_monitoringlocationidentifier)))
dt4$wqp_monitoringlocationname <- as.factor(ifelse((trimws(as.character(dt4$wqp_monitoringlocationname))==trimws("NA")),NA,as.character(dt4$wqp_monitoringlocationname)))
dt4$wqp_providername <- as.factor(ifelse((trimws(as.character(dt4$wqp_providername))==trimws("NA")),NA,as.character(dt4$wqp_providername)))
dt4$nhdplusv2_comid <- as.factor(ifelse((trimws(as.character(dt4$nhdplusv2_comid))==trimws("NA")),NA,as.character(dt4$nhdplusv2_comid)))
dt4$nhdplusv2_reachcode <- as.factor(ifelse((trimws(as.character(dt4$nhdplusv2_reachcode))==trimws("NA")),NA,as.character(dt4$nhdplusv2_reachcode)))
dt4$nhdplusv2_area_sqkm <- ifelse((trimws(as.character(dt4$nhdplusv2_area_sqkm))==trimws("NA")),NA,dt4$nhdplusv2_area_sqkm)               
suppressWarnings(dt4$nhdplusv2_area_sqkm <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt4$nhdplusv2_area_sqkm))==as.character(as.numeric("NA"))),NA,dt4$nhdplusv2_area_sqkm))
dt4$lagosne_lagoslakeid <- ifelse((trimws(as.character(dt4$lagosne_lagoslakeid))==trimws("NA")),NA,dt4$lagosne_lagoslakeid)               
suppressWarnings(dt4$lagosne_lagoslakeid <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt4$lagosne_lagoslakeid))==as.character(as.numeric("NA"))),NA,dt4$lagosne_lagoslakeid))
dt4$lagosne_legacysiteid <- as.factor(ifelse((trimws(as.character(dt4$lagosne_legacysiteid))==trimws("NA")),NA,as.character(dt4$lagosne_legacysiteid)))
dt4$nla2007_siteid <- as.factor(ifelse((trimws(as.character(dt4$nla2007_siteid))==trimws("NA")),NA,as.character(dt4$nla2007_siteid)))
dt4$nla2012_siteid <- as.factor(ifelse((trimws(as.character(dt4$nla2012_siteid))==trimws("NA")),NA,as.character(dt4$nla2012_siteid)))
dt4$nhdplusv2_lakes_n <- ifelse((trimws(as.character(dt4$nhdplusv2_lakes_n))==trimws("NA")),NA,dt4$nhdplusv2_lakes_n)               
suppressWarnings(dt4$nhdplusv2_lakes_n <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt4$nhdplusv2_lakes_n))==as.character(as.numeric("NA"))),NA,dt4$nhdplusv2_lakes_n))
dt4$lagosne_lakes_n <- ifelse((trimws(as.character(dt4$lagosne_lakes_n))==trimws("NA")),NA,dt4$lagosne_lakes_n)               
suppressWarnings(dt4$lagosne_lakes_n <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt4$lagosne_lakes_n))==as.character(as.numeric("NA"))),NA,dt4$lagosne_lakes_n))
dt4$wqp_sites_n <- ifelse((trimws(as.character(dt4$wqp_sites_n))==trimws("NA")),NA,dt4$wqp_sites_n)               
suppressWarnings(dt4$wqp_sites_n <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt4$wqp_sites_n))==as.character(as.numeric("NA"))),NA,dt4$wqp_sites_n))
dt4$lagosus_legacyids_n <- ifelse((trimws(as.character(dt4$lagosus_legacyids_n))==trimws("NA")),NA,dt4$lagosus_legacyids_n)               
suppressWarnings(dt4$lagosus_legacyids_n <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt4$lagosus_legacyids_n))==as.character(as.numeric("NA"))),NA,dt4$lagosus_legacyids_n))


# Here is the structure of the input data frame:
str(dt4)                            
attach(dt4)                            
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

summary(as.factor(dt4$lake_nhdid)) 
summary(as.factor(dt4$lake_reachcode)) 
summary(as.factor(dt4$lake_namegnis)) 
summary(as.factor(dt4$lake_namelagos)) 
summary(as.factor(dt4$lake_county)) 
summary(as.factor(dt4$lake_countyfips)) 
summary(as.factor(dt4$lake_centroidstate)) 
summary(as.factor(dt4$nhdhr_fdate)) 
summary(as.factor(dt4$nhdhr_gnisid)) 
summary(as.factor(dt4$lagosus_legacysiteid)) 
summary(as.factor(dt4$lagosus_legacysitelabel)) 
summary(as.factor(dt4$lagosus_legacyprogram)) 
summary(as.factor(dt4$wqp_monitoringlocationidentifier)) 
summary(as.factor(dt4$wqp_monitoringlocationname)) 
summary(as.factor(dt4$wqp_providername)) 
summary(as.factor(dt4$nhdplusv2_comid)) 
summary(as.factor(dt4$nhdplusv2_reachcode)) 
summary(as.factor(dt4$lagosne_legacysiteid)) 
summary(as.factor(dt4$nla2007_siteid)) 
summary(as.factor(dt4$nla2012_siteid))
detach(dt4)               





