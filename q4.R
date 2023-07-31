# Question 4

# Loading required libraries
library(ggplot2)

# Setting the seed for reproducibility
set.seed(42)

# Creating a random dataset with values between -100 and 100
rows <- 600
cols <- 15
random_dataset <- matrix(runif(rows * cols, min = -100, max = 100), nrow = rows, ncol = cols)

# Converting the matrix to a data frame
random_df <- as.data.frame(random_dataset)

# i) Plot Scatter graph between column 5 and 6
ggplot(random_df, aes(x = V5, y = V6)) +
  geom_point() +
  labs(title = "Scatter plot between Column 5 and Column 6",
       x = "Column 5", y = "Column 6")

# ii) Plot histogram of each column in a single graph
melted_df <- reshape2::melt(random_df)
ggplot(melted_df, aes(x = value)) +
  geom_histogram(binwidth = 5) +
  facet_wrap(~ variable, scales = "free") +
  labs(title = "Histogram of each column in a single graph")

# iii) Plot the box plot of each column in a single graph
ggplot(melted_df, aes(x = variable, y = value)) +
  geom_boxplot() +
  labs(title = "Box plot of each column in a single graph",
       x = "Columns", y = "Values")
