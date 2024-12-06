```R
# Improved code with error handling for missing columns

df <- data.frame(A = 1:3, B = 4:6, C = 7:9)
cols_to_subset <- c("A", "B", "D")

# Solution 1: Using %in% operator and selecting existing columns only
subset_df <- df[, cols_to_subset[cols_to_subset %in% names(df)]]

# Solution 2: Using tryCatch to handle errors
subset_df <- tryCatch(
  {
    df[, cols_to_subset]
  },
  error = function(e) {
    warning("Error subsetting data frame:", e$message)
    #Return a default or handle the error as needed.  For Example, return original df
    df
  }
)

# Solution 3: Check for column existence before subsetting
missing_cols <- setdiff(cols_to_subset, names(df))
if (length(missing_cols) > 0) {
  warning("Columns not found:", paste(missing_cols, collapse = ", "))
  # Proceed with subsetting only the existing columns
  subset_df <- df[, intersect(cols_to_subset, names(df))]
} else {
  subset_df <- df[, cols_to_subset]
}

print(subset_df)
```