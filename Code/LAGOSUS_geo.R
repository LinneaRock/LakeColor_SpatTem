# Package ID: edi.1136.2 Cataloging System:https://pasta.edirepository.org.
# Data set title: LAGOS-US GEO v1.0: Data module of lake geospatial ecological context at multiple spatial and temporal scales in the conterminous U.S..
# Data set creator:  Nicole Smith - Michigan State University 
# Data set creator:  Katherine Webster - Michigan State University 
# Data set creator:  Lauren Rodriguez - Michigan State University 
# Data set creator:  Kendra Cheruvelil - Michigan State University 
# Data set creator:  Paticia Soranno - Michigan State University 
# Contact:  Kendra Cheruvelil -  Michigan State University  - ksc@msu.edu
# Stylesheet v2.11 for metadata conversion into program: John H. Porter, Univ. Virginia, jporter@virginia.edu 

inUrl1  <- "https://pasta.lternet.edu/package/data/eml/edi/1136/2/add975113c90ccbc1479c0913172736a" 
infile1 <- tempfile()
try(download.file(inUrl1,infile1,method="curl"))
if (is.na(file.size(infile1))) download.file(inUrl1,infile1,method="auto")


geo1 <-read.csv(infile1,header=F 
               ,skip=1
               ,sep=","  
               ,quot='"' 
               , col.names=c(
                 "dictionary_type",     
                 "table_name",     
                 "variable_name",     
                 "variable_description",     
                 "taxonomy_type",     
                 "main_feature",     
                 "subgroup",     
                 "units",     
                 "in_lagosne",     
                 "data_type",     
                 "domain",     
                 "precision",     
                 "missing_values",     
                 "column_index",     
                 "variable_source_code1",     
                 "variable_source_code2",     
                 "methods_tool1",     
                 "methods_tool2",     
                 "year_min",     
                 "year_max",     
                 "year_n",     
                 "source_value_code",     
                 "lake",     
                 "buff100",     
                 "buff500",     
                 "ws",     
                 "nws",     
                 "hu12",     
                 "hu4",     
                 "hu8",     
                 "county",     
                 "state",     
                 "bailey",     
                 "epanutr",     
                 "mlra",     
                 "neon",     
                 "omernik3",     
                 "wwf"    ), check.names=TRUE)

unlink(infile1)

# Fix any interval or ratio columns mistakenly read in as nominal and nominal columns read as numeric or dates read as strings

if (class(geo1$dictionary_type)!="factor") geo1$dictionary_type<- as.factor(geo1$dictionary_type)
if (class(geo1$table_name)!="factor") geo1$table_name<- as.factor(geo1$table_name)
if (class(geo1$variable_name)!="factor") geo1$variable_name<- as.factor(geo1$variable_name)
if (class(geo1$variable_description)!="factor") geo1$variable_description<- as.factor(geo1$variable_description)
if (class(geo1$taxonomy_type)!="factor") geo1$taxonomy_type<- as.factor(geo1$taxonomy_type)
if (class(geo1$main_feature)!="factor") geo1$main_feature<- as.factor(geo1$main_feature)
if (class(geo1$subgroup)!="factor") geo1$subgroup<- as.factor(geo1$subgroup)
if (class(geo1$units)!="factor") geo1$units<- as.factor(geo1$units)
if (class(geo1$in_lagosne)!="factor") geo1$in_lagosne<- as.factor(geo1$in_lagosne)
if (class(geo1$data_type)!="factor") geo1$data_type<- as.factor(geo1$data_type)
if (class(geo1$domain)!="factor") geo1$domain<- as.factor(geo1$domain)
if (class(geo1$precision)=="factor") geo1$precision <-as.numeric(levels(geo1$precision))[as.integer(geo1$precision) ]               
if (class(geo1$precision)=="character") geo1$precision <-as.numeric(geo1$precision)
if (class(geo1$missing_values)!="factor") geo1$missing_values<- as.factor(geo1$missing_values)
if (class(geo1$column_index)=="factor") geo1$column_index <-as.numeric(levels(geo1$column_index))[as.integer(geo1$column_index) ]               
if (class(geo1$column_index)=="character") geo1$column_index <-as.numeric(geo1$column_index)
if (class(geo1$variable_source_code1)!="factor") geo1$variable_source_code1<- as.factor(geo1$variable_source_code1)
if (class(geo1$variable_source_code2)!="factor") geo1$variable_source_code2<- as.factor(geo1$variable_source_code2)
if (class(geo1$methods_tool1)!="factor") geo1$methods_tool1<- as.factor(geo1$methods_tool1)
if (class(geo1$methods_tool2)!="factor") geo1$methods_tool2<- as.factor(geo1$methods_tool2)
if (class(geo1$year_min)=="factor") geo1$year_min <-as.numeric(levels(geo1$year_min))[as.integer(geo1$year_min) ]               
if (class(geo1$year_min)=="character") geo1$year_min <-as.numeric(geo1$year_min)
if (class(geo1$year_max)=="factor") geo1$year_max <-as.numeric(levels(geo1$year_max))[as.integer(geo1$year_max) ]               
if (class(geo1$year_max)=="character") geo1$year_max <-as.numeric(geo1$year_max)
if (class(geo1$year_n)=="factor") geo1$year_n <-as.numeric(levels(geo1$year_n))[as.integer(geo1$year_n) ]               
if (class(geo1$year_n)=="character") geo1$year_n <-as.numeric(geo1$year_n)
if (class(geo1$source_value_code)!="factor") geo1$source_value_code<- as.factor(geo1$source_value_code)
if (class(geo1$lake)!="factor") geo1$lake<- as.factor(geo1$lake)
if (class(geo1$buff100)!="factor") geo1$buff100<- as.factor(geo1$buff100)
if (class(geo1$buff500)!="factor") geo1$buff500<- as.factor(geo1$buff500)
if (class(geo1$ws)!="factor") geo1$ws<- as.factor(geo1$ws)
if (class(geo1$nws)!="factor") geo1$nws<- as.factor(geo1$nws)
if (class(geo1$hu12)!="factor") geo1$hu12<- as.factor(geo1$hu12)
if (class(geo1$hu4)!="factor") geo1$hu4<- as.factor(geo1$hu4)
if (class(geo1$hu8)!="factor") geo1$hu8<- as.factor(geo1$hu8)
if (class(geo1$county)!="factor") geo1$county<- as.factor(geo1$county)
if (class(geo1$state)!="factor") geo1$state<- as.factor(geo1$state)
if (class(geo1$bailey)!="factor") geo1$bailey<- as.factor(geo1$bailey)
if (class(geo1$epanutr)!="factor") geo1$epanutr<- as.factor(geo1$epanutr)
if (class(geo1$mlra)!="factor") geo1$mlra<- as.factor(geo1$mlra)
if (class(geo1$neon)!="factor") geo1$neon<- as.factor(geo1$neon)
if (class(geo1$omernik3)!="factor") geo1$omernik3<- as.factor(geo1$omernik3)
if (class(geo1$wwf)!="factor") geo1$wwf<- as.factor(geo1$wwf)

# Convert Missing Values to NA for non-dates

