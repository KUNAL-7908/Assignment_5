# Question 2

# Dimensions for the dataset:
row <- 100
col <- 30
#Random Dataset Generation with values between 0 to 200
random_dataset <- matrix(runif(row * col, min = 0, max = 1), nrow = row, ncol = col)
random_dataset <- 1 + round(random_dataset * 199)

# First few rows of the dataset:
print(head(random_dataset))

# a)
# Replacing values within the range [10, 60] with NA
random_dataset[random_dataset >= 10 & random_dataset <= 60] <- NA

# Printing the number of rows having missing values
count_missing_rows <- sum(apply(random_dataset, 1, function(row) any(is.na(row))))
print(count_missing_rows)

# b) Replacing NA values with column averages
column_averages <- colMeans(random_dataset, na.rm = TRUE)
random_dataset[is.na(random_dataset)] <- column_averages[rep(seq_len(ncol(random_dataset)), each = nrow(random_dataset))]

#c)  Calculating the Pearson correlation among all columns
correlation <- cor(random_dataset, use = "pairwise.complete.obs")

# Plotting the heatmap of the correlation matrix
library(ggplot2)
library(reshape2)

melted_correlation <- melt(correlation)
ggplot(data = melted_correlation, aes(x = Var1, y = Var2, fill = value)) +
  geom_tile() +
  scale_fill_gradient(low = "blue", high = "red") +
  theme_minimal() +
  labs(title = "Pearson Correlation Heatmap", x = "Columns", y = "Columns")

# Selecting the columns having correlation <= 0.7
selected_col <- colnames(correlation)[apply(correlation <= 0.7, 2, all)]
print(selected_col)

# d) Normalizing the dataset between 0 and 10
new_min <- 0
new_max <- 10

min <- min(random_dataset, na.rm = TRUE)
max <- max(random_dataset, na.rm = TRUE)

normalized <- ((random_dataset - min) / (max_value - min)) * (new_max - new_min) + new_min
print(normalized)

# e) Replacing values with 1 if value <= 0.5 else with 0
random_dataset <- ifelse(random_dataset <= 0.5, 1, 0)
print(random_dataset)