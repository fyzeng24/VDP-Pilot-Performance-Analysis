library(stringr)
library(dplyr)

setwd("D:/EBAC/EBA5001 Analytics Project Management/EBA1.5 APM Practice Module/Analysis")

# VIN Data Making
data = read.csv('Maintenance_Total.csv')

data$VIN <- sub("(.{3}).*(.{3})", "\\1**\\2", data$VIN)
data$VIN

# Extracting Engine Displacement
cartype = read.csv('5 Body_Engine_Type.csv')
pattern <- "\\d+\\.\\d+(T)?"
cartype$EngineDisplacement <- str_extract(cartype$Type, pattern)
head(cartype$EngineDisplacement,50)

cartype$EngineDisplacement <- ifelse(str_detect(cartype$EngineDisplacement, "\\d$"), 
                                 paste(cartype$EngineDisplacement, "T", sep = ""),
                                 cartype$EngineDisplacement)

write.csv(cartype, "Body_Engine_Type", row.names = FALSE)

# Calculate Vehicle Age
mt = read.csv('0_Maintainance_Total_addAge.csv')
str(mt)
mt$EntryDate <- as.Date(mt$EntryDate, format = "%Y-%m-%d")
mt$LeadSolicitationDate <- as.Date(mt$LeadSolicitationDate, format = "%Y-%m-%d")
mt$PurchaseDate <- as.Date(mt$PurchaseDate, format = "%Y-%m-%d")
mt <- mutate(mt, VehicleAge = round(as.numeric(difftime(EntryDate, PurchaseDate, units = "days")) / 365, 2))
head(mt,6)
write.csv(mt, "0_Maintainance_Total_addAge2.csv", row.names = FALSE)