geo1$taxonomy_type <- as.factor(ifelse((trimws(as.character(geo1$taxonomy_type))==trimws("NA")),NA,as.character(geo1$taxonomy_type)))
geo1$main_feature <- as.factor(ifelse((trimws(as.character(geo1$main_feature))==trimws("NA")),NA,as.character(geo1$main_feature)))
geo1$subgroup <- as.factor(ifelse((trimws(as.character(geo1$subgroup))==trimws("NA")),NA,as.character(geo1$subgroup)))
geo1$units <- as.factor(ifelse((trimws(as.character(geo1$units))==trimws("NA")),NA,as.character(geo1$units)))
geo1$in_lagosne <- as.factor(ifelse((trimws(as.character(geo1$in_lagosne))==trimws("NA")),NA,as.character(geo1$in_lagosne)))
geo1$domain <- as.factor(ifelse((trimws(as.character(geo1$domain))==trimws("NA")),NA,as.character(geo1$domain)))
geo1$column_index <- ifelse((trimws(as.character(geo1$column_index))==trimws("NA")),NA,geo1$column_index)               
suppressWarnings(geo1$column_index <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(geo1$column_index))==as.character(as.numeric("NA"))),NA,geo1$column_index))
geo1$variable_source_code1 <- as.factor(ifelse((trimws(as.character(geo1$variable_source_code1))==trimws("NA")),NA,as.character(geo1$variable_source_code1)))
geo1$variable_source_code2 <- as.factor(ifelse((trimws(as.character(geo1$variable_source_code2))==trimws("NA")),NA,as.character(geo1$variable_source_code2)))
geo1$methods_tool1 <- as.factor(ifelse((trimws(as.character(geo1$methods_tool1))==trimws("NA")),NA,as.character(geo1$methods_tool1)))
geo1$methods_tool2 <- as.factor(ifelse((trimws(as.character(geo1$methods_tool2))==trimws("NA")),NA,as.character(geo1$methods_tool2)))
geo1$year_min <- ifelse((trimws(as.character(geo1$year_min))==trimws("NA")),NA,geo1$year_min)               
suppressWarnings(geo1$year_min <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(geo1$year_min))==as.character(as.numeric("NA"))),NA,geo1$year_min))
geo1$year_max <- ifelse((trimws(as.character(geo1$year_max))==trimws("NA")),NA,geo1$year_max)               
suppressWarnings(geo1$year_max <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(geo1$year_max))==as.character(as.numeric("NA"))),NA,geo1$year_max))
geo1$year_n <- ifelse((trimws(as.character(geo1$year_n))==trimws("NA")),NA,geo1$year_n)               
suppressWarnings(geo1$year_n <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(geo1$year_n))==as.character(as.numeric("NA"))),NA,geo1$year_n))
geo1$source_value_code <- as.factor(ifelse((trimws(as.character(geo1$source_value_code))==trimws("NA")),NA,as.character(geo1$source_value_code)))
geo1$lake <- as.factor(ifelse((trimws(as.character(geo1$lake))==trimws("NA")),NA,as.character(geo1$lake)))
geo1$buff100 <- as.factor(ifelse((trimws(as.character(geo1$buff100))==trimws("NA")),NA,as.character(geo1$buff100)))
geo1$buff500 <- as.factor(ifelse((trimws(as.character(geo1$buff500))==trimws("NA")),NA,as.character(geo1$buff500)))
geo1$ws <- as.factor(ifelse((trimws(as.character(geo1$ws))==trimws("NA")),NA,as.character(geo1$ws)))
geo1$nws <- as.factor(ifelse((trimws(as.character(geo1$nws))==trimws("NA")),NA,as.character(geo1$nws)))
geo1$hu12 <- as.factor(ifelse((trimws(as.character(geo1$hu12))==trimws("NA")),NA,as.character(geo1$hu12)))
geo1$hu4 <- as.factor(ifelse((trimws(as.character(geo1$hu4))==trimws("NA")),NA,as.character(geo1$hu4)))
geo1$hu8 <- as.factor(ifelse((trimws(as.character(geo1$hu8))==trimws("NA")),NA,as.character(geo1$hu8)))
geo1$county <- as.factor(ifelse((trimws(as.character(geo1$county))==trimws("NA")),NA,as.character(geo1$county)))
geo1$state <- as.factor(ifelse((trimws(as.character(geo1$state))==trimws("NA")),NA,as.character(geo1$state)))
geo1$bailey <- as.factor(ifelse((trimws(as.character(geo1$bailey))==trimws("NA")),NA,as.character(geo1$bailey)))
geo1$epanutr <- as.factor(ifelse((trimws(as.character(geo1$epanutr))==trimws("NA")),NA,as.character(geo1$epanutr)))
geo1$mlra <- as.factor(ifelse((trimws(as.character(geo1$mlra))==trimws("NA")),NA,as.character(geo1$mlra)))
geo1$neon <- as.factor(ifelse((trimws(as.character(geo1$neon))==trimws("NA")),NA,as.character(geo1$neon)))
geo1$omernik3 <- as.factor(ifelse((trimws(as.character(geo1$omernik3))==trimws("NA")),NA,as.character(geo1$omernik3)))
geo1$wwf <- as.factor(ifelse((trimws(as.character(geo1$wwf))==trimws("NA")),NA,as.character(geo1$wwf)))


# Here is the structure of the input data frame:
str(geo1)                            
attach(geo1)                            
# The analyses below are basic descriptions of the variables. After testing, they should be replaced.                 

summary(dictionary_type)
summary(table_name)
summary(variable_name)
summary(variable_description)
summary(taxonomy_type)
summary(main_feature)
summary(subgroup)
summary(units)
summary(in_lagosne)
summary(data_type)
summary(domain)
summary(precision)
summary(missing_values)
summary(column_index)
summary(variable_source_code1)
summary(variable_source_code2)
summary(methods_tool1)
summary(methods_tool2)
summary(year_min)
summary(year_max)
summary(year_n)
summary(source_value_code)
summary(lake)
summary(buff100)
summary(buff500)
summary(ws)
summary(nws)
summary(hu12)
summary(hu4)
summary(hu8)
summary(county)
summary(state)
summary(bailey)
summary(epanutr)
summary(mlra)
summary(neon)
summary(omernik3)
summary(wwf) 
# Get more details on character variables

summary(as.factor(geo1$dictionary_type)) 
summary(as.factor(geo1$table_name)) 
summary(as.factor(geo1$variable_name)) 
summary(as.factor(geo1$variable_description)) 
summary(as.factor(geo1$taxonomy_type)) 
summary(as.factor(geo1$main_feature)) 
summary(as.factor(geo1$subgroup)) 
summary(as.factor(geo1$units)) 
summary(as.factor(geo1$in_lagosne)) 
summary(as.factor(geo1$data_type)) 
summary(as.factor(geo1$domain)) 
summary(as.factor(geo1$missing_values)) 
summary(as.factor(geo1$variable_source_code1)) 
summary(as.factor(geo1$variable_source_code2)) 
summary(as.factor(geo1$methods_tool1)) 
summary(as.factor(geo1$methods_tool2)) 
summary(as.factor(geo1$source_value_code)) 
summary(as.factor(geo1$lake)) 
summary(as.factor(geo1$buff100)) 
summary(as.factor(geo1$buff500)) 
summary(as.factor(geo1$ws)) 
summary(as.factor(geo1$nws)) 
summary(as.factor(geo1$hu12)) 
summary(as.factor(geo1$hu4)) 
summary(as.factor(geo1$hu8)) 
summary(as.factor(geo1$county)) 
summary(as.factor(geo1$state)) 
summary(as.factor(geo1$bailey)) 
summary(as.factor(geo1$epanutr)) 
summary(as.factor(geo1$mlra)) 
summary(as.factor(geo1$neon)) 
summary(as.factor(geo1$omernik3)) 
summary(as.factor(geo1$wwf))
detach(geo1)               


inUrl2  <- "https://pasta.lternet.edu/package/data/eml/edi/1136/2/ae308ba0638717dbbaac5ba25e7f88e5" 
infile2 <- tempfile()
try(download.file(inUrl2,infile2,method="curl"))
if (is.na(file.size(infile2))) download.file(inUrl2,infile2,method="auto")


geo2 <-read.csv(infile2,header=F 
               ,skip=1
               ,sep=","  
               ,quot='"' 
               , col.names=c(
                 "column_name",     
                 "domain_code",     
                 "domain_description"    ), check.names=TRUE)

unlink(infile2)

# Fix any interval or ratio columns mistakenly read in as nominal and nominal columns read as numeric or dates read as strings

if (class(geo2$column_name)!="factor") geo2$column_name<- as.factor(geo2$column_name)
if (class(geo2$domain_code)!="factor") geo2$domain_code<- as.factor(geo2$domain_code)
if (class(geo2$domain_description)!="factor") geo2$domain_description<- as.factor(geo2$domain_description)

# Convert Missing Values to NA for non-dates



# Here is the structure of the input data frame:
str(geo2)                            
attach(geo2)                            
# The analyses below are basic descriptions of the variables. After testing, they should be replaced.                 

summary(column_name)
summary(domain_code)
summary(domain_description) 
# Get more details on character variables

summary(as.factor(geo2$column_name)) 
summary(as.factor(geo2$domain_code)) 
summary(as.factor(geo2$domain_description))
detach(geo2)               


inUrl3  <- "https://pasta.lternet.edu/package/data/eml/edi/1136/2/af2e128e3887d361316eda10e6ed20ae" 
infile3 <- tempfile()
try(download.file(inUrl3,infile3,method="curl"))
if (is.na(file.size(infile3))) download.file(inUrl3,infile3,method="auto")


geo3 <-read.csv(infile3,header=F 
               ,skip=1
               ,sep=","  
               ,quot='"' 
               , col.names=c(
                 "table_name",     
                 "source_code",     
                 "source_name",     
                 "source_shortname",     
                 "source_description",     
                 "source_provider",     
                 "source_citation",     
                 "source_url",     
                 "source_metadata_url",     
                 "source_spatial_resolution",     
                 "source_time_period",     
                 "source_access_date",     
                 "source_data_type"    ), check.names=TRUE)

unlink(infile3)

# Fix any interval or ratio columns mistakenly read in as nominal and nominal columns read as numeric or dates read as strings

if (class(geo3$table_name)!="factor") geo3$table_name<- as.factor(geo3$table_name)
if (class(geo3$source_code)!="factor") geo3$source_code<- as.factor(geo3$source_code)
if (class(geo3$source_name)!="factor") geo3$source_name<- as.factor(geo3$source_name)
if (class(geo3$source_shortname)!="factor") geo3$source_shortname<- as.factor(geo3$source_shortname)
if (class(geo3$source_description)!="factor") geo3$source_description<- as.factor(geo3$source_description)
if (class(geo3$source_provider)!="factor") geo3$source_provider<- as.factor(geo3$source_provider)
if (class(geo3$source_citation)!="factor") geo3$source_citation<- as.factor(geo3$source_citation)
if (class(geo3$source_url)!="factor") geo3$source_url<- as.factor(geo3$source_url)
if (class(geo3$source_metadata_url)!="factor") geo3$source_metadata_url<- as.factor(geo3$source_metadata_url)
if (class(geo3$source_spatial_resolution)!="factor") geo3$source_spatial_resolution<- as.factor(geo3$source_spatial_resolution)
if (class(geo3$source_time_period)!="factor") geo3$source_time_period<- as.factor(geo3$source_time_period)
if (class(geo3$source_access_date)!="factor") geo3$source_access_date<- as.factor(geo3$source_access_date)
if (class(geo3$source_data_type)!="factor") geo3$source_data_type<- as.factor(geo3$source_data_type)

