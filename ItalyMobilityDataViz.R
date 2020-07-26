load("italy_full.RData")
Italy_Mobility <- read_csv("Italy_Mobility_Report.csv")
Italy_Mobility$date <- as.Date(Italy_Mobility$date, "%m/%d/%y")
names(Italy_Mobility) <- sapply(strsplit(names(Italy_Mobility), "_percent_change_from_baseline"), `[[`, 1)

Italy_Mobility_long <- Italy_Mobility[,c(3,5:11)]
Italy_Mobility_long <- melt(Italy_Mobility_long, id.vars = c("sub_region_1", "date"))
names(Italy_Mobility[,6:11]) <- sapply(strsplit(names(Italy_Mobility[,6:11]), "_percent_change_from_baseline"), `[[`, 1)

ggplot(Italy_Mobility_long, aes(date, value, col = variable))+geom_line() + facet_wrap(.~sub_region_1)
