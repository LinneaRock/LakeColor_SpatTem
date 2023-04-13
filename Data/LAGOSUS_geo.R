# # Package ID: edi.1136.2 Cataloging System:https://pasta.edirepository.org.
# # Data set title: LAGOS-US GEO v1.0: Data module of lake geospatial ecological context at multiple spatial and temporal scales in the conterminous U.S..
# # Data set creator:  Nicole Smith - Michigan State University 
# # Data set creator:  Katherine Webster - Michigan State University 
# # Data set creator:  Lauren Rodriguez - Michigan State University 
# # Data set creator:  Kendra Cheruvelil - Michigan State University 
# # Data set creator:  Paticia Soranno - Michigan State University 
# # Contact:  Kendra Cheruvelil -  Michigan State University  - ksc@msu.edu
# # Stylesheet v2.11 for metadata conversion into program: John H. Porter, Univ. Virginia, jporter@virginia.edu 
# 
# inUrl1  <- "https://pasta.lternet.edu/package/data/eml/edi/1136/2/add975113c90ccbc1479c0913172736a" 
# infile1 <- tempfile()
# try(download.file(inUrl1,infile1,method="curl"))
# if (is.na(file.size(infile1))) download.file(inUrl1,infile1,method="auto")
# 
# 
# dt1 <-read.csv(infile1,header=F 
#                ,skip=1
#                ,sep=","  
#                ,quot='"' 
#                , col.names=c(
#                  "dictionary_type",     
#                  "table_name",     
#                  "variable_name",     
#                  "variable_description",     
#                  "taxonomy_type",     
#                  "main_feature",     
#                  "subgroup",     
#                  "units",     
#                  "in_lagosne",     
#                  "data_type",     
#                  "domain",     
#                  "precision",     
#                  "missing_values",     
#                  "column_index",     
#                  "variable_source_code1",     
#                  "variable_source_code2",     
#                  "methods_tool1",     
#                  "methods_tool2",     
#                  "year_min",     
#                  "year_max",     
#                  "year_n",     
#                  "source_value_code",     
#                  "lake",     
#                  "buff100",     
#                  "buff500",     
#                  "ws",     
#                  "nws",     
#                  "hu12",     
#                  "hu4",     
#                  "hu8",     
#                  "county",     
#                  "state",     
#                  "bailey",     
#                  "epanutr",     
#                  "mlra",     
#                  "neon",     
#                  "omernik3",     
#                  "wwf"    ), check.names=TRUE)
# 
# unlink(infile1)
# 
# # Fix any interval or ratio columns mistakenly read in as nominal and nominal columns read as numeric or dates read as strings
# 
# if (class(dt1$dictionary_type)!="factor") dt1$dictionary_type<- as.factor(dt1$dictionary_type)
# if (class(dt1$table_name)!="factor") dt1$table_name<- as.factor(dt1$table_name)
# if (class(dt1$variable_name)!="factor") dt1$variable_name<- as.factor(dt1$variable_name)
# if (class(dt1$variable_description)!="factor") dt1$variable_description<- as.factor(dt1$variable_description)
# if (class(dt1$taxonomy_type)!="factor") dt1$taxonomy_type<- as.factor(dt1$taxonomy_type)
# if (class(dt1$main_feature)!="factor") dt1$main_feature<- as.factor(dt1$main_feature)
# if (class(dt1$subgroup)!="factor") dt1$subgroup<- as.factor(dt1$subgroup)
# if (class(dt1$units)!="factor") dt1$units<- as.factor(dt1$units)
# if (class(dt1$in_lagosne)!="factor") dt1$in_lagosne<- as.factor(dt1$in_lagosne)
# if (class(dt1$data_type)!="factor") dt1$data_type<- as.factor(dt1$data_type)
# if (class(dt1$domain)!="factor") dt1$domain<- as.factor(dt1$domain)
# if (class(dt1$precision)=="factor") dt1$precision <-as.numeric(levels(dt1$precision))[as.integer(dt1$precision) ]               
# if (class(dt1$precision)=="character") dt1$precision <-as.numeric(dt1$precision)
# if (class(dt1$missing_values)!="factor") dt1$missing_values<- as.factor(dt1$missing_values)
# if (class(dt1$column_index)=="factor") dt1$column_index <-as.numeric(levels(dt1$column_index))[as.integer(dt1$column_index) ]               
# if (class(dt1$column_index)=="character") dt1$column_index <-as.numeric(dt1$column_index)
# if (class(dt1$variable_source_code1)!="factor") dt1$variable_source_code1<- as.factor(dt1$variable_source_code1)
# if (class(dt1$variable_source_code2)!="factor") dt1$variable_source_code2<- as.factor(dt1$variable_source_code2)
# if (class(dt1$methods_tool1)!="factor") dt1$methods_tool1<- as.factor(dt1$methods_tool1)
# if (class(dt1$methods_tool2)!="factor") dt1$methods_tool2<- as.factor(dt1$methods_tool2)
# if (class(dt1$year_min)=="factor") dt1$year_min <-as.numeric(levels(dt1$year_min))[as.integer(dt1$year_min) ]               
# if (class(dt1$year_min)=="character") dt1$year_min <-as.numeric(dt1$year_min)
# if (class(dt1$year_max)=="factor") dt1$year_max <-as.numeric(levels(dt1$year_max))[as.integer(dt1$year_max) ]               
# if (class(dt1$year_max)=="character") dt1$year_max <-as.numeric(dt1$year_max)
# if (class(dt1$year_n)=="factor") dt1$year_n <-as.numeric(levels(dt1$year_n))[as.integer(dt1$year_n) ]               
# if (class(dt1$year_n)=="character") dt1$year_n <-as.numeric(dt1$year_n)
# if (class(dt1$source_value_code)!="factor") dt1$source_value_code<- as.factor(dt1$source_value_code)
# if (class(dt1$lake)!="factor") dt1$lake<- as.factor(dt1$lake)
# if (class(dt1$buff100)!="factor") dt1$buff100<- as.factor(dt1$buff100)
# if (class(dt1$buff500)!="factor") dt1$buff500<- as.factor(dt1$buff500)
# if (class(dt1$ws)!="factor") dt1$ws<- as.factor(dt1$ws)
# if (class(dt1$nws)!="factor") dt1$nws<- as.factor(dt1$nws)
# if (class(dt1$hu12)!="factor") dt1$hu12<- as.factor(dt1$hu12)
# if (class(dt1$hu4)!="factor") dt1$hu4<- as.factor(dt1$hu4)
# if (class(dt1$hu8)!="factor") dt1$hu8<- as.factor(dt1$hu8)
# if (class(dt1$county)!="factor") dt1$county<- as.factor(dt1$county)
# if (class(dt1$state)!="factor") dt1$state<- as.factor(dt1$state)
# if (class(dt1$bailey)!="factor") dt1$bailey<- as.factor(dt1$bailey)
# if (class(dt1$epanutr)!="factor") dt1$epanutr<- as.factor(dt1$epanutr)
# if (class(dt1$mlra)!="factor") dt1$mlra<- as.factor(dt1$mlra)
# if (class(dt1$neon)!="factor") dt1$neon<- as.factor(dt1$neon)
# if (class(dt1$omernik3)!="factor") dt1$omernik3<- as.factor(dt1$omernik3)
# if (class(dt1$wwf)!="factor") dt1$wwf<- as.factor(dt1$wwf)
# 
# # Convert Missing Values to NA for non-dates
# 
# dt1$taxonomy_type <- as.factor(ifelse((trimws(as.character(dt1$taxonomy_type))==trimws("NA")),NA,as.character(dt1$taxonomy_type)))
# dt1$main_feature <- as.factor(ifelse((trimws(as.character(dt1$main_feature))==trimws("NA")),NA,as.character(dt1$main_feature)))
# dt1$subgroup <- as.factor(ifelse((trimws(as.character(dt1$subgroup))==trimws("NA")),NA,as.character(dt1$subgroup)))
# dt1$units <- as.factor(ifelse((trimws(as.character(dt1$units))==trimws("NA")),NA,as.character(dt1$units)))
# dt1$in_lagosne <- as.factor(ifelse((trimws(as.character(dt1$in_lagosne))==trimws("NA")),NA,as.character(dt1$in_lagosne)))
# dt1$domain <- as.factor(ifelse((trimws(as.character(dt1$domain))==trimws("NA")),NA,as.character(dt1$domain)))
# dt1$column_index <- ifelse((trimws(as.character(dt1$column_index))==trimws("NA")),NA,dt1$column_index)               
# suppressWarnings(dt1$column_index <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt1$column_index))==as.character(as.numeric("NA"))),NA,dt1$column_index))
# dt1$variable_source_code1 <- as.factor(ifelse((trimws(as.character(dt1$variable_source_code1))==trimws("NA")),NA,as.character(dt1$variable_source_code1)))
# dt1$variable_source_code2 <- as.factor(ifelse((trimws(as.character(dt1$variable_source_code2))==trimws("NA")),NA,as.character(dt1$variable_source_code2)))
# dt1$methods_tool1 <- as.factor(ifelse((trimws(as.character(dt1$methods_tool1))==trimws("NA")),NA,as.character(dt1$methods_tool1)))
# dt1$methods_tool2 <- as.factor(ifelse((trimws(as.character(dt1$methods_tool2))==trimws("NA")),NA,as.character(dt1$methods_tool2)))
# dt1$year_min <- ifelse((trimws(as.character(dt1$year_min))==trimws("NA")),NA,dt1$year_min)               
# suppressWarnings(dt1$year_min <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt1$year_min))==as.character(as.numeric("NA"))),NA,dt1$year_min))
# dt1$year_max <- ifelse((trimws(as.character(dt1$year_max))==trimws("NA")),NA,dt1$year_max)               
# suppressWarnings(dt1$year_max <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt1$year_max))==as.character(as.numeric("NA"))),NA,dt1$year_max))
# dt1$year_n <- ifelse((trimws(as.character(dt1$year_n))==trimws("NA")),NA,dt1$year_n)               
# suppressWarnings(dt1$year_n <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt1$year_n))==as.character(as.numeric("NA"))),NA,dt1$year_n))
# dt1$source_value_code <- as.factor(ifelse((trimws(as.character(dt1$source_value_code))==trimws("NA")),NA,as.character(dt1$source_value_code)))
# dt1$lake <- as.factor(ifelse((trimws(as.character(dt1$lake))==trimws("NA")),NA,as.character(dt1$lake)))
# dt1$buff100 <- as.factor(ifelse((trimws(as.character(dt1$buff100))==trimws("NA")),NA,as.character(dt1$buff100)))
# dt1$buff500 <- as.factor(ifelse((trimws(as.character(dt1$buff500))==trimws("NA")),NA,as.character(dt1$buff500)))
# dt1$ws <- as.factor(ifelse((trimws(as.character(dt1$ws))==trimws("NA")),NA,as.character(dt1$ws)))
# dt1$nws <- as.factor(ifelse((trimws(as.character(dt1$nws))==trimws("NA")),NA,as.character(dt1$nws)))
# dt1$hu12 <- as.factor(ifelse((trimws(as.character(dt1$hu12))==trimws("NA")),NA,as.character(dt1$hu12)))
# dt1$hu4 <- as.factor(ifelse((trimws(as.character(dt1$hu4))==trimws("NA")),NA,as.character(dt1$hu4)))
# dt1$hu8 <- as.factor(ifelse((trimws(as.character(dt1$hu8))==trimws("NA")),NA,as.character(dt1$hu8)))
# dt1$county <- as.factor(ifelse((trimws(as.character(dt1$county))==trimws("NA")),NA,as.character(dt1$county)))
# dt1$state <- as.factor(ifelse((trimws(as.character(dt1$state))==trimws("NA")),NA,as.character(dt1$state)))
# dt1$bailey <- as.factor(ifelse((trimws(as.character(dt1$bailey))==trimws("NA")),NA,as.character(dt1$bailey)))
# dt1$epanutr <- as.factor(ifelse((trimws(as.character(dt1$epanutr))==trimws("NA")),NA,as.character(dt1$epanutr)))
# dt1$mlra <- as.factor(ifelse((trimws(as.character(dt1$mlra))==trimws("NA")),NA,as.character(dt1$mlra)))
# dt1$neon <- as.factor(ifelse((trimws(as.character(dt1$neon))==trimws("NA")),NA,as.character(dt1$neon)))
# dt1$omernik3 <- as.factor(ifelse((trimws(as.character(dt1$omernik3))==trimws("NA")),NA,as.character(dt1$omernik3)))
# dt1$wwf <- as.factor(ifelse((trimws(as.character(dt1$wwf))==trimws("NA")),NA,as.character(dt1$wwf)))
# 
# 
# # Here is the structure of the input data frame:
# str(dt1)                            
# attach(dt1)                            
# # The analyses below are basic descriptions of the variables. After testing, they should be replaced.                 
# 
# summary(dictionary_type)
# summary(table_name)
# summary(variable_name)
# summary(variable_description)
# summary(taxonomy_type)
# summary(main_feature)
# summary(subgroup)
# summary(units)
# summary(in_lagosne)
# summary(data_type)
# summary(domain)
# summary(precision)
# summary(missing_values)
# summary(column_index)
# summary(variable_source_code1)
# summary(variable_source_code2)
# summary(methods_tool1)
# summary(methods_tool2)
# summary(year_min)
# summary(year_max)
# summary(year_n)
# summary(source_value_code)
# summary(lake)
# summary(buff100)
# summary(buff500)
# summary(ws)
# summary(nws)
# summary(hu12)
# summary(hu4)
# summary(hu8)
# summary(county)
# summary(state)
# summary(bailey)
# summary(epanutr)
# summary(mlra)
# summary(neon)
# summary(omernik3)
# summary(wwf) 
# # Get more details on character variables
# 
# summary(as.factor(dt1$dictionary_type)) 
# summary(as.factor(dt1$table_name)) 
# summary(as.factor(dt1$variable_name)) 
# summary(as.factor(dt1$variable_description)) 
# summary(as.factor(dt1$taxonomy_type)) 
# summary(as.factor(dt1$main_feature)) 
# summary(as.factor(dt1$subgroup)) 
# summary(as.factor(dt1$units)) 
# summary(as.factor(dt1$in_lagosne)) 
# summary(as.factor(dt1$data_type)) 
# summary(as.factor(dt1$domain)) 
# summary(as.factor(dt1$missing_values)) 
# summary(as.factor(dt1$variable_source_code1)) 
# summary(as.factor(dt1$variable_source_code2)) 
# summary(as.factor(dt1$methods_tool1)) 
# summary(as.factor(dt1$methods_tool2)) 
# summary(as.factor(dt1$source_value_code)) 
# summary(as.factor(dt1$lake)) 
# summary(as.factor(dt1$buff100)) 
# summary(as.factor(dt1$buff500)) 
# summary(as.factor(dt1$ws)) 
# summary(as.factor(dt1$nws)) 
# summary(as.factor(dt1$hu12)) 
# summary(as.factor(dt1$hu4)) 
# summary(as.factor(dt1$hu8)) 
# summary(as.factor(dt1$county)) 
# summary(as.factor(dt1$state)) 
# summary(as.factor(dt1$bailey)) 
# summary(as.factor(dt1$epanutr)) 
# summary(as.factor(dt1$mlra)) 
# summary(as.factor(dt1$neon)) 
# summary(as.factor(dt1$omernik3)) 
# summary(as.factor(dt1$wwf))
# detach(dt1)               