# Convert Missing Values to NA for non-dates

geo3$table_name <- as.factor(ifelse((trimws(as.character(geo3$table_name))==trimws("NA")),NA,as.character(geo3$table_name)))
geo3$source_code <- as.factor(ifelse((trimws(as.character(geo3$source_code))==trimws("NA")),NA,as.character(geo3$source_code)))
geo3$source_name <- as.factor(ifelse((trimws(as.character(geo3$source_name))==trimws("NA")),NA,as.character(geo3$source_name)))
geo3$source_shortname <- as.factor(ifelse((trimws(as.character(geo3$source_shortname))==trimws("NA")),NA,as.character(geo3$source_shortname)))
geo3$source_description <- as.factor(ifelse((trimws(as.character(geo3$source_description))==trimws("NA")),NA,as.character(geo3$source_description)))
geo3$source_provider <- as.factor(ifelse((trimws(as.character(geo3$source_provider))==trimws("NA")),NA,as.character(geo3$source_provider)))
geo3$source_citation <- as.factor(ifelse((trimws(as.character(geo3$source_citation))==trimws("NA")),NA,as.character(geo3$source_citation)))
geo3$source_url <- as.factor(ifelse((trimws(as.character(geo3$source_url))==trimws("NA")),NA,as.character(geo3$source_url)))
geo3$source_metadata_url <- as.factor(ifelse((trimws(as.character(geo3$source_metadata_url))==trimws("NA")),NA,as.character(geo3$source_metadata_url)))
geo3$source_spatial_resolution <- as.factor(ifelse((trimws(as.character(geo3$source_spatial_resolution))==trimws("NA")),NA,as.character(geo3$source_spatial_resolution)))
geo3$source_time_period <- as.factor(ifelse((trimws(as.character(geo3$source_time_period))==trimws("NA")),NA,as.character(geo3$source_time_period)))
geo3$source_access_date <- as.factor(ifelse((trimws(as.character(geo3$source_access_date))==trimws("NA")),NA,as.character(geo3$source_access_date)))
geo3$source_data_type <- as.factor(ifelse((trimws(as.character(geo3$source_data_type))==trimws("NA")),NA,as.character(geo3$source_data_type)))


# Here is the structure of the input data frame:
str(geo3)                            
attach(geo3)                            
# The analyses below are basic descriptions of the variables. After testing, they should be replaced.                 

summary(table_name)
summary(source_code)
summary(source_name)
summary(source_shortname)
summary(source_description)
summary(source_provider)
summary(source_citation)
summary(source_url)
summary(source_metadata_url)
summary(source_spatial_resolution)
summary(source_time_period)
summary(source_access_date)
summary(source_data_type) 
# Get more details on character variables

summary(as.factor(geo3$table_name)) 
summary(as.factor(geo3$source_code)) 
summary(as.factor(geo3$source_name)) 
summary(as.factor(geo3$source_shortname)) 
summary(as.factor(geo3$source_description)) 
summary(as.factor(geo3$source_provider)) 
summary(as.factor(geo3$source_citation)) 
summary(as.factor(geo3$source_url)) 
summary(as.factor(geo3$source_metadata_url)) 
summary(as.factor(geo3$source_spatial_resolution)) 
summary(as.factor(geo3$source_time_period)) 
summary(as.factor(geo3$source_access_date)) 
summary(as.factor(geo3$source_data_type))
detach(geo3)               


inUrl4  <- "https://pasta.lternet.edu/package/data/eml/edi/1136/2/9208a30ebdc0dbb7fa6cf60dd7bff562" 
infile4 <- tempfile()
try(download.file(inUrl4,infile4,method="curl"))
if (is.na(file.size(infile4))) download.file(inUrl4,infile4,method="auto")


geo4 <-read.csv(infile4,header=F 
               ,sep=","  
               ,quot='"' 
               , col.names=c(
                 "zoneid",     
                 "spatial_division",     
                 "sourceid",     
                 "sourceid_name",     
                 "name",     
                 "states",     
                 "area_ha",     
                 "perimeter_m",     
                 "originalarea_pct",     
                 "lat_decdeg",     
                 "lon_decdeg",     
                 "inusa_pct",     
                 "onlandborder",     
                 "oncoast",     
                 "ismultipart"    ), check.names=TRUE)

unlink(infile4)

# Fix any interval or ratio columns mistakenly read in as nominal and nominal columns read as numeric or dates read as strings

if (class(geo4$zoneid)!="factor") geo4$zoneid<- as.factor(geo4$zoneid)
if (class(geo4$spatial_division)!="factor") geo4$spatial_division<- as.factor(geo4$spatial_division)
if (class(geo4$sourceid)!="factor") geo4$sourceid<- as.factor(geo4$sourceid)
if (class(geo4$sourceid_name)!="factor") geo4$sourceid_name<- as.factor(geo4$sourceid_name)
if (class(geo4$name)!="factor") geo4$name<- as.factor(geo4$name)
if (class(geo4$states)!="factor") geo4$states<- as.factor(geo4$states)
if (class(geo4$area_ha)=="factor") geo4$area_ha <-as.numeric(levels(geo4$area_ha))[as.integer(geo4$area_ha) ]               
if (class(geo4$area_ha)=="character") geo4$area_ha <-as.numeric(geo4$area_ha)
if (class(geo4$perimeter_m)=="factor") geo4$perimeter_m <-as.numeric(levels(geo4$perimeter_m))[as.integer(geo4$perimeter_m) ]               
if (class(geo4$perimeter_m)=="character") geo4$perimeter_m <-as.numeric(geo4$perimeter_m)
if (class(geo4$originalarea_pct)=="factor") geo4$originalarea_pct <-as.numeric(levels(geo4$originalarea_pct))[as.integer(geo4$originalarea_pct) ]               
if (class(geo4$originalarea_pct)=="character") geo4$originalarea_pct <-as.numeric(geo4$originalarea_pct)
if (class(geo4$lat_decdeg)=="factor") geo4$lat_decdeg <-as.numeric(levels(geo4$lat_decdeg))[as.integer(geo4$lat_decdeg) ]               
if (class(geo4$lat_decdeg)=="character") geo4$lat_decdeg <-as.numeric(geo4$lat_decdeg)
if (class(geo4$lon_decdeg)=="factor") geo4$lon_decdeg <-as.numeric(levels(geo4$lon_decdeg))[as.integer(geo4$lon_decdeg) ]               
if (class(geo4$lon_decdeg)=="character") geo4$lon_decdeg <-as.numeric(geo4$lon_decdeg)
if (class(geo4$inusa_pct)=="factor") geo4$inusa_pct <-as.numeric(levels(geo4$inusa_pct))[as.integer(geo4$inusa_pct) ]               
if (class(geo4$inusa_pct)=="character") geo4$inusa_pct <-as.numeric(geo4$inusa_pct)
if (class(geo4$onlandborder)!="factor") geo4$onlandborder<- as.factor(geo4$onlandborder)
if (class(geo4$oncoast)!="factor") geo4$oncoast<- as.factor(geo4$oncoast)
if (class(geo4$ismultipart)!="factor") geo4$ismultipart<- as.factor(geo4$ismultipart)

# Convert Missing Values to NA for non-dates

geo4$sourceid <- as.factor(ifelse((trimws(as.character(geo4$sourceid))==trimws("NA")),NA,as.character(geo4$sourceid)))
geo4$sourceid_name <- as.factor(ifelse((trimws(as.character(geo4$sourceid_name))==trimws("NA")),NA,as.character(geo4$sourceid_name)))
geo4$name <- as.factor(ifelse((trimws(as.character(geo4$name))==trimws("NA")),NA,as.character(geo4$name)))
geo4$states <- as.factor(ifelse((trimws(as.character(geo4$states))==trimws("NA")),NA,as.character(geo4$states)))
geo4$area_ha <- ifelse((trimws(as.character(geo4$area_ha))==trimws("NA")),NA,geo4$area_ha)               
suppressWarnings(geo4$area_ha <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(geo4$area_ha))==as.character(as.numeric("NA"))),NA,geo4$area_ha))
geo4$perimeter_m <- ifelse((trimws(as.character(geo4$perimeter_m))==trimws("NA")),NA,geo4$perimeter_m)               
suppressWarnings(geo4$perimeter_m <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(geo4$perimeter_m))==as.character(as.numeric("NA"))),NA,geo4$perimeter_m))
geo4$originalarea_pct <- ifelse((trimws(as.character(geo4$originalarea_pct))==trimws("NA")),NA,geo4$originalarea_pct)               
suppressWarnings(geo4$originalarea_pct <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(geo4$originalarea_pct))==as.character(as.numeric("NA"))),NA,geo4$originalarea_pct))
geo4$lat_decdeg <- ifelse((trimws(as.character(geo4$lat_decdeg))==trimws("NA")),NA,geo4$lat_decdeg)               
suppressWarnings(geo4$lat_decdeg <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(geo4$lat_decdeg))==as.character(as.numeric("NA"))),NA,geo4$lat_decdeg))
geo4$lon_decdeg <- ifelse((trimws(as.character(geo4$lon_decdeg))==trimws("NA")),NA,geo4$lon_decdeg)               
suppressWarnings(geo4$lon_decdeg <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(geo4$lon_decdeg))==as.character(as.numeric("NA"))),NA,geo4$lon_decdeg))
geo4$inusa_pct <- ifelse((trimws(as.character(geo4$inusa_pct))==trimws("NA")),NA,geo4$inusa_pct)               
suppressWarnings(geo4$inusa_pct <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(geo4$inusa_pct))==as.character(as.numeric("NA"))),NA,geo4$inusa_pct))
geo4$onlandborder <- as.factor(ifelse((trimws(as.character(geo4$onlandborder))==trimws("NA")),NA,as.character(geo4$onlandborder)))
geo4$oncoast <- as.factor(ifelse((trimws(as.character(geo4$oncoast))==trimws("NA")),NA,as.character(geo4$oncoast)))
geo4$ismultipart <- as.factor(ifelse((trimws(as.character(geo4$ismultipart))==trimws("NA")),NA,as.character(geo4$ismultipart)))


