library(tidyverse)

## Load data from Seabrooke et al. (2019) Experiment 2
data <- read_csv("TPL2_LongData.csv")
data$Condition[is.na(data$Condition)] <- "none"

recall <- data %>%
    filter(Running %in% c("Study", "Meaning", "Recall"))  %>%
    filter(Condition != "First Word") 

recall$Subject[recall$Subject == 1] <- "91"
recall$Subject[recall$Subject == 2] <- "92"
recall$Subject[recall$Subject == 3] <- "93"

count <- 0
for(subj in unique(recall$Subject)) {
    count <- count + 1
    if(count > 25) break
    print(subj)
    onesub <- recall %>% filter(Subject == subj) %>% select(-Subject)
    fnam <-  paste0("eg-data-2/subj-", subj, ".csv")
    write_csv(onesub, fnam)
}