# inUrl2  <- "https://pasta.lternet.edu/package/data/eml/edi/1136/2/ae308ba0638717dbbaac5ba25e7f88e5" 
# infile2 <- tempfile()
# try(download.file(inUrl2,infile2,method="curl"))
# if (is.na(file.size(infile2))) download.file(inUrl2,infile2,method="auto")
# 
# 
# dt2 <-read.csv(infile2,header=F 
#                ,skip=1
#                ,sep=","  
#                ,quot='"' 
#                , col.names=c(
#                  "column_name",     
#                  "domain_code",     
#                  "domain_description"    ), check.names=TRUE)
# 
# unlink(infile2)
# 
# # Fix any interval or ratio columns mistakenly read in as nominal and nominal columns read as numeric or dates read as strings
# 
# if (class(dt2$column_name)!="factor") dt2$column_name<- as.factor(dt2$column_name)
# if (class(dt2$domain_code)!="factor") dt2$domain_code<- as.factor(dt2$domain_code)
# if (class(dt2$domain_description)!="factor") dt2$domain_description<- as.factor(dt2$domain_description)
# 
# # Convert Missing Values to NA for non-dates
# 
# 
# 
# # Here is the structure of the input data frame:
# str(dt2)                            
# attach(dt2)                            
# # The analyses below are basic descriptions of the variables. After testing, they should be replaced.                 
# 
# summary(column_name)
# summary(domain_code)
# summary(domain_description) 
# # Get more details on character variables
# 
# summary(as.factor(dt2$column_name)) 
# summary(as.factor(dt2$domain_code)) 
# summary(as.factor(dt2$domain_description))
# detach(dt2)               