# Here is the structure of the input data frame:
str(geo4)                            
attach(geo4)                            
# The analyses below are basic descriptions of the variables. After testing, they should be replaced.                 

summary(zoneid)
summary(spatial_division)
summary(sourceid)
summary(sourceid_name)
summary(name)
summary(states)
summary(area_ha)
summary(perimeter_m)
summary(originalarea_pct)
summary(lat_decdeg)
summary(lon_decdeg)
summary(inusa_pct)
summary(onlandborder)
summary(oncoast)
summary(ismultipart) 
# Get more details on character variables

summary(as.factor(geo4$zoneid)) 
summary(as.factor(geo4$spatial_division)) 
summary(as.factor(geo4$sourceid)) 
summary(as.factor(geo4$sourceid_name)) 
summary(as.factor(geo4$name)) 
summary(as.factor(geo4$states)) 
summary(as.factor(geo4$onlandborder)) 
summary(as.factor(geo4$oncoast)) 
summary(as.factor(geo4$ismultipart))
detach(geo4)               


inUrl5  <- "https://pasta.lternet.edu/package/data/eml/edi/1136/2/1cc2b1bec02e21adf538fe7d19f2e1ea" 
infile5 <- tempfile()
try(download.file(inUrl5,infile5,method="curl"))
if (is.na(file.size(infile5))) download.file(inUrl5,infile5,method="auto")


dt5 <-read.csv(infile5,header=F 
               ,sep=","  
               ,quot='"' 
               , col.names=c(
                 "zoneid",     
                 "variable_name",     
                 "value",     
                 "spatial_division",     
                 "main_feature",     
                 "subgroup",     
                 "units",     
                 "year",     
                 "datacoveragepct",     
                 "precision"    ), check.names=TRUE)

unlink(infile5)

# Fix any interval or ratio columns mistakenly read in as nominal and nominal columns read as numeric or dates read as strings

if (class(dt5$zoneid)!="factor") dt5$zoneid<- as.factor(dt5$zoneid)
if (class(dt5$variable_name)!="factor") dt5$variable_name<- as.factor(dt5$variable_name)
if (class(dt5$value)=="factor") dt5$value <-as.numeric(levels(dt5$value))[as.integer(dt5$value) ]               
if (class(dt5$value)=="character") dt5$value <-as.numeric(dt5$value)
if (class(dt5$spatial_division)!="factor") dt5$spatial_division<- as.factor(dt5$spatial_division)
if (class(dt5$main_feature)!="factor") dt5$main_feature<- as.factor(dt5$main_feature)
if (class(dt5$subgroup)!="factor") dt5$subgroup<- as.factor(dt5$subgroup)
if (class(dt5$units)!="factor") dt5$units<- as.factor(dt5$units)
if (class(dt5$year)=="factor") dt5$year <-as.numeric(levels(dt5$year))[as.integer(dt5$year) ]               
if (class(dt5$year)=="character") dt5$year <-as.numeric(dt5$year)
if (class(dt5$datacoveragepct)=="factor") dt5$datacoveragepct <-as.numeric(levels(dt5$datacoveragepct))[as.integer(dt5$datacoveragepct) ]               
if (class(dt5$datacoveragepct)=="character") dt5$datacoveragepct <-as.numeric(dt5$datacoveragepct)
if (class(dt5$precision)=="factor") dt5$precision <-as.numeric(levels(dt5$precision))[as.integer(dt5$precision) ]               
if (class(dt5$precision)=="character") dt5$precision <-as.numeric(dt5$precision)

# Convert Missing Values to NA for non-dates

dt5$value <- ifelse((trimws(as.character(dt5$value))==trimws("NA")),NA,dt5$value)               
suppressWarnings(dt5$value <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt5$value))==as.character(as.numeric("NA"))),NA,dt5$value))
dt5$subgroup <- as.factor(ifelse((trimws(as.character(dt5$subgroup))==trimws("NA")),NA,as.character(dt5$subgroup)))
dt5$units <- as.factor(ifelse((trimws(as.character(dt5$units))==trimws("NA")),NA,as.character(dt5$units)))
dt5$year <- ifelse((trimws(as.character(dt5$year))==trimws("NA")),NA,dt5$year)               
suppressWarnings(dt5$year <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt5$year))==as.character(as.numeric("NA"))),NA,dt5$year))
dt5$datacoveragepct <- ifelse((trimws(as.character(dt5$datacoveragepct))==trimws("NA")),NA,dt5$datacoveragepct)               
suppressWarnings(dt5$datacoveragepct <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt5$datacoveragepct))==as.character(as.numeric("NA"))),NA,dt5$datacoveragepct))


# Here is the structure of the input data frame:
str(dt5)                            
attach(dt5)                            
# The analyses below are basic descriptions of the variables. After testing, they should be replaced.                 

summary(zoneid)
summary(variable_name)
summary(value)
summary(spatial_division)
summary(main_feature)
summary(subgroup)
summary(units)
summary(year)
summary(datacoveragepct)
summary(precision) 
# Get more details on character variables

summary(as.factor(dt5$zoneid)) 
summary(as.factor(dt5$variable_name)) 
summary(as.factor(dt5$spatial_division)) 
summary(as.factor(dt5$main_feature)) 
summary(as.factor(dt5$subgroup)) 
summary(as.factor(dt5$units))
detach(dt5)               


inUrl6  <- "https://pasta.lternet.edu/package/data/eml/edi/1136/2/5586d3138b0421cfa60b2d9a565cd8a4" 
infile6 <- tempfile()
try(download.file(inUrl6,infile6,method="curl"))
if (is.na(file.size(infile6))) download.file(inUrl6,infile6,method="auto")


dt6 <-read.csv(infile6,header=F 
               ,sep=","  
               ,quot='"' 
               , col.names=c(
                 "zoneid",     
                 "spatial_division",     
                 "climate_year",     
                 "climate_month",     
                 "datacoveragepct",     
                 "climate_tmean_degc",     
                 "climate_tmin_degc",     
                 "climate_tmax_degc",     
                 "climate_ppt_mm"    ), check.names=TRUE)

unlink(infile6)

# Fix any interval or ratio columns mistakenly read in as nominal and nominal columns read as numeric or dates read as strings

if (class(dt6$zoneid)!="factor") dt6$zoneid<- as.factor(dt6$zoneid)
if (class(dt6$spatial_division)!="factor") dt6$spatial_division<- as.factor(dt6$spatial_division)
if (class(dt6$climate_year)=="factor") dt6$climate_year <-as.numeric(levels(dt6$climate_year))[as.integer(dt6$climate_year) ]               
if (class(dt6$climate_year)=="character") dt6$climate_year <-as.numeric(dt6$climate_year)
if (class(dt6$climate_month)=="factor") dt6$climate_month <-as.numeric(levels(dt6$climate_month))[as.integer(dt6$climate_month) ]               
if (class(dt6$climate_month)=="character") dt6$climate_month <-as.numeric(dt6$climate_month)
if (class(dt6$datacoveragepct)=="factor") dt6$datacoveragepct <-as.numeric(levels(dt6$datacoveragepct))[as.integer(dt6$datacoveragepct) ]               
if (class(dt6$datacoveragepct)=="character") dt6$datacoveragepct <-as.numeric(dt6$datacoveragepct)
if (class(dt6$climate_tmean_degc)=="factor") dt6$climate_tmean_degc <-as.numeric(levels(dt6$climate_tmean_degc))[as.integer(dt6$climate_tmean_degc) ]               
if (class(dt6$climate_tmean_degc)=="character") dt6$climate_tmean_degc <-as.numeric(dt6$climate_tmean_degc)
if (class(dt6$climate_tmin_degc)=="factor") dt6$climate_tmin_degc <-as.numeric(levels(dt6$climate_tmin_degc))[as.integer(dt6$climate_tmin_degc) ]               
if (class(dt6$climate_tmin_degc)=="character") dt6$climate_tmin_degc <-as.numeric(dt6$climate_tmin_degc)
if (class(dt6$climate_tmax_degc)=="factor") dt6$climate_tmax_degc <-as.numeric(levels(dt6$climate_tmax_degc))[as.integer(dt6$climate_tmax_degc) ]               
if (class(dt6$climate_tmax_degc)=="character") dt6$climate_tmax_degc <-as.numeric(dt6$climate_tmax_degc)
if (class(dt6$climate_ppt_mm)=="factor") dt6$climate_ppt_mm <-as.numeric(levels(dt6$climate_ppt_mm))[as.integer(dt6$climate_ppt_mm) ]               
if (class(dt6$climate_ppt_mm)=="character") dt6$climate_ppt_mm <-as.numeric(dt6$climate_ppt_mm)

