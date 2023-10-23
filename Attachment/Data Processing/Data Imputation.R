library(dplyr)
library(lubridate)

df = read.csv('0 Maintenance_Total - 上一次进店数据.csv')
str(df)

# PurchaseDate
date_counts <- table(df$PurchaseDate)
na_rows <- is.na(df$PurchaseDate)
replacement_values <- sample(names(date_counts), sum(na_rows), replace = TRUE, prob = date_counts)
df$PurchaseDate[na_rows] <- replacement_values

# EntryDate
date_counts2 <- table(df$EntryDate)
na_rows2 <- is.na(df$EntryDate)
replacement_values2 <- sample(names(date_counts2), sum(na_rows2), replace = TRUE, prob = date_counts2)
df$EntryDate[na_rows2] <- replacement_values2

# Mileage
date_counts3 <- table(df$Mileage)
na_rows3 <- is.na(df$Mileage)
replacement_values3 <- sample(names(date_counts3), sum(na_rows3), replace = TRUE, prob = date_counts3)
df$Mileage[na_rows3] <- replacement_values3

# Age
date_counts4 <- table(df$VehicleAge)
na_rows4 <- is.na(df$VehicleAge)
replacement_values4 <- sample(names(date_counts4), sum(na_rows4), replace = TRUE, prob = date_counts4)
df$VehicleAge[na_rows4] <- replacement_values4

tail(df)

write.csv(df, "0 Maintenance_Total - instore Regular 全补.csv", row.names = FALSE)