# inUrl3  <- "https://pasta.lternet.edu/package/data/eml/edi/1136/2/af2e128e3887d361316eda10e6ed20ae" 
# infile3 <- tempfile()
# try(download.file(inUrl3,infile3,method="curl"))
# if (is.na(file.size(infile3))) download.file(inUrl3,infile3,method="auto")
# 
# 
# dt3 <-read.csv(infile3,header=F 
#                ,skip=1
#                ,sep=","  
#                ,quot='"' 
#                , col.names=c(
#                  "table_name",     
#                  "source_code",     
#                  "source_name",     
#                  "source_shortname",     
#                  "source_description",     
#                  "source_provider",     
#                  "source_citation",     
#                  "source_url",     
#                  "source_metadata_url",     
#                  "source_spatial_resolution",     
#                  "source_time_period",     
#                  "source_access_date",     
#                  "source_data_type"    ), check.names=TRUE)
# 
# unlink(infile3)
# 
# # Fix any interval or ratio columns mistakenly read in as nominal and nominal columns read as numeric or dates read as strings
# 
# if (class(dt3$table_name)!="factor") dt3$table_name<- as.factor(dt3$table_name)
# if (class(dt3$source_code)!="factor") dt3$source_code<- as.factor(dt3$source_code)
# if (class(dt3$source_name)!="factor") dt3$source_name<- as.factor(dt3$source_name)
# if (class(dt3$source_shortname)!="factor") dt3$source_shortname<- as.factor(dt3$source_shortname)
# if (class(dt3$source_description)!="factor") dt3$source_description<- as.factor(dt3$source_description)
# if (class(dt3$source_provider)!="factor") dt3$source_provider<- as.factor(dt3$source_provider)
# if (class(dt3$source_citation)!="factor") dt3$source_citation<- as.factor(dt3$source_citation)
# if (class(dt3$source_url)!="factor") dt3$source_url<- as.factor(dt3$source_url)
# if (class(dt3$source_metadata_url)!="factor") dt3$source_metadata_url<- as.factor(dt3$source_metadata_url)
# if (class(dt3$source_spatial_resolution)!="factor") dt3$source_spatial_resolution<- as.factor(dt3$source_spatial_resolution)
# if (class(dt3$source_time_period)!="factor") dt3$source_time_period<- as.factor(dt3$source_time_period)
# if (class(dt3$source_access_date)!="factor") dt3$source_access_date<- as.factor(dt3$source_access_date)
# if (class(dt3$source_data_type)!="factor") dt3$source_data_type<- as.factor(dt3$source_data_type)
# 
# # Convert Missing Values to NA for non-dates
# 
# dt3$table_name <- as.factor(ifelse((trimws(as.character(dt3$table_name))==trimws("NA")),NA,as.character(dt3$table_name)))
# dt3$source_code <- as.factor(ifelse((trimws(as.character(dt3$source_code))==trimws("NA")),NA,as.character(dt3$source_code)))
# dt3$source_name <- as.factor(ifelse((trimws(as.character(dt3$source_name))==trimws("NA")),NA,as.character(dt3$source_name)))
# dt3$source_shortname <- as.factor(ifelse((trimws(as.character(dt3$source_shortname))==trimws("NA")),NA,as.character(dt3$source_shortname)))
# dt3$source_description <- as.factor(ifelse((trimws(as.character(dt3$source_description))==trimws("NA")),NA,as.character(dt3$source_description)))
# dt3$source_provider <- as.factor(ifelse((trimws(as.character(dt3$source_provider))==trimws("NA")),NA,as.character(dt3$source_provider)))
# dt3$source_citation <- as.factor(ifelse((trimws(as.character(dt3$source_citation))==trimws("NA")),NA,as.character(dt3$source_citation)))
# dt3$source_url <- as.factor(ifelse((trimws(as.character(dt3$source_url))==trimws("NA")),NA,as.character(dt3$source_url)))
# dt3$source_metadata_url <- as.factor(ifelse((trimws(as.character(dt3$source_metadata_url))==trimws("NA")),NA,as.character(dt3$source_metadata_url)))
# dt3$source_spatial_resolution <- as.factor(ifelse((trimws(as.character(dt3$source_spatial_resolution))==trimws("NA")),NA,as.character(dt3$source_spatial_resolution)))
# dt3$source_time_period <- as.factor(ifelse((trimws(as.character(dt3$source_time_period))==trimws("NA")),NA,as.character(dt3$source_time_period)))
# dt3$source_access_date <- as.factor(ifelse((trimws(as.character(dt3$source_access_date))==trimws("NA")),NA,as.character(dt3$source_access_date)))
# dt3$source_data_type <- as.factor(ifelse((trimws(as.character(dt3$source_data_type))==trimws("NA")),NA,as.character(dt3$source_data_type)))
# 
# 
# # Here is the structure of the input data frame:
# str(dt3)                            
# attach(dt3)                            
# # The analyses below are basic descriptions of the variables. After testing, they should be replaced.                 
# 
# summary(table_name)
# summary(source_code)
# summary(source_name)
# summary(source_shortname)
# summary(source_description)
# summary(source_provider)
# summary(source_citation)
# summary(source_url)
# summary(source_metadata_url)
# summary(source_spatial_resolution)
# summary(source_time_period)
# summary(source_access_date)
# summary(source_data_type) 
# # Get more details on character variables
# 
# summary(as.factor(dt3$table_name)) 
# summary(as.factor(dt3$source_code)) 
# summary(as.factor(dt3$source_name)) 
# summary(as.factor(dt3$source_shortname)) 
# summary(as.factor(dt3$source_description)) 
# summary(as.factor(dt3$source_provider)) 
# summary(as.factor(dt3$source_citation)) 
# summary(as.factor(dt3$source_url)) 
# summary(as.factor(dt3$source_metadata_url)) 
# summary(as.factor(dt3$source_spatial_resolution)) 
# summary(as.factor(dt3$source_time_period)) 
# summary(as.factor(dt3$source_access_date)) 
# summary(as.factor(dt3$source_data_type))
# detach(dt3)               