# Convert Missing Values to NA for non-dates

dt6$climate_tmean_degc <- ifelse((trimws(as.character(dt6$climate_tmean_degc))==trimws("NA")),NA,dt6$climate_tmean_degc)               
suppressWarnings(dt6$climate_tmean_degc <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt6$climate_tmean_degc))==as.character(as.numeric("NA"))),NA,dt6$climate_tmean_degc))
dt6$climate_tmin_degc <- ifelse((trimws(as.character(dt6$climate_tmin_degc))==trimws("NA")),NA,dt6$climate_tmin_degc)               
suppressWarnings(dt6$climate_tmin_degc <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt6$climate_tmin_degc))==as.character(as.numeric("NA"))),NA,dt6$climate_tmin_degc))
dt6$climate_tmax_degc <- ifelse((trimws(as.character(dt6$climate_tmax_degc))==trimws("NA")),NA,dt6$climate_tmax_degc)               
suppressWarnings(dt6$climate_tmax_degc <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt6$climate_tmax_degc))==as.character(as.numeric("NA"))),NA,dt6$climate_tmax_degc))
dt6$climate_ppt_mm <- ifelse((trimws(as.character(dt6$climate_ppt_mm))==trimws("NA")),NA,dt6$climate_ppt_mm)               
suppressWarnings(dt6$climate_ppt_mm <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt6$climate_ppt_mm))==as.character(as.numeric("NA"))),NA,dt6$climate_ppt_mm))


# Here is the structure of the input data frame:
str(dt6)                            
attach(dt6)                            
# The analyses below are basic descriptions of the variables. After testing, they should be replaced.                 

summary(zoneid)
summary(spatial_division)
summary(climate_year)
summary(climate_month)
summary(datacoveragepct)
summary(climate_tmean_degc)
summary(climate_tmin_degc)
summary(climate_tmax_degc)
summary(climate_ppt_mm) 
# Get more details on character variables

summary(as.factor(dt6$zoneid)) 
summary(as.factor(dt6$spatial_division))
detach(dt6)               


inUrl7  <- "https://pasta.lternet.edu/package/data/eml/edi/1136/2/3ec85ada98d6929c895038729441f9cc" 
infile7 <- tempfile()
try(download.file(inUrl7,infile7,method="curl"))
if (is.na(file.size(infile7))) download.file(inUrl7,infile7,method="auto")


dt7 <-read.csv(infile7,header=F 
               ,sep=","  
               ,quot='"' 
               , col.names=c(
                 "zoneid",     
                 "variable_name",     
                 "value",     
                 "spatial_division",     
                 "main_feature",     
                 "subgroup",     
                 "units",     
                 "datacoveragepct",     
                 "precision"    ), check.names=TRUE)

unlink(infile7)

# Fix any interval or ratio columns mistakenly read in as nominal and nominal columns read as numeric or dates read as strings

if (class(dt7$zoneid)!="factor") dt7$zoneid<- as.factor(dt7$zoneid)
if (class(dt7$variable_name)!="factor") dt7$variable_name<- as.factor(dt7$variable_name)
if (class(dt7$value)=="factor") dt7$value <-as.numeric(levels(dt7$value))[as.integer(dt7$value) ]               
if (class(dt7$value)=="character") dt7$value <-as.numeric(dt7$value)
if (class(dt7$spatial_division)!="factor") dt7$spatial_division<- as.factor(dt7$spatial_division)
if (class(dt7$main_feature)!="factor") dt7$main_feature<- as.factor(dt7$main_feature)
if (class(dt7$subgroup)!="factor") dt7$subgroup<- as.factor(dt7$subgroup)
if (class(dt7$units)!="factor") dt7$units<- as.factor(dt7$units)
if (class(dt7$datacoveragepct)=="factor") dt7$datacoveragepct <-as.numeric(levels(dt7$datacoveragepct))[as.integer(dt7$datacoveragepct) ]               
if (class(dt7$datacoveragepct)=="character") dt7$datacoveragepct <-as.numeric(dt7$datacoveragepct)
if (class(dt7$precision)=="factor") dt7$precision <-as.numeric(levels(dt7$precision))[as.integer(dt7$precision) ]               
if (class(dt7$precision)=="character") dt7$precision <-as.numeric(dt7$precision)

# Convert Missing Values to NA for non-dates

dt7$value <- ifelse((trimws(as.character(dt7$value))==trimws("NA")),NA,dt7$value)               
suppressWarnings(dt7$value <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt7$value))==as.character(as.numeric("NA"))),NA,dt7$value))
dt7$subgroup <- as.factor(ifelse((trimws(as.character(dt7$subgroup))==trimws("NA")),NA,as.character(dt7$subgroup)))
dt7$units <- as.factor(ifelse((trimws(as.character(dt7$units))==trimws("NA")),NA,as.character(dt7$units)))
dt7$datacoveragepct <- ifelse((trimws(as.character(dt7$datacoveragepct))==trimws("NA")),NA,dt7$datacoveragepct)               
suppressWarnings(dt7$datacoveragepct <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt7$datacoveragepct))==as.character(as.numeric("NA"))),NA,dt7$datacoveragepct))


# Here is the structure of the input data frame:
str(dt7)                            
attach(dt7)                            
# The analyses below are basic descriptions of the variables. After testing, they should be replaced.                 

summary(zoneid)
summary(variable_name)
summary(value)
summary(spatial_division)
summary(main_feature)
summary(subgroup)
summary(units)
summary(datacoveragepct)
summary(precision) 
# Get more details on character variables

summary(as.factor(dt7$zoneid)) 
summary(as.factor(dt7$variable_name)) 
summary(as.factor(dt7$spatial_division)) 
summary(as.factor(dt7$main_feature)) 
summary(as.factor(dt7$subgroup)) 
summary(as.factor(dt7$units))
detach(dt7)               


inUrl8  <- "https://pasta.lternet.edu/package/data/eml/edi/1136/2/577f5166da1780dddb2179eeda5d4ab1" 
infile8 <- tempfile()
try(download.file(inUrl8,infile8,method="curl"))
if (is.na(file.size(infile8))) download.file(inUrl8,infile8,method="auto")


dt8 <-read.csv(infile8,header=F 
               ,sep=","  
               ,quot='"' 
               , col.names=c(
                 "zoneid",     
                 "variable_name",     
                 "value",     
                 "spatial_division",     
                 "main_feature",     
                 "subgroup",     
                 "units",     
                 "datacoveragepct",     
                 "precision"    ), check.names=TRUE)

unlink(infile8)

# Fix any interval or ratio columns mistakenly read in as nominal and nominal columns read as numeric or dates read as strings

if (class(dt8$zoneid)!="factor") dt8$zoneid<- as.factor(dt8$zoneid)
if (class(dt8$variable_name)!="factor") dt8$variable_name<- as.factor(dt8$variable_name)
if (class(dt8$value)=="factor") dt8$value <-as.numeric(levels(dt8$value))[as.integer(dt8$value) ]               
if (class(dt8$value)=="character") dt8$value <-as.numeric(dt8$value)
if (class(dt8$spatial_division)!="factor") dt8$spatial_division<- as.factor(dt8$spatial_division)
if (class(dt8$main_feature)!="factor") dt8$main_feature<- as.factor(dt8$main_feature)
if (class(dt8$subgroup)!="factor") dt8$subgroup<- as.factor(dt8$subgroup)
if (class(dt8$units)!="factor") dt8$units<- as.factor(dt8$units)
if (class(dt8$datacoveragepct)=="factor") dt8$datacoveragepct <-as.numeric(levels(dt8$datacoveragepct))[as.integer(dt8$datacoveragepct) ]               
if (class(dt8$datacoveragepct)=="character") dt8$datacoveragepct <-as.numeric(dt8$datacoveragepct)
if (class(dt8$precision)=="factor") dt8$precision <-as.numeric(levels(dt8$precision))[as.integer(dt8$precision) ]               
if (class(dt8$precision)=="character") dt8$precision <-as.numeric(dt8$precision)

# Convert Missing Values to NA for non-dates

dt8$value <- ifelse((trimws(as.character(dt8$value))==trimws("NA")),NA,dt8$value)               
suppressWarnings(dt8$value <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt8$value))==as.character(as.numeric("NA"))),NA,dt8$value))
dt8$subgroup <- as.factor(ifelse((trimws(as.character(dt8$subgroup))==trimws("NA")),NA,as.character(dt8$subgroup)))
dt8$units <- as.factor(ifelse((trimws(as.character(dt8$units))==trimws("NA")),NA,as.character(dt8$units)))
dt8$datacoveragepct <- ifelse((trimws(as.character(dt8$datacoveragepct))==trimws("NA")),NA,dt8$datacoveragepct)               
suppressWarnings(dt8$datacoveragepct <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt8$datacoveragepct))==as.character(as.numeric("NA"))),NA,dt8$datacoveragepct))


