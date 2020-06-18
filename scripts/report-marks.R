## Presentation mark moderation and distribution
## Andy Wills,  GPL 3
rm(list=ls())

## Load packages
library(tools)
library(tidyverse)

## Load marks
markers  <- list.files('main-marks-520')

marks  <- NULL
for (this.marker in markers) {
    tmp  <- read_csv(paste0("main-marks-520/",this.marker))
    marker  <- file_path_sans_ext(this.marker)
    tmp  <- cbind(marker, tmp)
    print(this.marker)
    marks  <- rbind(marks, tmp)
}

write_csv(marks, "report-scores.csv")

## Check/clean data
length(unique(marks$Component)) ## Should be 26 different components
unique(marks$Score) ## Valid scores

## Check we have the right number of components for each student
chk  <- table(marks$Identifier)
max(chk)
min(chk)

## Calculate overall scores
scores <- marks %>% group_by(marker, Identifier) %>% summarise(score = mean(Score))

## Compare markers on summary stats
cmp.markers  <- scores %>% group_by(marker) %>%
    summarise(        
        N = n(),
        mean = mean(score),
        sd = sd(score)) %>%
    arrange(mean)
print(cmp.markers)
boxplot(cmp.markers$mean)
mean(cmp.markers$mean) 
sd(cmp.markers$mean) 

## If a marker is more than one s.d. away from the overall mean of markers,
## make the smallest adjustment to their scores that brings them within that
## range.

## scores$score[scores$marker == "CAmerica"]  <- scores$score[scores$marker == "CAmerica"] - .25

## Now look at score distribution
hist(scores$score)
mean(scores$score) 
sd(scores$score) 
min(scores$score) 
max(scores$score) 

## Convert to mark, using the same/similar thresholds as presentations
## Also, consistency with suggested marks from markers

scores$mark <- 0

scores$mark[scores$score > 1.5] <- 45 ## Descriptively "poor / patchy": D

scores$mark[scores$score > 1.75] <- 48 ## Descriptively "poor / patchy": D+

scores$mark[scores$score > 1.99] <- 52 ## Descriptively, patchy: C-

scores$mark[scores$score > 2.25 ] <- 55 ## Descriptively "more patchy than OK", letter: C

scores$mark[scores$score > 2.75 ] <- 58 ## Descrptively "Mainly OK, some patchy", letter: C+

scores$mark[scores$score > 3.25 ] <- 62 ## Descriptively "OK, some good", letter: B-

scores$mark[scores$score > 3.50] <- 65 ## Descriptively "OK/good", letter: B

scores$mark[scores$score > 3.99] <- 68 ## Descriptively "good", letter: B+

scores$mark[scores$score > 4.25] <- 77 ## Descriptively "mainly good, aspects
                                       ## of excellence", letter: A-

scores$mark[scores$score > 4.50] <- 88 ## Highest mark. Descriptively, more
                                       ## excellent than good. Letter: A

## Resultant mean score
mean(scores$mark)
## Resultant mark distribution
table(scores$mark)

## Check against peg marks suggested by markers
pegs  <- read_csv("pegs.csv")
cmp.pegs  <- left_join(pegs, scores, by = "Identifier")
cmp.pegs
cor(cmp.pegs$mark.x, cmp.pegs$mark.y) # Correlation 
mean(cmp.pegs$mark.x)
mean(cmp.pegs$mark.y) # Mean marks for pegs and scores

## Load DLE grade book
dle <- read_csv("520dle-main.csv")

## Reduces 'scores' to required columns
grades  <- scores %>% ungroup %>% select(Identifier, mark, marker)

## Combinied by Identifier
full  <- full_join(dle, grades) 

View(full)
## Visual inspection reveals two Participants who didn't actually submit
## anything (now corrected earlier in script)

## Where student did not submit, and hence we have NA as a mark, record mark as zero.
full$mark[is.na(full$mark)]  <- 0

## Apply mark penalties for reported infractions
full$mark[full$Identifier == "Participant 1"] ## 65
full$mark[full$Identifier == "Participant 1"]  <- 62

## Report no mark if academic offence suspected
full$mark[full$Identifier == "Participant 2"]  <- ""

## Copy across mark to correct column
full$Grade  <- full$mark

## Reduce to necessary columns
report  <- full %>% select(-mark, -marker)

## Clear feedback column
report$`Feedback comments`  <- ""

## Save out as CSV for upload to DLE
write_csv(report, "return520-report.csv")