# inUrl4  <- "https://pasta.lternet.edu/package/data/eml/edi/1136/2/9208a30ebdc0dbb7fa6cf60dd7bff562" 
# infile4 <- tempfile()
# try(download.file(inUrl4,infile4,method="curl"))
# if (is.na(file.size(infile4))) download.file(inUrl4,infile4,method="auto")
# 
# 
# dt4 <-read.csv(infile4,header=F 
#                ,sep=","  
#                ,quot='"' 
#                , col.names=c(
#                  "zoneid",     
#                  "spatial_division",     
#                  "sourceid",     
#                  "sourceid_name",     
#                  "name",     
#                  "states",     
#                  "area_ha",     
#                  "perimeter_m",     
#                  "originalarea_pct",     
#                  "lat_decdeg",     
#                  "lon_decdeg",     
#                  "inusa_pct",     
#                  "onlandborder",     
#                  "oncoast",     
#                  "ismultipart"    ), check.names=TRUE)
# 
# unlink(infile4)
# 
# # Fix any interval or ratio columns mistakenly read in as nominal and nominal columns read as numeric or dates read as strings
# 
# if (class(dt4$zoneid)!="factor") dt4$zoneid<- as.factor(dt4$zoneid)
# if (class(dt4$spatial_division)!="factor") dt4$spatial_division<- as.factor(dt4$spatial_division)
# if (class(dt4$sourceid)!="factor") dt4$sourceid<- as.factor(dt4$sourceid)
# if (class(dt4$sourceid_name)!="factor") dt4$sourceid_name<- as.factor(dt4$sourceid_name)
# if (class(dt4$name)!="factor") dt4$name<- as.factor(dt4$name)
# if (class(dt4$states)!="factor") dt4$states<- as.factor(dt4$states)
# if (class(dt4$area_ha)=="factor") dt4$area_ha <-as.numeric(levels(dt4$area_ha))[as.integer(dt4$area_ha) ]               
# if (class(dt4$area_ha)=="character") dt4$area_ha <-as.numeric(dt4$area_ha)
# if (class(dt4$perimeter_m)=="factor") dt4$perimeter_m <-as.numeric(levels(dt4$perimeter_m))[as.integer(dt4$perimeter_m) ]               
# if (class(dt4$perimeter_m)=="character") dt4$perimeter_m <-as.numeric(dt4$perimeter_m)
# if (class(dt4$originalarea_pct)=="factor") dt4$originalarea_pct <-as.numeric(levels(dt4$originalarea_pct))[as.integer(dt4$originalarea_pct) ]               
# if (class(dt4$originalarea_pct)=="character") dt4$originalarea_pct <-as.numeric(dt4$originalarea_pct)
# if (class(dt4$lat_decdeg)=="factor") dt4$lat_decdeg <-as.numeric(levels(dt4$lat_decdeg))[as.integer(dt4$lat_decdeg) ]               
# if (class(dt4$lat_decdeg)=="character") dt4$lat_decdeg <-as.numeric(dt4$lat_decdeg)
# if (class(dt4$lon_decdeg)=="factor") dt4$lon_decdeg <-as.numeric(levels(dt4$lon_decdeg))[as.integer(dt4$lon_decdeg) ]               
# if (class(dt4$lon_decdeg)=="character") dt4$lon_decdeg <-as.numeric(dt4$lon_decdeg)
# if (class(dt4$inusa_pct)=="factor") dt4$inusa_pct <-as.numeric(levels(dt4$inusa_pct))[as.integer(dt4$inusa_pct) ]               
# if (class(dt4$inusa_pct)=="character") dt4$inusa_pct <-as.numeric(dt4$inusa_pct)
# if (class(dt4$onlandborder)!="factor") dt4$onlandborder<- as.factor(dt4$onlandborder)
# if (class(dt4$oncoast)!="factor") dt4$oncoast<- as.factor(dt4$oncoast)
# if (class(dt4$ismultipart)!="factor") dt4$ismultipart<- as.factor(dt4$ismultipart)
# 
# # Convert Missing Values to NA for non-dates
# 
# dt4$sourceid <- as.factor(ifelse((trimws(as.character(dt4$sourceid))==trimws("NA")),NA,as.character(dt4$sourceid)))
# dt4$sourceid_name <- as.factor(ifelse((trimws(as.character(dt4$sourceid_name))==trimws("NA")),NA,as.character(dt4$sourceid_name)))
# dt4$name <- as.factor(ifelse((trimws(as.character(dt4$name))==trimws("NA")),NA,as.character(dt4$name)))
# dt4$states <- as.factor(ifelse((trimws(as.character(dt4$states))==trimws("NA")),NA,as.character(dt4$states)))
# dt4$area_ha <- ifelse((trimws(as.character(dt4$area_ha))==trimws("NA")),NA,dt4$area_ha)               
# suppressWarnings(dt4$area_ha <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt4$area_ha))==as.character(as.numeric("NA"))),NA,dt4$area_ha))
# dt4$perimeter_m <- ifelse((trimws(as.character(dt4$perimeter_m))==trimws("NA")),NA,dt4$perimeter_m)               
# suppressWarnings(dt4$perimeter_m <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt4$perimeter_m))==as.character(as.numeric("NA"))),NA,dt4$perimeter_m))
# dt4$originalarea_pct <- ifelse((trimws(as.character(dt4$originalarea_pct))==trimws("NA")),NA,dt4$originalarea_pct)               
# suppressWarnings(dt4$originalarea_pct <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt4$originalarea_pct))==as.character(as.numeric("NA"))),NA,dt4$originalarea_pct))
# dt4$lat_decdeg <- ifelse((trimws(as.character(dt4$lat_decdeg))==trimws("NA")),NA,dt4$lat_decdeg)               
# suppressWarnings(dt4$lat_decdeg <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt4$lat_decdeg))==as.character(as.numeric("NA"))),NA,dt4$lat_decdeg))
# dt4$lon_decdeg <- ifelse((trimws(as.character(dt4$lon_decdeg))==trimws("NA")),NA,dt4$lon_decdeg)               
# suppressWarnings(dt4$lon_decdeg <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt4$lon_decdeg))==as.character(as.numeric("NA"))),NA,dt4$lon_decdeg))
# dt4$inusa_pct <- ifelse((trimws(as.character(dt4$inusa_pct))==trimws("NA")),NA,dt4$inusa_pct)               
# suppressWarnings(dt4$inusa_pct <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt4$inusa_pct))==as.character(as.numeric("NA"))),NA,dt4$inusa_pct))
# dt4$onlandborder <- as.factor(ifelse((trimws(as.character(dt4$onlandborder))==trimws("NA")),NA,as.character(dt4$onlandborder)))
# dt4$oncoast <- as.factor(ifelse((trimws(as.character(dt4$oncoast))==trimws("NA")),NA,as.character(dt4$oncoast)))
# dt4$ismultipart <- as.factor(ifelse((trimws(as.character(dt4$ismultipart))==trimws("NA")),NA,as.character(dt4$ismultipart)))
# 
# 
# # Here is the structure of the input data frame:
# str(dt4)                            
# attach(dt4)                            
# # The analyses below are basic descriptions of the variables. After testing, they should be replaced.                 
# 
# summary(zoneid)
# summary(spatial_division)
# summary(sourceid)
# summary(sourceid_name)
# summary(name)
# summary(states)
# summary(area_ha)
# summary(perimeter_m)
# summary(originalarea_pct)
# summary(lat_decdeg)
# summary(lon_decdeg)
# summary(inusa_pct)
# summary(onlandborder)
# summary(oncoast)
# summary(ismultipart) 
# # Get more details on character variables
# 
# summary(as.factor(dt4$zoneid)) 
# summary(as.factor(dt4$spatial_division)) 
# summary(as.factor(dt4$sourceid)) 
# summary(as.factor(dt4$sourceid_name)) 
# summary(as.factor(dt4$name)) 
# summary(as.factor(dt4$states)) 
# summary(as.factor(dt4$onlandborder)) 
# summary(as.factor(dt4$oncoast)) 
# summary(as.factor(dt4$ismultipart))
# detach(dt4)               
# 
# 
# inUrl5  <- "https://pasta.lternet.edu/package/data/eml/edi/1136/2/1cc2b1bec02e21adf538fe7d19f2e1ea" 
# infile5 <- tempfile()
# try(download.file(inUrl5,infile5,method="curl"))
# if (is.na(file.size(infile5))) download.file(inUrl5,infile5,method="auto")
# 
# 
# dt5 <-read.csv(infile5,header=F 
#                ,sep=","  
#                ,quot='"' 
#                , col.names=c(
#                  "zoneid",     
#                  "variable_name",     
#                  "value",     
#                  "spatial_division",     
#                  "main_feature",     
#                  "subgroup",     
#                  "units",     
#                  "year",     
#                  "datacoveragepct",     
#                  "precision"    ), check.names=TRUE)
# 
# unlink(infile5)
# 
# # Fix any interval or ratio columns mistakenly read in as nominal and nominal columns read as numeric or dates read as strings
# 
# if (class(dt5$zoneid)!="factor") dt5$zoneid<- as.factor(dt5$zoneid)
# if (class(dt5$variable_name)!="factor") dt5$variable_name<- as.factor(dt5$variable_name)
# if (class(dt5$value)=="factor") dt5$value <-as.numeric(levels(dt5$value))[as.integer(dt5$value) ]               
# if (class(dt5$value)=="character") dt5$value <-as.numeric(dt5$value)
# if (class(dt5$spatial_division)!="factor") dt5$spatial_division<- as.factor(dt5$spatial_division)
# if (class(dt5$main_feature)!="factor") dt5$main_feature<- as.factor(dt5$main_feature)
# if (class(dt5$subgroup)!="factor") dt5$subgroup<- as.factor(dt5$subgroup)
# if (class(dt5$units)!="factor") dt5$units<- as.factor(dt5$units)
# if (class(dt5$year)=="factor") dt5$year <-as.numeric(levels(dt5$year))[as.integer(dt5$year) ]               
# if (class(dt5$year)=="character") dt5$year <-as.numeric(dt5$year)
# if (class(dt5$datacoveragepct)=="factor") dt5$datacoveragepct <-as.numeric(levels(dt5$datacoveragepct))[as.integer(dt5$datacoveragepct) ]               
# if (class(dt5$datacoveragepct)=="character") dt5$datacoveragepct <-as.numeric(dt5$datacoveragepct)
# if (class(dt5$precision)=="factor") dt5$precision <-as.numeric(levels(dt5$precision))[as.integer(dt5$precision) ]               
# if (class(dt5$precision)=="character") dt5$precision <-as.numeric(dt5$precision)
# 
# # Convert Missing Values to NA for non-dates
# 
# dt5$value <- ifelse((trimws(as.character(dt5$value))==trimws("NA")),NA,dt5$value)               
# suppressWarnings(dt5$value <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt5$value))==as.character(as.numeric("NA"))),NA,dt5$value))
# dt5$subgroup <- as.factor(ifelse((trimws(as.character(dt5$subgroup))==trimws("NA")),NA,as.character(dt5$subgroup)))
# dt5$units <- as.factor(ifelse((trimws(as.character(dt5$units))==trimws("NA")),NA,as.character(dt5$units)))
# dt5$year <- ifelse((trimws(as.character(dt5$year))==trimws("NA")),NA,dt5$year)               
# suppressWarnings(dt5$year <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt5$year))==as.character(as.numeric("NA"))),NA,dt5$year))
# dt5$datacoveragepct <- ifelse((trimws(as.character(dt5$datacoveragepct))==trimws("NA")),NA,dt5$datacoveragepct)               
# suppressWarnings(dt5$datacoveragepct <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt5$datacoveragepct))==as.character(as.numeric("NA"))),NA,dt5$datacoveragepct))
# 
# 
# # Here is the structure of the input data frame:
# str(dt5)                            
# attach(dt5)                            
# # The analyses below are basic descriptions of the variables. After testing, they should be replaced.                 
# 
# summary(zoneid)
# summary(variable_name)
# summary(value)
# summary(spatial_division)
# summary(main_feature)
# summary(subgroup)
# summary(units)
# summary(year)
# summary(datacoveragepct)
# summary(precision) 
# # Get more details on character variables
# 
# summary(as.factor(dt5$zoneid)) 
# summary(as.factor(dt5$variable_name)) 
# summary(as.factor(dt5$spatial_division)) 
# summary(as.factor(dt5$main_feature)) 
# summary(as.factor(dt5$subgroup)) 
# summary(as.factor(dt5$units))
# detach(dt5)               
# 

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