# Here is the structure of the input data frame:
str(dt8)                            
attach(dt8)                            
# The analyses below are basic descriptions of the variables. After testing, they should be replaced.                 

summary(zoneid)
summary(variable_name)
summary(value)
summary(spatial_division)
summary(main_feature)
summary(subgroup)
summary(units)
summary(datacoveragepct)
summary(precision) 
# Get more details on character variables

summary(as.factor(dt8$zoneid)) 
summary(as.factor(dt8$variable_name)) 
summary(as.factor(dt8$spatial_division)) 
summary(as.factor(dt8$main_feature)) 
summary(as.factor(dt8$subgroup)) 
summary(as.factor(dt8$units))
detach(dt8)               


inUrl9  <- "https://pasta.lternet.edu/package/data/eml/edi/1136/2/19c2d9c80e3510acac909786879f3ed2" 
infile9 <- tempfile()
try(download.file(inUrl9,infile9,method="curl"))
if (is.na(file.size(infile9))) download.file(inUrl9,infile9,method="auto")


dt9 <-read.csv(infile9,header=F 
               ,sep=","  
               ,quot='"' 
               , col.names=c(
                 "zoneid",     
                 "variable_name",     
                 "value",     
                 "spatial_division",     
                 "main_feature",     
                 "subgroup",     
                 "units",     
                 "precision"    ), check.names=TRUE)

unlink(infile9)

# Fix any interval or ratio columns mistakenly read in as nominal and nominal columns read as numeric or dates read as strings

if (class(dt9$zoneid)!="factor") dt9$zoneid<- as.factor(dt9$zoneid)
if (class(dt9$variable_name)!="factor") dt9$variable_name<- as.factor(dt9$variable_name)
if (class(dt9$value)=="factor") dt9$value <-as.numeric(levels(dt9$value))[as.integer(dt9$value) ]               
if (class(dt9$value)=="character") dt9$value <-as.numeric(dt9$value)
if (class(dt9$spatial_division)!="factor") dt9$spatial_division<- as.factor(dt9$spatial_division)
if (class(dt9$main_feature)!="factor") dt9$main_feature<- as.factor(dt9$main_feature)
if (class(dt9$subgroup)!="factor") dt9$subgroup<- as.factor(dt9$subgroup)
if (class(dt9$units)!="factor") dt9$units<- as.factor(dt9$units)
if (class(dt9$precision)=="factor") dt9$precision <-as.numeric(levels(dt9$precision))[as.integer(dt9$precision) ]               
if (class(dt9$precision)=="character") dt9$precision <-as.numeric(dt9$precision)

# Convert Missing Values to NA for non-dates

dt9$value <- ifelse((trimws(as.character(dt9$value))==trimws("NA")),NA,dt9$value)               
suppressWarnings(dt9$value <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt9$value))==as.character(as.numeric("NA"))),NA,dt9$value))
dt9$subgroup <- as.factor(ifelse((trimws(as.character(dt9$subgroup))==trimws("NA")),NA,as.character(dt9$subgroup)))
dt9$units <- as.factor(ifelse((trimws(as.character(dt9$units))==trimws("NA")),NA,as.character(dt9$units)))


# Here is the structure of the input data frame:
str(dt9)                            
attach(dt9)                            
# The analyses below are basic descriptions of the variables. After testing, they should be replaced.                 

summary(zoneid)
summary(variable_name)
summary(value)
summary(spatial_division)
summary(main_feature)
summary(subgroup)
summary(units)
summary(precision) 
# Get more details on character variables

summary(as.factor(dt9$zoneid)) 
summary(as.factor(dt9$variable_name)) 
summary(as.factor(dt9$spatial_division)) 
summary(as.factor(dt9$main_feature)) 
summary(as.factor(dt9$subgroup)) 
summary(as.factor(dt9$units))
detach(dt9)               


inUrl10  <- "https://pasta.lternet.edu/package/data/eml/edi/1136/2/d3e430bc9695084b28cbb86dd6d1b4ab" 
infile10 <- tempfile()
try(download.file(inUrl10,infile10,method="curl"))
if (is.na(file.size(infile10))) download.file(inUrl10,infile10,method="auto")


geo10 <-read.csv(infile10,header=F 
                ,sep=","  
                ,quot='"' 
                , col.names=c(
                  "zoneid",     
                  "spatial_division",     
                  "year",     
                  "datacoveragepct",     
                  "precision",     
                  "nlcd_barren31_pct",     
                  "nlcd_cultcrop82_pct",     
                  "nlcd_devhi24_pct",     
                  "nlcd_devlow22_pct",     
                  "nlcd_devmed23_pct",     
                  "nlcd_devopen21_pct",     
                  "nlcd_forcon42_pct",     
                  "nlcd_fordec41_pct",     
                  "nlcd_formix43_pct",     
                  "nlcd_grass71_pct",     
                  "nlcd_icesnow12_pct",     
                  "nlcd_openwater11_pct",     
                  "nlcd_past81_pct",     
                  "nlcd_shrub52_pct",     
                  "nlcd_wetemerg95_pct",     
                  "nlcd_wetwood90_pct"    ), check.names=TRUE)

unlink(infile10)

# Fix any interval or ratio columns mistakenly read in as nominal and nominal columns read as numeric or dates read as strings

if (class(geo10$zoneid)!="factor") geo10$zoneid<- as.factor(geo10$zoneid)
if (class(geo10$spatial_division)!="factor") geo10$spatial_division<- as.factor(geo10$spatial_division)
if (class(geo10$year)=="factor") geo10$year <-as.numeric(levels(geo10$year))[as.integer(geo10$year) ]               
if (class(geo10$year)=="character") geo10$year <-as.numeric(geo10$year)
if (class(geo10$datacoveragepct)=="factor") geo10$datacoveragepct <-as.numeric(levels(geo10$datacoveragepct))[as.integer(geo10$datacoveragepct) ]               
if (class(geo10$datacoveragepct)=="character") geo10$datacoveragepct <-as.numeric(geo10$datacoveragepct)
if (class(geo10$precision)=="factor") geo10$precision <-as.numeric(levels(geo10$precision))[as.integer(geo10$precision) ]               
if (class(geo10$precision)=="character") geo10$precision <-as.numeric(geo10$precision)
if (class(geo10$nlcd_barren31_pct)=="factor") geo10$nlcd_barren31_pct <-as.numeric(levels(geo10$nlcd_barren31_pct))[as.integer(geo10$nlcd_barren31_pct) ]               
if (class(geo10$nlcd_barren31_pct)=="character") geo10$nlcd_barren31_pct <-as.numeric(geo10$nlcd_barren31_pct)
if (class(geo10$nlcd_cultcrop82_pct)=="factor") geo10$nlcd_cultcrop82_pct <-as.numeric(levels(geo10$nlcd_cultcrop82_pct))[as.integer(geo10$nlcd_cultcrop82_pct) ]               
if (class(geo10$nlcd_cultcrop82_pct)=="character") geo10$nlcd_cultcrop82_pct <-as.numeric(geo10$nlcd_cultcrop82_pct)
if (class(geo10$nlcd_devhi24_pct)=="factor") geo10$nlcd_devhi24_pct <-as.numeric(levels(geo10$nlcd_devhi24_pct))[as.integer(geo10$nlcd_devhi24_pct) ]               
if (class(geo10$nlcd_devhi24_pct)=="character") geo10$nlcd_devhi24_pct <-as.numeric(geo10$nlcd_devhi24_pct)
if (class(geo10$nlcd_devlow22_pct)=="factor") geo10$nlcd_devlow22_pct <-as.numeric(levels(geo10$nlcd_devlow22_pct))[as.integer(geo10$nlcd_devlow22_pct) ]               
if (class(geo10$nlcd_devlow22_pct)=="character") geo10$nlcd_devlow22_pct <-as.numeric(geo10$nlcd_devlow22_pct)
if (class(geo10$nlcd_devmed23_pct)=="factor") geo10$nlcd_devmed23_pct <-as.numeric(levels(geo10$nlcd_devmed23_pct))[as.integer(geo10$nlcd_devmed23_pct) ]               
if (class(geo10$nlcd_devmed23_pct)=="character") geo10$nlcd_devmed23_pct <-as.numeric(geo10$nlcd_devmed23_pct)
if (class(geo10$nlcd_devopen21_pct)=="factor") geo10$nlcd_devopen21_pct <-as.numeric(levels(geo10$nlcd_devopen21_pct))[as.integer(geo10$nlcd_devopen21_pct) ]               
if (class(geo10$nlcd_devopen21_pct)=="character") geo10$nlcd_devopen21_pct <-as.numeric(geo10$nlcd_devopen21_pct)
if (class(geo10$nlcd_forcon42_pct)=="factor") geo10$nlcd_forcon42_pct <-as.numeric(levels(geo10$nlcd_forcon42_pct))[as.integer(geo10$nlcd_forcon42_pct) ]               
if (class(geo10$nlcd_forcon42_pct)=="character") geo10$nlcd_forcon42_pct <-as.numeric(geo10$nlcd_forcon42_pct)
if (class(geo10$nlcd_fordec41_pct)=="factor") geo10$nlcd_fordec41_pct <-as.numeric(levels(geo10$nlcd_fordec41_pct))[as.integer(geo10$nlcd_fordec41_pct) ]               
if (class(geo10$nlcd_fordec41_pct)=="character") geo10$nlcd_fordec41_pct <-as.numeric(geo10$nlcd_fordec41_pct)
if (class(geo10$nlcd_formix43_pct)=="factor") geo10$nlcd_formix43_pct <-as.numeric(levels(geo10$nlcd_formix43_pct))[as.integer(geo10$nlcd_formix43_pct) ]               
if (class(geo10$nlcd_formix43_pct)=="character") geo10$nlcd_formix43_pct <-as.numeric(geo10$nlcd_formix43_pct)
if (class(geo10$nlcd_grass71_pct)=="factor") geo10$nlcd_grass71_pct <-as.numeric(levels(geo10$nlcd_grass71_pct))[as.integer(geo10$nlcd_grass71_pct) ]               
if (class(geo10$nlcd_grass71_pct)=="character") geo10$nlcd_grass71_pct <-as.numeric(geo10$nlcd_grass71_pct)
if (class(geo10$nlcd_icesnow12_pct)=="factor") geo10$nlcd_icesnow12_pct <-as.numeric(levels(geo10$nlcd_icesnow12_pct))[as.integer(geo10$nlcd_icesnow12_pct) ]               
if (class(geo10$nlcd_icesnow12_pct)=="character") geo10$nlcd_icesnow12_pct <-as.numeric(geo10$nlcd_icesnow12_pct)
if (class(geo10$nlcd_openwater11_pct)=="factor") geo10$nlcd_openwater11_pct <-as.numeric(levels(geo10$nlcd_openwater11_pct))[as.integer(geo10$nlcd_openwater11_pct) ]               
if (class(geo10$nlcd_openwater11_pct)=="character") geo10$nlcd_openwater11_pct <-as.numeric(geo10$nlcd_openwater11_pct)
if (class(geo10$nlcd_past81_pct)=="factor") geo10$nlcd_past81_pct <-as.numeric(levels(geo10$nlcd_past81_pct))[as.integer(geo10$nlcd_past81_pct) ]               
if (class(geo10$nlcd_past81_pct)=="character") geo10$nlcd_past81_pct <-as.numeric(geo10$nlcd_past81_pct)
if (class(geo10$nlcd_shrub52_pct)=="factor") geo10$nlcd_shrub52_pct <-as.numeric(levels(geo10$nlcd_shrub52_pct))[as.integer(geo10$nlcd_shrub52_pct) ]               
if (class(geo10$nlcd_shrub52_pct)=="character") geo10$nlcd_shrub52_pct <-as.numeric(geo10$nlcd_shrub52_pct)
if (class(geo10$nlcd_wetemerg95_pct)=="factor") geo10$nlcd_wetemerg95_pct <-as.numeric(levels(geo10$nlcd_wetemerg95_pct))[as.integer(geo10$nlcd_wetemerg95_pct) ]               
if (class(geo10$nlcd_wetemerg95_pct)=="character") geo10$nlcd_wetemerg95_pct <-as.numeric(geo10$nlcd_wetemerg95_pct)
if (class(geo10$nlcd_wetwood90_pct)=="factor") geo10$nlcd_wetwood90_pct <-as.numeric(levels(geo10$nlcd_wetwood90_pct))[as.integer(geo10$nlcd_wetwood90_pct) ]               
if (class(geo10$nlcd_wetwood90_pct)=="character") geo10$nlcd_wetwood90_pct <-as.numeric(geo10$nlcd_wetwood90_pct)

