```R
# This code attempts to subset a data frame using a character vector of column names,
# but it fails when a column name does not exist.

df <- data.frame(A = 1:3, B = 4:6, C = 7:9)
cols_to_subset <- c("A", "B", "D")  # 'D' doesn't exist
subset_df <- df[, cols_to_subset]
```