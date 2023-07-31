# Loading required libraries
library(stats)

# Setting seed for reproducibility
set.seed(42)

# Creating a random dataset with values between 5 and 10
rows <- 500
cols <- 5
random_dataset <- matrix(runif(rows * cols, min = 5, max = 10), nrow = rows, ncol = cols)

# Converting the matrix to a data frame
random_df <- as.data.frame(random_dataset)

# 1) Performing t-Test on each column
t_test_results <- lapply(random_df, function(col) {
  t.test(col, mu = 7.5)  # Assuming population mean is 7.5
})

# Printing t-Test results for each column
for (i in 1:cols) {
  col_name <- colnames(random_df)[i]
  print(paste("t-Test for Column", col_name))
  print(t_test_results[[i]])
}

# 2) Performing Wilcoxon Signed Rank Test on each column
wilcox_test_results <- lapply(random_df, function(col) {
  wilcox.test(col, mu = 7.5)  # Assuming population median is 7.5
})

# Printing Wilcoxon Signed Rank Test results for each column
for (i in 1:cols) {
  col_name <- colnames(random_df)[i]
  print(paste("Wilcoxon Signed Rank Test for Column", col_name))
  print(wilcox_test_results[[i]])
}

# 3) Performing Two-sample t-Test and Wilcoxon Rank Sum Test on column 3 and column 4
column3 <- random_df$V3
column4 <- random_df$V4

# Two-sample t-Test
t_test_3_4 <- t.test(column3, column4)

# Wilcoxon Rank Sum Test
wilcox_test_3_4 <- wilcox.test(column3, column4)

# Print Two-sample t-Test and Wilcoxon Rank Sum Test results
print("Two-sample t-Test between Column 3 and Column 4")
print(t_test_3_4)

print("Wilcoxon Rank Sum Test between Column 3 and Column 4")
print(wilcox_test_3_4)
