
#--------------------------------------------------------------------#
# Clustering Analysis to investigate temporal patterns in lake color


# Load data and libraries ####
source('Data/Call_data.R')
source('Code/temporal_restriction.R')
library(tidyverse)
library(cluster)
library(factoextra)


# Prepare data ####
# pivot the data wider so that each year is a column and the values are associated with the median annual dominant wavelength
cluster <- temporal_med |>
  pivot_wider(names_from = year, values_from = ann_dWL) |>
  drop_na() # only 1102 lakes 


# format so that lagoslakeids are rownames
cluster <- as.data.frame(cluster)
rownames(cluster) <- cluster[,1]
cluster[,1] <- NULL  


# Choose K value ####

# Compute and plot wss for k = 2 to k = 10
k.max <- 10 # Maximal number of clusters
data <- cluster
wss <- sapply(1:k.max, 
              function(k){kmeans(data, k, nstart=10 )$tot.withinss})

plot(1:k.max, wss,
     type="b", pch = 19, frame = FALSE, 
     xlab="Number of clusters K",
     ylab="Total within-clusters sum of squares")


# Run kmeans ####
km <- kmeans(cluster, centers=4)
fviz_cluster(km, data = cluster) + theme_bw()


# Plotting ####
## prepare the data for plotting over time ####
uniqueclusters <- km$cluster
centroids <- as.data.frame(km$centers) |>
  tibble::rownames_to_column('cluster') |>
  pivot_longer(2:24, names_to = 'year', values_to = 'Centroid')|>
  mutate(year = as.numeric(year))

lakes_clust <- as.data.frame(cluster) |>
  tibble::rownames_to_column('lagoslakeid') |>
  bind_cols(uniqueclusters) |>
  pivot_longer(2:39, names_to = 'year', values_to = 'dWL') |>
  rename(cluster=2) |>
  mutate(year = as.numeric(year))

## plot ####
ggplot() +
  geom_line(lakes_clust, mapping=aes(year, dWL, group=lagoslakeid), 
            color='grey60') +
  geom_line(centroids, mapping=aes(year, Centroid, group=cluster), 
            color='black') +
  facet_wrap(.~cluster, labeller=label_both) +
  theme_classic() +
  theme(plot.caption = element_text(hjust=0)) 

## n in each cluster ####
km$size