# inUrl7  <- "https://pasta.lternet.edu/package/data/eml/edi/1136/2/3ec85ada98d6929c895038729441f9cc" 
# infile7 <- tempfile()
# try(download.file(inUrl7,infile7,method="curl"))
# if (is.na(file.size(infile7))) download.file(inUrl7,infile7,method="auto")
# 
# 
# dt7 <-read.csv(infile7,header=F 
#                ,sep=","  
#                ,quot='"' 
#                , col.names=c(
#                  "zoneid",     
#                  "variable_name",     
#                  "value",     
#                  "spatial_division",     
#                  "main_feature",     
#                  "subgroup",     
#                  "units",     
#                  "datacoveragepct",     
#                  "precision"    ), check.names=TRUE)
# 
# unlink(infile7)
# 
# # Fix any interval or ratio columns mistakenly read in as nominal and nominal columns read as numeric or dates read as strings
# 
# if (class(dt7$zoneid)!="factor") dt7$zoneid<- as.factor(dt7$zoneid)
# if (class(dt7$variable_name)!="factor") dt7$variable_name<- as.factor(dt7$variable_name)
# if (class(dt7$value)=="factor") dt7$value <-as.numeric(levels(dt7$value))[as.integer(dt7$value) ]               
# if (class(dt7$value)=="character") dt7$value <-as.numeric(dt7$value)
# if (class(dt7$spatial_division)!="factor") dt7$spatial_division<- as.factor(dt7$spatial_division)
# if (class(dt7$main_feature)!="factor") dt7$main_feature<- as.factor(dt7$main_feature)
# if (class(dt7$subgroup)!="factor") dt7$subgroup<- as.factor(dt7$subgroup)
# if (class(dt7$units)!="factor") dt7$units<- as.factor(dt7$units)
# if (class(dt7$datacoveragepct)=="factor") dt7$datacoveragepct <-as.numeric(levels(dt7$datacoveragepct))[as.integer(dt7$datacoveragepct) ]               
# if (class(dt7$datacoveragepct)=="character") dt7$datacoveragepct <-as.numeric(dt7$datacoveragepct)
# if (class(dt7$precision)=="factor") dt7$precision <-as.numeric(levels(dt7$precision))[as.integer(dt7$precision) ]               
# if (class(dt7$precision)=="character") dt7$precision <-as.numeric(dt7$precision)
# 
# # Convert Missing Values to NA for non-dates
# 
# dt7$value <- ifelse((trimws(as.character(dt7$value))==trimws("NA")),NA,dt7$value)               
# suppressWarnings(dt7$value <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt7$value))==as.character(as.numeric("NA"))),NA,dt7$value))
# dt7$subgroup <- as.factor(ifelse((trimws(as.character(dt7$subgroup))==trimws("NA")),NA,as.character(dt7$subgroup)))
# dt7$units <- as.factor(ifelse((trimws(as.character(dt7$units))==trimws("NA")),NA,as.character(dt7$units)))
# dt7$datacoveragepct <- ifelse((trimws(as.character(dt7$datacoveragepct))==trimws("NA")),NA,dt7$datacoveragepct)               
# suppressWarnings(dt7$datacoveragepct <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt7$datacoveragepct))==as.character(as.numeric("NA"))),NA,dt7$datacoveragepct))
# 
# 
# # Here is the structure of the input data frame:
# str(dt7)                            
# attach(dt7)                            
# # The analyses below are basic descriptions of the variables. After testing, they should be replaced.                 
# 
# summary(zoneid)
# summary(variable_name)
# summary(value)
# summary(spatial_division)
# summary(main_feature)
# summary(subgroup)
# summary(units)
# summary(datacoveragepct)
# summary(precision) 
# # Get more details on character variables
# 
# summary(as.factor(dt7$zoneid)) 
# summary(as.factor(dt7$variable_name)) 
# summary(as.factor(dt7$spatial_division)) 
# summary(as.factor(dt7$main_feature)) 
# summary(as.factor(dt7$subgroup)) 
# summary(as.factor(dt7$units))
# detach(dt7)               
# 
# 
# inUrl8  <- "https://pasta.lternet.edu/package/data/eml/edi/1136/2/577f5166da1780dddb2179eeda5d4ab1" 
# infile8 <- tempfile()
# try(download.file(inUrl8,infile8,method="curl"))
# if (is.na(file.size(infile8))) download.file(inUrl8,infile8,method="auto")
# 
# 
# dt8 <-read.csv(infile8,header=F 
#                ,sep=","  
#                ,quot='"' 
#                , col.names=c(
#                  "zoneid",     
#                  "variable_name",     
#                  "value",     
#                  "spatial_division",     
#                  "main_feature",     
#                  "subgroup",     
#                  "units",     
#                  "datacoveragepct",     
#                  "precision"    ), check.names=TRUE)
# 
# unlink(infile8)
# 
# # Fix any interval or ratio columns mistakenly read in as nominal and nominal columns read as numeric or dates read as strings
# 
# if (class(dt8$zoneid)!="factor") dt8$zoneid<- as.factor(dt8$zoneid)
# if (class(dt8$variable_name)!="factor") dt8$variable_name<- as.factor(dt8$variable_name)
# if (class(dt8$value)=="factor") dt8$value <-as.numeric(levels(dt8$value))[as.integer(dt8$value) ]               
# if (class(dt8$value)=="character") dt8$value <-as.numeric(dt8$value)
# if (class(dt8$spatial_division)!="factor") dt8$spatial_division<- as.factor(dt8$spatial_division)
# if (class(dt8$main_feature)!="factor") dt8$main_feature<- as.factor(dt8$main_feature)
# if (class(dt8$subgroup)!="factor") dt8$subgroup<- as.factor(dt8$subgroup)
# if (class(dt8$units)!="factor") dt8$units<- as.factor(dt8$units)
# if (class(dt8$datacoveragepct)=="factor") dt8$datacoveragepct <-as.numeric(levels(dt8$datacoveragepct))[as.integer(dt8$datacoveragepct) ]               
# if (class(dt8$datacoveragepct)=="character") dt8$datacoveragepct <-as.numeric(dt8$datacoveragepct)
# if (class(dt8$precision)=="factor") dt8$precision <-as.numeric(levels(dt8$precision))[as.integer(dt8$precision) ]               
# if (class(dt8$precision)=="character") dt8$precision <-as.numeric(dt8$precision)
# 
# # Convert Missing Values to NA for non-dates
# 
# dt8$value <- ifelse((trimws(as.character(dt8$value))==trimws("NA")),NA,dt8$value)               
# suppressWarnings(dt8$value <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt8$value))==as.character(as.numeric("NA"))),NA,dt8$value))
# dt8$subgroup <- as.factor(ifelse((trimws(as.character(dt8$subgroup))==trimws("NA")),NA,as.character(dt8$subgroup)))
# dt8$units <- as.factor(ifelse((trimws(as.character(dt8$units))==trimws("NA")),NA,as.character(dt8$units)))
# dt8$datacoveragepct <- ifelse((trimws(as.character(dt8$datacoveragepct))==trimws("NA")),NA,dt8$datacoveragepct)               
# suppressWarnings(dt8$datacoveragepct <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt8$datacoveragepct))==as.character(as.numeric("NA"))),NA,dt8$datacoveragepct))
# 
# 
# # Here is the structure of the input data frame:
# str(dt8)                            
# attach(dt8)                            
# # The analyses below are basic descriptions of the variables. After testing, they should be replaced.                 
# 
# summary(zoneid)
# summary(variable_name)
# summary(value)
# summary(spatial_division)
# summary(main_feature)
# summary(subgroup)
# summary(units)
# summary(datacoveragepct)
# summary(precision) 
# # Get more details on character variables
# 
# summary(as.factor(dt8$zoneid)) 
# summary(as.factor(dt8$variable_name)) 
# summary(as.factor(dt8$spatial_division)) 
# summary(as.factor(dt8$main_feature)) 
# summary(as.factor(dt8$subgroup)) 
# summary(as.factor(dt8$units))
# detach(dt8)               
# 
# 
# inUrl9  <- "https://pasta.lternet.edu/package/data/eml/edi/1136/2/19c2d9c80e3510acac909786879f3ed2" 
# infile9 <- tempfile()
# try(download.file(inUrl9,infile9,method="curl"))
# if (is.na(file.size(infile9))) download.file(inUrl9,infile9,method="auto")
# 
# 
# dt9 <-read.csv(infile9,header=F 
#                ,sep=","  
#                ,quot='"' 
#                , col.names=c(
#                  "zoneid",     
#                  "variable_name",     
#                  "value",     
#                  "spatial_division",     
#                  "main_feature",     
#                  "subgroup",     
#                  "units",     
#                  "precision"    ), check.names=TRUE)
# 
# unlink(infile9)
# 
# # Fix any interval or ratio columns mistakenly read in as nominal and nominal columns read as numeric or dates read as strings
# 
# if (class(dt9$zoneid)!="factor") dt9$zoneid<- as.factor(dt9$zoneid)
# if (class(dt9$variable_name)!="factor") dt9$variable_name<- as.factor(dt9$variable_name)
# if (class(dt9$value)=="factor") dt9$value <-as.numeric(levels(dt9$value))[as.integer(dt9$value) ]               
# if (class(dt9$value)=="character") dt9$value <-as.numeric(dt9$value)
# if (class(dt9$spatial_division)!="factor") dt9$spatial_division<- as.factor(dt9$spatial_division)
# if (class(dt9$main_feature)!="factor") dt9$main_feature<- as.factor(dt9$main_feature)
# if (class(dt9$subgroup)!="factor") dt9$subgroup<- as.factor(dt9$subgroup)
# if (class(dt9$units)!="factor") dt9$units<- as.factor(dt9$units)
# if (class(dt9$precision)=="factor") dt9$precision <-as.numeric(levels(dt9$precision))[as.integer(dt9$precision) ]               
# if (class(dt9$precision)=="character") dt9$precision <-as.numeric(dt9$precision)
# 
# # Convert Missing Values to NA for non-dates
# 
# dt9$value <- ifelse((trimws(as.character(dt9$value))==trimws("NA")),NA,dt9$value)               
# suppressWarnings(dt9$value <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt9$value))==as.character(as.numeric("NA"))),NA,dt9$value))
# dt9$subgroup <- as.factor(ifelse((trimws(as.character(dt9$subgroup))==trimws("NA")),NA,as.character(dt9$subgroup)))
# dt9$units <- as.factor(ifelse((trimws(as.character(dt9$units))==trimws("NA")),NA,as.character(dt9$units)))
# 
# 
# # Here is the structure of the input data frame:
# str(dt9)                            
# attach(dt9)                            
# # The analyses below are basic descriptions of the variables. After testing, they should be replaced.                 
# 
# summary(zoneid)
# summary(variable_name)
# summary(value)
# summary(spatial_division)
# summary(main_feature)
# summary(subgroup)
# summary(units)
# summary(precision) 
# # Get more details on character variables
# 
# summary(as.factor(dt9$zoneid)) 
# summary(as.factor(dt9$variable_name)) 
# summary(as.factor(dt9$spatial_division)) 
# summary(as.factor(dt9$main_feature)) 
# summary(as.factor(dt9$subgroup)) 
# summary(as.factor(dt9$units))
# detach(dt9)               


