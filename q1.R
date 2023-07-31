# Number of random Strings to be created:
num_strings <- 1000
random_strings <- randomStrings(n = num_strings, len = 10) # Generating Random strings of length 10

# File that will contain the random Strings:
file_name <- "Q1.txt"

# Writing the random strings to the file
writeLines(random_strings, con = file_name)