# Convert Missing Values to NA for non-dates

geo10$nlcd_barren31_pct <- ifelse((trimws(as.character(geo10$nlcd_barren31_pct))==trimws("NA")),NA,geo10$nlcd_barren31_pct)               
suppressWarnings(geo10$nlcd_barren31_pct <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(geo10$nlcd_barren31_pct))==as.character(as.numeric("NA"))),NA,geo10$nlcd_barren31_pct))
geo10$nlcd_cultcrop82_pct <- ifelse((trimws(as.character(geo10$nlcd_cultcrop82_pct))==trimws("NA")),NA,geo10$nlcd_cultcrop82_pct)               
suppressWarnings(geo10$nlcd_cultcrop82_pct <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(geo10$nlcd_cultcrop82_pct))==as.character(as.numeric("NA"))),NA,geo10$nlcd_cultcrop82_pct))
geo10$nlcd_devhi24_pct <- ifelse((trimws(as.character(geo10$nlcd_devhi24_pct))==trimws("NA")),NA,geo10$nlcd_devhi24_pct)               
suppressWarnings(geo10$nlcd_devhi24_pct <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(geo10$nlcd_devhi24_pct))==as.character(as.numeric("NA"))),NA,geo10$nlcd_devhi24_pct))
geo10$nlcd_devlow22_pct <- ifelse((trimws(as.character(geo10$nlcd_devlow22_pct))==trimws("NA")),NA,geo10$nlcd_devlow22_pct)               
suppressWarnings(geo10$nlcd_devlow22_pct <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(geo10$nlcd_devlow22_pct))==as.character(as.numeric("NA"))),NA,geo10$nlcd_devlow22_pct))
geo10$nlcd_devmed23_pct <- ifelse((trimws(as.character(geo10$nlcd_devmed23_pct))==trimws("NA")),NA,geo10$nlcd_devmed23_pct)               
suppressWarnings(geo10$nlcd_devmed23_pct <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(geo10$nlcd_devmed23_pct))==as.character(as.numeric("NA"))),NA,geo10$nlcd_devmed23_pct))
geo10$nlcd_devopen21_pct <- ifelse((trimws(as.character(geo10$nlcd_devopen21_pct))==trimws("NA")),NA,geo10$nlcd_devopen21_pct)               
suppressWarnings(geo10$nlcd_devopen21_pct <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(geo10$nlcd_devopen21_pct))==as.character(as.numeric("NA"))),NA,geo10$nlcd_devopen21_pct))
geo10$nlcd_forcon42_pct <- ifelse((trimws(as.character(geo10$nlcd_forcon42_pct))==trimws("NA")),NA,geo10$nlcd_forcon42_pct)               
suppressWarnings(geo10$nlcd_forcon42_pct <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(geo10$nlcd_forcon42_pct))==as.character(as.numeric("NA"))),NA,geo10$nlcd_forcon42_pct))
geo10$nlcd_fordec41_pct <- ifelse((trimws(as.character(geo10$nlcd_fordec41_pct))==trimws("NA")),NA,geo10$nlcd_fordec41_pct)               
suppressWarnings(geo10$nlcd_fordec41_pct <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(geo10$nlcd_fordec41_pct))==as.character(as.numeric("NA"))),NA,geo10$nlcd_fordec41_pct))
geo10$nlcd_formix43_pct <- ifelse((trimws(as.character(geo10$nlcd_formix43_pct))==trimws("NA")),NA,geo10$nlcd_formix43_pct)               
suppressWarnings(geo10$nlcd_formix43_pct <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(geo10$nlcd_formix43_pct))==as.character(as.numeric("NA"))),NA,geo10$nlcd_formix43_pct))
geo10$nlcd_grass71_pct <- ifelse((trimws(as.character(geo10$nlcd_grass71_pct))==trimws("NA")),NA,geo10$nlcd_grass71_pct)               
suppressWarnings(geo10$nlcd_grass71_pct <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(geo10$nlcd_grass71_pct))==as.character(as.numeric("NA"))),NA,geo10$nlcd_grass71_pct))
geo10$nlcd_icesnow12_pct <- ifelse((trimws(as.character(geo10$nlcd_icesnow12_pct))==trimws("NA")),NA,geo10$nlcd_icesnow12_pct)               
suppressWarnings(geo10$nlcd_icesnow12_pct <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(geo10$nlcd_icesnow12_pct))==as.character(as.numeric("NA"))),NA,geo10$nlcd_icesnow12_pct))
geo10$nlcd_openwater11_pct <- ifelse((trimws(as.character(geo10$nlcd_openwater11_pct))==trimws("NA")),NA,geo10$nlcd_openwater11_pct)               
suppressWarnings(geo10$nlcd_openwater11_pct <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(geo10$nlcd_openwater11_pct))==as.character(as.numeric("NA"))),NA,geo10$nlcd_openwater11_pct))
geo10$nlcd_past81_pct <- ifelse((trimws(as.character(geo10$nlcd_past81_pct))==trimws("NA")),NA,geo10$nlcd_past81_pct)               
suppressWarnings(geo10$nlcd_past81_pct <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(geo10$nlcd_past81_pct))==as.character(as.numeric("NA"))),NA,geo10$nlcd_past81_pct))
geo10$nlcd_shrub52_pct <- ifelse((trimws(as.character(geo10$nlcd_shrub52_pct))==trimws("NA")),NA,geo10$nlcd_shrub52_pct)               
suppressWarnings(geo10$nlcd_shrub52_pct <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(geo10$nlcd_shrub52_pct))==as.character(as.numeric("NA"))),NA,geo10$nlcd_shrub52_pct))
geo10$nlcd_wetemerg95_pct <- ifelse((trimws(as.character(geo10$nlcd_wetemerg95_pct))==trimws("NA")),NA,geo10$nlcd_wetemerg95_pct)               
suppressWarnings(geo10$nlcd_wetemerg95_pct <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(geo10$nlcd_wetemerg95_pct))==as.character(as.numeric("NA"))),NA,geo10$nlcd_wetemerg95_pct))
geo10$nlcd_wetwood90_pct <- ifelse((trimws(as.character(geo10$nlcd_wetwood90_pct))==trimws("NA")),NA,geo10$nlcd_wetwood90_pct)               
suppressWarnings(geo10$nlcd_wetwood90_pct <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(geo10$nlcd_wetwood90_pct))==as.character(as.numeric("NA"))),NA,geo10$nlcd_wetwood90_pct))


