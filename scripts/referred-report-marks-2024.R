## Referred report marks
## Andy Wills,  GPL 3
rm(list=ls())

## Load packages
library(tools)
library(tidyverse)

## Load marks
markers  <- list.files('scripts/referred-report-marks-2024')

marks  <- NULL
for (this.marker in markers) {
    tmp  <- read_csv(paste0("scripts/referred-report-marks-2024/",this.marker))
    marker  <- file_path_sans_ext(this.marker)
    tmp  <- cbind(marker, tmp)
    print(this.marker)
    marks  <- rbind(marks, tmp)
}

## Check/clean data
length(unique(marks$Component)) ## Should be 25 different components
unique(marks$Score) ## Valid scores

## Check we have the right number of components for each student
chk  <- table(marks$Identifier)
max(chk)
min(chk)

## Calculate overall scores
scores <- marks %>% group_by(marker, Identifier) %>% summarise(score = mean(Score))

## Convert to mark, using the same thresholds as main submission

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

scores

## Return process for referrals is largely by hand from this point, due
## to limitations of university/Faculty systems

