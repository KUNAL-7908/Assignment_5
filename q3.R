# Question 3

# Loading required libraries
library(ggplot2)
library(cluster)
# Setting the seed for reproducibility
set.seed(42)

# Create a random dataset with specified ranges for columns
rows <- 500
cols <- 10

# Generate random values for columns 1 to 4 (-10 to 10)
cols_1to4 <- runif(rows * 4, min = -10, max = 10)

# Generate random values for columns 5 to 8 (10 to 20)
cols_5to8 <- runif(rows * 4, min = 10, max = 20)

# Generate random values for columns 9 to 10 (-100 to 100)
cols_9to10 <- runif(rows * 2, min = -100, max = 100)

# Combining all columns into the final dataset
random_dataset <- cbind(cols_1to4, cols_5to8, cols_9to10)

# i)  Applying K-Means clustering
kmeans_results <- lapply(1:10, function(k) {
  kmeans(random_dataset, centers = k)
})

# Extracting total within-cluster sum of squares for each clustering result
k_within <- sapply(kmeans_results, function(x) x$tot.withinss)

# Plotting distance metric graph for K-Means
ggplot(data.frame(K = 1:10, WithinSS = k_within), aes(x = K, y = WithinSS)) +
  geom_line() +
  geom_point() +
  labs(title = "K-Means Clustering - Elbow Method",
       x = "Number of Clusters (K)",
       y = "Within-Cluster Sum of Squares")

# ii) Applying Hierarchical clustering
hierarchical_clusters <- hclust(dist(random_dataset))

# Plotting distance metric graph for Hierarchical clustering 
ggdendrogram(hierarchical_clusters)