inUrl10  <- "https://pasta.lternet.edu/package/data/eml/edi/1136/2/d3e430bc9695084b28cbb86dd6d1b4ab" 
infile10 <- tempfile()
try(download.file(inUrl10,infile10,method="curl"))
if (is.na(file.size(infile10))) download.file(inUrl10,infile10,method="auto")


dt10 <-read.csv(infile10,header=F 
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

if (class(dt10$zoneid)!="factor") dt10$zoneid<- as.factor(dt10$zoneid)
if (class(dt10$spatial_division)!="factor") dt10$spatial_division<- as.factor(dt10$spatial_division)
if (class(dt10$year)=="factor") dt10$year <-as.numeric(levels(dt10$year))[as.integer(dt10$year) ]               
if (class(dt10$year)=="character") dt10$year <-as.numeric(dt10$year)
if (class(dt10$datacoveragepct)=="factor") dt10$datacoveragepct <-as.numeric(levels(dt10$datacoveragepct))[as.integer(dt10$datacoveragepct) ]               
if (class(dt10$datacoveragepct)=="character") dt10$datacoveragepct <-as.numeric(dt10$datacoveragepct)
if (class(dt10$precision)=="factor") dt10$precision <-as.numeric(levels(dt10$precision))[as.integer(dt10$precision) ]               
if (class(dt10$precision)=="character") dt10$precision <-as.numeric(dt10$precision)
if (class(dt10$nlcd_barren31_pct)=="factor") dt10$nlcd_barren31_pct <-as.numeric(levels(dt10$nlcd_barren31_pct))[as.integer(dt10$nlcd_barren31_pct) ]               
if (class(dt10$nlcd_barren31_pct)=="character") dt10$nlcd_barren31_pct <-as.numeric(dt10$nlcd_barren31_pct)
if (class(dt10$nlcd_cultcrop82_pct)=="factor") dt10$nlcd_cultcrop82_pct <-as.numeric(levels(dt10$nlcd_cultcrop82_pct))[as.integer(dt10$nlcd_cultcrop82_pct) ]               
if (class(dt10$nlcd_cultcrop82_pct)=="character") dt10$nlcd_cultcrop82_pct <-as.numeric(dt10$nlcd_cultcrop82_pct)
if (class(dt10$nlcd_devhi24_pct)=="factor") dt10$nlcd_devhi24_pct <-as.numeric(levels(dt10$nlcd_devhi24_pct))[as.integer(dt10$nlcd_devhi24_pct) ]               
if (class(dt10$nlcd_devhi24_pct)=="character") dt10$nlcd_devhi24_pct <-as.numeric(dt10$nlcd_devhi24_pct)
if (class(dt10$nlcd_devlow22_pct)=="factor") dt10$nlcd_devlow22_pct <-as.numeric(levels(dt10$nlcd_devlow22_pct))[as.integer(dt10$nlcd_devlow22_pct) ]               
if (class(dt10$nlcd_devlow22_pct)=="character") dt10$nlcd_devlow22_pct <-as.numeric(dt10$nlcd_devlow22_pct)
if (class(dt10$nlcd_devmed23_pct)=="factor") dt10$nlcd_devmed23_pct <-as.numeric(levels(dt10$nlcd_devmed23_pct))[as.integer(dt10$nlcd_devmed23_pct) ]               
if (class(dt10$nlcd_devmed23_pct)=="character") dt10$nlcd_devmed23_pct <-as.numeric(dt10$nlcd_devmed23_pct)
if (class(dt10$nlcd_devopen21_pct)=="factor") dt10$nlcd_devopen21_pct <-as.numeric(levels(dt10$nlcd_devopen21_pct))[as.integer(dt10$nlcd_devopen21_pct) ]               
if (class(dt10$nlcd_devopen21_pct)=="character") dt10$nlcd_devopen21_pct <-as.numeric(dt10$nlcd_devopen21_pct)
if (class(dt10$nlcd_forcon42_pct)=="factor") dt10$nlcd_forcon42_pct <-as.numeric(levels(dt10$nlcd_forcon42_pct))[as.integer(dt10$nlcd_forcon42_pct) ]               
if (class(dt10$nlcd_forcon42_pct)=="character") dt10$nlcd_forcon42_pct <-as.numeric(dt10$nlcd_forcon42_pct)
if (class(dt10$nlcd_fordec41_pct)=="factor") dt10$nlcd_fordec41_pct <-as.numeric(levels(dt10$nlcd_fordec41_pct))[as.integer(dt10$nlcd_fordec41_pct) ]               
if (class(dt10$nlcd_fordec41_pct)=="character") dt10$nlcd_fordec41_pct <-as.numeric(dt10$nlcd_fordec41_pct)
if (class(dt10$nlcd_formix43_pct)=="factor") dt10$nlcd_formix43_pct <-as.numeric(levels(dt10$nlcd_formix43_pct))[as.integer(dt10$nlcd_formix43_pct) ]               
if (class(dt10$nlcd_formix43_pct)=="character") dt10$nlcd_formix43_pct <-as.numeric(dt10$nlcd_formix43_pct)
if (class(dt10$nlcd_grass71_pct)=="factor") dt10$nlcd_grass71_pct <-as.numeric(levels(dt10$nlcd_grass71_pct))[as.integer(dt10$nlcd_grass71_pct) ]               
if (class(dt10$nlcd_grass71_pct)=="character") dt10$nlcd_grass71_pct <-as.numeric(dt10$nlcd_grass71_pct)
if (class(dt10$nlcd_icesnow12_pct)=="factor") dt10$nlcd_icesnow12_pct <-as.numeric(levels(dt10$nlcd_icesnow12_pct))[as.integer(dt10$nlcd_icesnow12_pct) ]               
if (class(dt10$nlcd_icesnow12_pct)=="character") dt10$nlcd_icesnow12_pct <-as.numeric(dt10$nlcd_icesnow12_pct)
if (class(dt10$nlcd_openwater11_pct)=="factor") dt10$nlcd_openwater11_pct <-as.numeric(levels(dt10$nlcd_openwater11_pct))[as.integer(dt10$nlcd_openwater11_pct) ]               
if (class(dt10$nlcd_openwater11_pct)=="character") dt10$nlcd_openwater11_pct <-as.numeric(dt10$nlcd_openwater11_pct)
if (class(dt10$nlcd_past81_pct)=="factor") dt10$nlcd_past81_pct <-as.numeric(levels(dt10$nlcd_past81_pct))[as.integer(dt10$nlcd_past81_pct) ]               
if (class(dt10$nlcd_past81_pct)=="character") dt10$nlcd_past81_pct <-as.numeric(dt10$nlcd_past81_pct)
if (class(dt10$nlcd_shrub52_pct)=="factor") dt10$nlcd_shrub52_pct <-as.numeric(levels(dt10$nlcd_shrub52_pct))[as.integer(dt10$nlcd_shrub52_pct) ]               
if (class(dt10$nlcd_shrub52_pct)=="character") dt10$nlcd_shrub52_pct <-as.numeric(dt10$nlcd_shrub52_pct)
if (class(dt10$nlcd_wetemerg95_pct)=="factor") dt10$nlcd_wetemerg95_pct <-as.numeric(levels(dt10$nlcd_wetemerg95_pct))[as.integer(dt10$nlcd_wetemerg95_pct) ]               
if (class(dt10$nlcd_wetemerg95_pct)=="character") dt10$nlcd_wetemerg95_pct <-as.numeric(dt10$nlcd_wetemerg95_pct)
if (class(dt10$nlcd_wetwood90_pct)=="factor") dt10$nlcd_wetwood90_pct <-as.numeric(levels(dt10$nlcd_wetwood90_pct))[as.integer(dt10$nlcd_wetwood90_pct) ]               
if (class(dt10$nlcd_wetwood90_pct)=="character") dt10$nlcd_wetwood90_pct <-as.numeric(dt10$nlcd_wetwood90_pct)

# Convert Missing Values to NA for non-dates

dt10$nlcd_barren31_pct <- ifelse((trimws(as.character(dt10$nlcd_barren31_pct))==trimws("NA")),NA,dt10$nlcd_barren31_pct)               
suppressWarnings(dt10$nlcd_barren31_pct <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt10$nlcd_barren31_pct))==as.character(as.numeric("NA"))),NA,dt10$nlcd_barren31_pct))
dt10$nlcd_cultcrop82_pct <- ifelse((trimws(as.character(dt10$nlcd_cultcrop82_pct))==trimws("NA")),NA,dt10$nlcd_cultcrop82_pct)               
suppressWarnings(dt10$nlcd_cultcrop82_pct <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt10$nlcd_cultcrop82_pct))==as.character(as.numeric("NA"))),NA,dt10$nlcd_cultcrop82_pct))
dt10$nlcd_devhi24_pct <- ifelse((trimws(as.character(dt10$nlcd_devhi24_pct))==trimws("NA")),NA,dt10$nlcd_devhi24_pct)               
suppressWarnings(dt10$nlcd_devhi24_pct <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt10$nlcd_devhi24_pct))==as.character(as.numeric("NA"))),NA,dt10$nlcd_devhi24_pct))
dt10$nlcd_devlow22_pct <- ifelse((trimws(as.character(dt10$nlcd_devlow22_pct))==trimws("NA")),NA,dt10$nlcd_devlow22_pct)               
suppressWarnings(dt10$nlcd_devlow22_pct <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt10$nlcd_devlow22_pct))==as.character(as.numeric("NA"))),NA,dt10$nlcd_devlow22_pct))
dt10$nlcd_devmed23_pct <- ifelse((trimws(as.character(dt10$nlcd_devmed23_pct))==trimws("NA")),NA,dt10$nlcd_devmed23_pct)               
suppressWarnings(dt10$nlcd_devmed23_pct <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt10$nlcd_devmed23_pct))==as.character(as.numeric("NA"))),NA,dt10$nlcd_devmed23_pct))
dt10$nlcd_devopen21_pct <- ifelse((trimws(as.character(dt10$nlcd_devopen21_pct))==trimws("NA")),NA,dt10$nlcd_devopen21_pct)               
suppressWarnings(dt10$nlcd_devopen21_pct <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt10$nlcd_devopen21_pct))==as.character(as.numeric("NA"))),NA,dt10$nlcd_devopen21_pct))
dt10$nlcd_forcon42_pct <- ifelse((trimws(as.character(dt10$nlcd_forcon42_pct))==trimws("NA")),NA,dt10$nlcd_forcon42_pct)               
suppressWarnings(dt10$nlcd_forcon42_pct <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt10$nlcd_forcon42_pct))==as.character(as.numeric("NA"))),NA,dt10$nlcd_forcon42_pct))
dt10$nlcd_fordec41_pct <- ifelse((trimws(as.character(dt10$nlcd_fordec41_pct))==trimws("NA")),NA,dt10$nlcd_fordec41_pct)               
suppressWarnings(dt10$nlcd_fordec41_pct <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt10$nlcd_fordec41_pct))==as.character(as.numeric("NA"))),NA,dt10$nlcd_fordec41_pct))
dt10$nlcd_formix43_pct <- ifelse((trimws(as.character(dt10$nlcd_formix43_pct))==trimws("NA")),NA,dt10$nlcd_formix43_pct)               
suppressWarnings(dt10$nlcd_formix43_pct <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt10$nlcd_formix43_pct))==as.character(as.numeric("NA"))),NA,dt10$nlcd_formix43_pct))
dt10$nlcd_grass71_pct <- ifelse((trimws(as.character(dt10$nlcd_grass71_pct))==trimws("NA")),NA,dt10$nlcd_grass71_pct)               
suppressWarnings(dt10$nlcd_grass71_pct <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt10$nlcd_grass71_pct))==as.character(as.numeric("NA"))),NA,dt10$nlcd_grass71_pct))
dt10$nlcd_icesnow12_pct <- ifelse((trimws(as.character(dt10$nlcd_icesnow12_pct))==trimws("NA")),NA,dt10$nlcd_icesnow12_pct)               
suppressWarnings(dt10$nlcd_icesnow12_pct <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt10$nlcd_icesnow12_pct))==as.character(as.numeric("NA"))),NA,dt10$nlcd_icesnow12_pct))
dt10$nlcd_openwater11_pct <- ifelse((trimws(as.character(dt10$nlcd_openwater11_pct))==trimws("NA")),NA,dt10$nlcd_openwater11_pct)               
suppressWarnings(dt10$nlcd_openwater11_pct <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt10$nlcd_openwater11_pct))==as.character(as.numeric("NA"))),NA,dt10$nlcd_openwater11_pct))
dt10$nlcd_past81_pct <- ifelse((trimws(as.character(dt10$nlcd_past81_pct))==trimws("NA")),NA,dt10$nlcd_past81_pct)               
suppressWarnings(dt10$nlcd_past81_pct <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt10$nlcd_past81_pct))==as.character(as.numeric("NA"))),NA,dt10$nlcd_past81_pct))
dt10$nlcd_shrub52_pct <- ifelse((trimws(as.character(dt10$nlcd_shrub52_pct))==trimws("NA")),NA,dt10$nlcd_shrub52_pct)               
suppressWarnings(dt10$nlcd_shrub52_pct <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt10$nlcd_shrub52_pct))==as.character(as.numeric("NA"))),NA,dt10$nlcd_shrub52_pct))
dt10$nlcd_wetemerg95_pct <- ifelse((trimws(as.character(dt10$nlcd_wetemerg95_pct))==trimws("NA")),NA,dt10$nlcd_wetemerg95_pct)               
suppressWarnings(dt10$nlcd_wetemerg95_pct <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt10$nlcd_wetemerg95_pct))==as.character(as.numeric("NA"))),NA,dt10$nlcd_wetemerg95_pct))
dt10$nlcd_wetwood90_pct <- ifelse((trimws(as.character(dt10$nlcd_wetwood90_pct))==trimws("NA")),NA,dt10$nlcd_wetwood90_pct)               
suppressWarnings(dt10$nlcd_wetwood90_pct <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt10$nlcd_wetwood90_pct))==as.character(as.numeric("NA"))),NA,dt10$nlcd_wetwood90_pct))


