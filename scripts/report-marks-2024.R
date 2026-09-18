## Report mark moderation and distribution
## Andy Wills,  GPL 3
rm(list=ls())

## Load packages
library(tools)
library(tidyverse)

## Load marks
markers  <- list.files('scripts/main-marks-520')

marks  <- NULL
for (this.marker in markers) {
    tmp  <- read_csv(paste0("scripts/main-marks-520/",this.marker))
    marker  <- file_path_sans_ext(this.marker)
    tmp  <- cbind(marker, tmp)
    print(this.marker)
    marks  <- rbind(marks, tmp)
}

write_csv(marks, "report-scores-2024.csv")

## Check/clean data

# Nomi used one 6, I changed to a 5. 

length(unique(marks$Component)) ## Should be 25 different components
## (#16 missing from mark sheet)
unique(marks$Component)
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
mean(cmp.markers$mean) # 3.43
sd(cmp.markers$mean) # 0.14 

## To two d.p., most markers have an average mark that is close to one s.d. of the other
## markers' average marks (3.29-3.57).

## The exception was:

## STalbot (3.77, N=25) - Spencer was in the middle of the disribution on 
## pre-moderation. And he has a range of marks from 2.96 (OK) to 4.36 (good /
## excellent). 


scores %>% filter(marker == "STalbot") %>% arrange(score) %>% print(n=Inf)
scores %>% filter(marker == "RStatton") %>% arrange(score) %>% print(n=Inf)

## Now look at score distribution
hist(scores$score)
mean(scores$score) # 3.4 - Down .2 from 2022, pretty stable
sd(scores$score) # 0.6 - Down .1 from 2022, fairly stable
min(scores$score) # 1 - Lower than 2022 (1.7), but this is because of one unusually poor report
max(scores$score) # 4.8 - Same as last year, where highest mark as an A.

## Convert to mark, using the same thresholds as last two years

scores$mark <- 0

scores$mark[scores$score > .9] <- 15 ## Descriptively "poor": F-

scores$mark[scores$score > 1] <- 25 ## Descriptively "poor / patchy": F

scores$mark[scores$score > 1.1] <- 25 ## Descriptively "poor / patchy": F+

scores$mark[scores$score > 1.25] <- 42 ## Descriptively "mainly poor, some patchy": D-

scores$mark[scores$score > 1.5] <- 45 ## Descriptively "poor / patchy": D

scores$mark[scores$score > 1.75] <- 48 ## Descriptively "main patchy, some poor": D+

scores$mark[scores$score > 1.99] <- 52 ## Descriptively, patchy: C-

scores$mark[scores$score > 2.25 ] <- 55 ## Descriptively "more patchy than OK", letter: C

scores$mark[scores$score > 2.75 ] <- 58 ## Descrptively "Mainly OK, some patchy", letter: C+

scores$mark[scores$score > 3.25 ] <- 62 ## Descriptively "OK, some good", letter: B-

scores$mark[scores$score > 3.50] <- 65 ## Descriptively "OK/good", letter: B

scores$mark[scores$score > 3.99] <- 68 ## Descriptively "good", letter: B+

scores$mark[scores$score > 4.25] <- 77 ## Descriptively "mainly good, aspects
                                       ## of excellence", letter: A-

scores$mark[scores$score > 4.50] <- 88 ## Descriptively, more
                                       ## excellent than good. Letter: A

scores$mark[scores$score > 4.75] <- 100 ## Highest mark. Descriptively, mainly
                                        ## excellent. Letter: A+

## Resultant mean score
mean(scores$mark) # 62.9
sd(scores$mark)   #  8.0
nrow(scores)      # 261

## Resultant mark distribution
round(table(scores$mark) *100 / nrow(scores))

## No peg marks suggested this year, but in both of the last two years,
## correlations were very high to peg marks (r=.97), and means very similar
## (within 0.1%!)

## Load DLE grade book
dle <- read_csv("scripts/520dle-main.csv")

## Reduces 'scores' to required columns
grades  <- scores %>% ungroup %>% select(Identifier, mark, marker)

## Combinied by Identifier
full  <- full_join(dle, grades) 

View(full)
## Visual inspection (all seems OK)

## Where student did not submit, and hence we have NA as a mark, record mark as zero.
full$mark[is.na(full$mark)]  <- 0

## Copy across mark to correct column
full$Grade  <- full$mark

## Reduce to necessary columns
report  <- full %>% select(-mark, -marker)

## Clear feedback column
report$`Feedback comments`  <- ""

## Save out as CSV for upload to DLE
write_csv(report, "return520-report.csv")

## I also checked the written feedback on a sample of each of the 9
## markers. It was good, and pretty consistent across markers.

## Now, module review form
attempt <- report %>% filter(Grade != 0)
attempt %>% summarise(mean = mean(Grade), sd = sd(Grade), n = n())
round(table(attempt$Grade) * 100 / nrow(attempt))
