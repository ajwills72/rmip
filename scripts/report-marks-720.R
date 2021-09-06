## Presentation mark moderation and distribution
## Andy Wills,  GPL 3
rm(list=ls())

## Load packages
library(tools)
library(tidyverse)

## Load marks
markers  <- list.files('main-marks-720')

marks  <- NULL
for (this.marker in markers) {
    tmp  <- read_csv(paste0("main-marks-720/",this.marker))
    marker  <- file_path_sans_ext(this.marker)
    tmp  <- cbind(marker, tmp)
    print(this.marker)
    marks  <- rbind(marks, tmp)
}

write_csv(marks, "report-scores-720.csv")

## Check/clean data
length(unique(marks$Component)) ## Should be 26 different components
unique(marks$Score) ## Valid scores

## Check we have the right number of components for each student
chk  <- table(marks$Identifier)
max(chk)
min(chk)
chk[chk < 26]

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

## The two markers are near identical in mean, and close in SD

## Now look at score distribution
hist(scores$score)
mean(scores$score) # 3.5 (Similar to last year: 3.6)
sd(scores$score) # 0.8 (Slightly higher than last year : 0.5)
min(scores$score) # 2.0 (Worse than last year: 2.7)
max(scores$score) # 4.9 (Better than last year: 4.5)

## Convert to mark, using the same thresholds as 520
## Marking criteria have already accounted for the higher standard expected
## And any mark below a 50 is a fail on this programme.

scores$mark <- 0

## Two lowest do not occur in this sample.
## scores$mark[scores$score > 1.5] <- 45 ## Descriptively "poor / patchy": D
## scores$mark[scores$score > 1.75] <- 48 ## Descriptively "poor / patchy": D+

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
sd(scores$mark)
## Resultant mark distribution
table(scores$mark)
length(scores$mark)

## Load DLE grade book
dle <- read_csv("720dle-main.csv")

## Reduces 'scores' to required columns
grades  <- scores %>% ungroup %>% select(Identifier, mark, marker)

## Combinied by Identifier
full  <- full_join(dle, grades) 

View(full)

## Where student did not submit, and hence we have NA as a mark, record mark as zero.
full$mark[is.na(full$mark)]  <- 0

## Copy across mark to correct column
full$Grade  <- full$mark

## Reduce to necessary columns
report  <- full %>% select(-mark, -marker)

## Clear feedback column
report$`Feedback comments`  <- ""

## Save out as CSV for upload to DLE
write_csv(report, "return720-report.csv")

## I also checked the written feedback on a sample of each of the 
## markers. It was good, and pretty consistent across markers.

## Now, module review form
report  <- read_csv("return720-report.csv")
report %>% filter(Grade != 0) %>% summarise(mean = mean(Grade), sd = sd(Grade), n = n())
table(report$Grade)