# Here is the structure of the input data frame:
str(geo10)                            
attach(geo10)                            
# The analyses below are basic descriptions of the variables. After testing, they should be replaced.                 

summary(zoneid)
summary(spatial_division)
summary(year)
summary(datacoveragepct)
summary(precision)
summary(nlcd_barren31_pct)
summary(nlcd_cultcrop82_pct)
summary(nlcd_devhi24_pct)
summary(nlcd_devlow22_pct)
summary(nlcd_devmed23_pct)
summary(nlcd_devopen21_pct)
summary(nlcd_forcon42_pct)
summary(nlcd_fordec41_pct)
summary(nlcd_formix43_pct)
summary(nlcd_grass71_pct)
summary(nlcd_icesnow12_pct)
summary(nlcd_openwater11_pct)
summary(nlcd_past81_pct)
summary(nlcd_shrub52_pct)
summary(nlcd_wetemerg95_pct)
summary(nlcd_wetwood90_pct) 
# Get more details on character variables

summary(as.factor(geo10$zoneid)) 
summary(as.factor(geo10$spatial_division))
detach(geo10)               


inUrl11  <- "https://pasta.lternet.edu/package/data/eml/edi/1136/2/0da723b692f2b549a1cdb769eaa2dc3e" 
infile11 <- tempfile()
try(download.file(inUrl11,infile11,method="curl"))
if (is.na(file.size(infile11))) download.file(inUrl11,infile11,method="auto")


geo11 <-read.csv(infile11,header=F 
                ,sep=","  
                ,quot='"' 
                , col.names=c(
                  "zoneid",     
                  "variable_name",     
                  "value",     
                  "spatial_division",     
                  "main_feature",     
                  "subgroup",     
                  "units",     
                  "datacoveragepct",     
                  "precision"    ), check.names=TRUE)

unlink(infile11)

# Fix any interval or ratio columns mistakenly read in as nominal and nominal columns read as numeric or dates read as strings

if (class(geo11$zoneid)!="factor") geo11$zoneid<- as.factor(geo11$zoneid)
if (class(geo11$variable_name)!="factor") geo11$variable_name<- as.factor(geo11$variable_name)
if (class(geo11$value)=="factor") geo11$value <-as.numeric(levels(geo11$value))[as.integer(geo11$value) ]               
if (class(geo11$value)=="character") geo11$value <-as.numeric(geo11$value)
if (class(geo11$spatial_division)!="factor") geo11$spatial_division<- as.factor(geo11$spatial_division)
if (class(geo11$main_feature)!="factor") geo11$main_feature<- as.factor(geo11$main_feature)
if (class(geo11$subgroup)!="factor") geo11$subgroup<- as.factor(geo11$subgroup)
if (class(geo11$units)!="factor") geo11$units<- as.factor(geo11$units)
if (class(geo11$datacoveragepct)=="factor") geo11$datacoveragepct <-as.numeric(levels(geo11$datacoveragepct))[as.integer(geo11$datacoveragepct) ]               
if (class(geo11$datacoveragepct)=="character") geo11$datacoveragepct <-as.numeric(geo11$datacoveragepct)
if (class(geo11$precision)=="factor") geo11$precision <-as.numeric(levels(geo11$precision))[as.integer(geo11$precision) ]               
if (class(geo11$precision)=="character") geo11$precision <-as.numeric(geo11$precision)

# Convert Missing Values to NA for non-dates

geo11$value <- ifelse((trimws(as.character(geo11$value))==trimws("NA")),NA,geo11$value)               
suppressWarnings(geo11$value <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(geo11$value))==as.character(as.numeric("NA"))),NA,geo11$value))
geo11$subgroup <- as.factor(ifelse((trimws(as.character(geo11$subgroup))==trimws("NA")),NA,as.character(geo11$subgroup)))
geo11$units <- as.factor(ifelse((trimws(as.character(geo11$units))==trimws("NA")),NA,as.character(geo11$units)))
geo11$datacoveragepct <- ifelse((trimws(as.character(geo11$datacoveragepct))==trimws("NA")),NA,geo11$datacoveragepct)               
suppressWarnings(geo11$datacoveragepct <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(geo11$datacoveragepct))==as.character(as.numeric("NA"))),NA,geo11$datacoveragepct))


# Here is the structure of the input data frame:
str(geo11)                            
attach(geo11)                            
# The analyses below are basic descriptions of the variables. After testing, they should be replaced.                 

summary(zoneid)
summary(variable_name)
summary(value)
summary(spatial_division)
summary(main_feature)
summary(subgroup)
summary(units)
summary(datacoveragepct)
summary(precision) 
# Get more details on character variables

summary(as.factor(geo11$zoneid)) 
summary(as.factor(geo11$variable_name)) 
summary(as.factor(geo11$spatial_division)) 
summary(as.factor(geo11$main_feature)) 
summary(as.factor(geo11$subgroup)) 
summary(as.factor(geo11$units))
detach(geo11)               


inUrl12  <- "https://pasta.lternet.edu/package/data/eml/edi/1136/2/d0f22666b92a1e83cafa6f2d5014b52b" 
infile12 <- tempfile()
try(download.file(inUrl12,infile12,method="curl"))
if (is.na(file.size(infile12))) download.file(inUrl12,infile12,method="auto")


geo12 <-read.csv(infile12,header=F 
                ,sep=","  
                ,quot='"' 
                , col.names=c(
                  "zoneid",     
                  "variable_name",     
                  "value",     
                  "spatial_division",     
                  "main_feature",     
                  "subgroup",     
                  "units",     
                  "datacoveragepct",     
                  "precision"    ), check.names=TRUE)

unlink(infile12)

# Fix any interval or ratio columns mistakenly read in as nominal and nominal columns read as numeric or dates read as strings

if (class(geo12$zoneid)!="factor") geo12$zoneid<- as.factor(geo12$zoneid)
if (class(geo12$variable_name)!="factor") geo12$variable_name<- as.factor(geo12$variable_name)
if (class(geo12$value)=="factor") geo12$value <-as.numeric(levels(geo12$value))[as.integer(geo12$value) ]               
if (class(geo12$value)=="character") geo12$value <-as.numeric(geo12$value)
if (class(geo12$spatial_division)!="factor") geo12$spatial_division<- as.factor(geo12$spatial_division)
if (class(geo12$main_feature)!="factor") geo12$main_feature<- as.factor(geo12$main_feature)
if (class(geo12$subgroup)!="factor") geo12$subgroup<- as.factor(geo12$subgroup)
if (class(geo12$units)!="factor") geo12$units<- as.factor(geo12$units)
if (class(geo12$datacoveragepct)=="factor") geo12$datacoveragepct <-as.numeric(levels(geo12$datacoveragepct))[as.integer(geo12$datacoveragepct) ]               
if (class(geo12$datacoveragepct)=="character") geo12$datacoveragepct <-as.numeric(geo12$datacoveragepct)
if (class(geo12$precision)=="factor") geo12$precision <-as.numeric(levels(geo12$precision))[as.integer(geo12$precision) ]               
if (class(geo12$precision)=="character") geo12$precision <-as.numeric(geo12$precision)

# Convert Missing Values to NA for non-dates

geo12$value <- ifelse((trimws(as.character(geo12$value))==trimws("NA")),NA,geo12$value)               
suppressWarnings(geo12$value <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(geo12$value))==as.character(as.numeric("NA"))),NA,geo12$value))
geo12$subgroup <- as.factor(ifelse((trimws(as.character(geo12$subgroup))==trimws("NA")),NA,as.character(geo12$subgroup)))
geo12$units <- as.factor(ifelse((trimws(as.character(geo12$units))==trimws("NA")),NA,as.character(geo12$units)))
geo12$datacoveragepct <- ifelse((trimws(as.character(geo12$datacoveragepct))==trimws("NA")),NA,geo12$datacoveragepct)               
suppressWarnings(geo12$datacoveragepct <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(geo12$datacoveragepct))==as.character(as.numeric("NA"))),NA,geo12$datacoveragepct))


# Here is the structure of the input data frame:
str(geo12)                            
attach(geo12)                            
# The analyses below are basic descriptions of the variables. After testing, they should be replaced.                 

summary(zoneid)
summary(variable_name)
summary(value)
summary(spatial_division)
summary(main_feature)
summary(subgroup)
summary(units)
summary(datacoveragepct)
summary(precision) 
# Get more details on character variables

summary(as.factor(geo12$zoneid)) 
summary(as.factor(geo12$variable_name)) 
summary(as.factor(geo12$spatial_division)) 
summary(as.factor(geo12$main_feature)) 
summary(as.factor(geo12$subgroup)) 
summary(as.factor(geo12$units))
detach(geo12)               





