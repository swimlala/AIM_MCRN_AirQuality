bologna_full <- read_csv("~/Documents/ResearchCode/Air Quality COVID/bologna_full.csv")
bologna_rtresult <- read_csv("~/Documents/ResearchCode/Air Quality COVID/bologna_rtresult.csv")

bologna_full$Date <- as.Date(bologna_full$Date, "%m/%d/%y")
bologna_rtresult$Date <- bologna_rtresult$date
library(dplyr)
bologna_all <- left_join(bologna_full, bologna_rtresult)
write.csv(bologna_all, "bologna_airRT.csv") 