# Here is the structure of the input data frame:
str(dt10)                            
attach(dt10)                            
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

summary(as.factor(dt10$zoneid)) 
summary(as.factor(dt10$spatial_division))
detach(dt10)               


# inUrl11  <- "https://pasta.lternet.edu/package/data/eml/edi/1136/2/0da723b692f2b549a1cdb769eaa2dc3e" 
# infile11 <- tempfile()
# try(download.file(inUrl11,infile11,method="curl"))
# if (is.na(file.size(infile11))) download.file(inUrl11,infile11,method="auto")
# 
# 
# dt11 <-read.csv(infile11,header=F 
#                 ,sep=","  
#                 ,quot='"' 
#                 , col.names=c(
#                   "zoneid",     
#                   "variable_name",     
#                   "value",     
#                   "spatial_division",     
#                   "main_feature",     
#                   "subgroup",     
#                   "units",     
#                   "datacoveragepct",     
#                   "precision"    ), check.names=TRUE)
# 
# unlink(infile11)
# 
# # Fix any interval or ratio columns mistakenly read in as nominal and nominal columns read as numeric or dates read as strings
# 
# if (class(dt11$zoneid)!="factor") dt11$zoneid<- as.factor(dt11$zoneid)
# if (class(dt11$variable_name)!="factor") dt11$variable_name<- as.factor(dt11$variable_name)
# if (class(dt11$value)=="factor") dt11$value <-as.numeric(levels(dt11$value))[as.integer(dt11$value) ]               
# if (class(dt11$value)=="character") dt11$value <-as.numeric(dt11$value)
# if (class(dt11$spatial_division)!="factor") dt11$spatial_division<- as.factor(dt11$spatial_division)
# if (class(dt11$main_feature)!="factor") dt11$main_feature<- as.factor(dt11$main_feature)
# if (class(dt11$subgroup)!="factor") dt11$subgroup<- as.factor(dt11$subgroup)
# if (class(dt11$units)!="factor") dt11$units<- as.factor(dt11$units)
# if (class(dt11$datacoveragepct)=="factor") dt11$datacoveragepct <-as.numeric(levels(dt11$datacoveragepct))[as.integer(dt11$datacoveragepct) ]               
# if (class(dt11$datacoveragepct)=="character") dt11$datacoveragepct <-as.numeric(dt11$datacoveragepct)
# if (class(dt11$precision)=="factor") dt11$precision <-as.numeric(levels(dt11$precision))[as.integer(dt11$precision) ]               
# if (class(dt11$precision)=="character") dt11$precision <-as.numeric(dt11$precision)
# 
# # Convert Missing Values to NA for non-dates
# 
# dt11$value <- ifelse((trimws(as.character(dt11$value))==trimws("NA")),NA,dt11$value)               
# suppressWarnings(dt11$value <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt11$value))==as.character(as.numeric("NA"))),NA,dt11$value))
# dt11$subgroup <- as.factor(ifelse((trimws(as.character(dt11$subgroup))==trimws("NA")),NA,as.character(dt11$subgroup)))
# dt11$units <- as.factor(ifelse((trimws(as.character(dt11$units))==trimws("NA")),NA,as.character(dt11$units)))
# dt11$datacoveragepct <- ifelse((trimws(as.character(dt11$datacoveragepct))==trimws("NA")),NA,dt11$datacoveragepct)               
# suppressWarnings(dt11$datacoveragepct <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt11$datacoveragepct))==as.character(as.numeric("NA"))),NA,dt11$datacoveragepct))
# 
# 
# # Here is the structure of the input data frame:
# str(dt11)                            
# attach(dt11)                            
# # The analyses below are basic descriptions of the variables. After testing, they should be replaced.                 
# 
# summary(zoneid)
# summary(variable_name)
# summary(value)
# summary(spatial_division)
# summary(main_feature)
# summary(subgroup)
# summary(units)
# summary(datacoveragepct)
# summary(precision) 
# # Get more details on character variables
# 
# summary(as.factor(dt11$zoneid)) 
# summary(as.factor(dt11$variable_name)) 
# summary(as.factor(dt11$spatial_division)) 
# summary(as.factor(dt11$main_feature)) 
# summary(as.factor(dt11$subgroup)) 
# summary(as.factor(dt11$units))
# detach(dt11)               
# 
# 
# inUrl12  <- "https://pasta.lternet.edu/package/data/eml/edi/1136/2/d0f22666b92a1e83cafa6f2d5014b52b" 
# infile12 <- tempfile()
# try(download.file(inUrl12,infile12,method="curl"))
# if (is.na(file.size(infile12))) download.file(inUrl12,infile12,method="auto")
# 
# 
# dt12 <-read.csv(infile12,header=F 
#                 ,sep=","  
#                 ,quot='"' 
#                 , col.names=c(
#                   "zoneid",     
#                   "variable_name",     
#                   "value",     
#                   "spatial_division",     
#                   "main_feature",     
#                   "subgroup",     
#                   "units",     
#                   "datacoveragepct",     
#                   "precision"    ), check.names=TRUE)
# 
# unlink(infile12)
# 
# # Fix any interval or ratio columns mistakenly read in as nominal and nominal columns read as numeric or dates read as strings
# 
# if (class(dt12$zoneid)!="factor") dt12$zoneid<- as.factor(dt12$zoneid)
# if (class(dt12$variable_name)!="factor") dt12$variable_name<- as.factor(dt12$variable_name)
# if (class(dt12$value)=="factor") dt12$value <-as.numeric(levels(dt12$value))[as.integer(dt12$value) ]               
# if (class(dt12$value)=="character") dt12$value <-as.numeric(dt12$value)
# if (class(dt12$spatial_division)!="factor") dt12$spatial_division<- as.factor(dt12$spatial_division)
# if (class(dt12$main_feature)!="factor") dt12$main_feature<- as.factor(dt12$main_feature)
# if (class(dt12$subgroup)!="factor") dt12$subgroup<- as.factor(dt12$subgroup)
# if (class(dt12$units)!="factor") dt12$units<- as.factor(dt12$units)
# if (class(dt12$datacoveragepct)=="factor") dt12$datacoveragepct <-as.numeric(levels(dt12$datacoveragepct))[as.integer(dt12$datacoveragepct) ]               
# if (class(dt12$datacoveragepct)=="character") dt12$datacoveragepct <-as.numeric(dt12$datacoveragepct)
# if (class(dt12$precision)=="factor") dt12$precision <-as.numeric(levels(dt12$precision))[as.integer(dt12$precision) ]               
# if (class(dt12$precision)=="character") dt12$precision <-as.numeric(dt12$precision)
# 
# # Convert Missing Values to NA for non-dates
# 
# dt12$value <- ifelse((trimws(as.character(dt12$value))==trimws("NA")),NA,dt12$value)               
# suppressWarnings(dt12$value <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt12$value))==as.character(as.numeric("NA"))),NA,dt12$value))
# dt12$subgroup <- as.factor(ifelse((trimws(as.character(dt12$subgroup))==trimws("NA")),NA,as.character(dt12$subgroup)))
# dt12$units <- as.factor(ifelse((trimws(as.character(dt12$units))==trimws("NA")),NA,as.character(dt12$units)))
# dt12$datacoveragepct <- ifelse((trimws(as.character(dt12$datacoveragepct))==trimws("NA")),NA,dt12$datacoveragepct)               
# suppressWarnings(dt12$datacoveragepct <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt12$datacoveragepct))==as.character(as.numeric("NA"))),NA,dt12$datacoveragepct))
# 
# 
# # Here is the structure of the input data frame:
# str(dt12)                            
# attach(dt12)                            
# # The analyses below are basic descriptions of the variables. After testing, they should be replaced.                 
# 
# summary(zoneid)
# summary(variable_name)
# summary(value)
# summary(spatial_division)
# summary(main_feature)
# summary(subgroup)
# summary(units)
# summary(datacoveragepct)
# summary(precision) 
# # Get more details on character variables
# 
# summary(as.factor(dt12$zoneid)) 
# summary(as.factor(dt12$variable_name)) 
# summary(as.factor(dt12$spatial_division)) 
# summary(as.factor(dt12$main_feature)) 
# summary(as.factor(dt12$subgroup)) 
# summary(as.factor(dt12$units))
# detach(dt12)               

climate_data <- dt6 
rm(dt6)

landcover_data <- dt10
rm(dt10)

saveRDS(climate_data, 'Data/climate_data.RDS')
saveRDS(landcover_data, 'Data/landcover_data.RDS')
