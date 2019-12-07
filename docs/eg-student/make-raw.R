library(tidyverse)

## Load data from Seabrooke et al. (2019) Experiment 1
data <- read_csv("PLY113longData.csv")
data$Condition[is.na(data$Condition)] <- "none"

recall <- data %>%
    filter(Group == "Recall") %>%
    filter(Running %in% c("Study", "Meaning", "Recall"))  %>%
    filter(Condition != "First Word") %>%
    filter(Condition != "Foil")

recall$Subject[recall$Subject == 2] <- "92"

count <- 0
for(subj in unique(recall$Subject)) {
    count <- count + 1
    if(count > 25) break
    print(subj)
    onesub <- recall %>% filter(Subject == subj) %>% select(-Subject, -WordType)
    fnam <-  paste0("eg-data/subj-", subj, ".csv")
    write_csv(onesub, fnam)
}
