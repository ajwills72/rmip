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
## SDordoy - Had a component number "3.24" - fixed by hand

## CJones - Had a missing component #26 score for 11396867 - median score added by hand.
## Also, for SRN 10613655, had a different participant number for each component! Also corrected by hand

## RStatton - Still had the template in the returned file (lines 452-576) - removed by hand.

## ACaunt - "Particpant 11396848" should have been "Participant 11396848" -
## note missing 'i' - Corrected by hand

## KNedza - "Participant_X" should have been "Participant X" - no underscore (whole spreadsheet)

## SHartgen - "Participant_X" should have been "Participant X" - no underscore
## (25 occasions). Also "Paricipant" should have been "Participant" (25
## occasions). Also, as per my instructions, SRN 10608867 added as participant
## NA. I added as Participant 11396771 by hand - this was the student
## whose submission you received by email from me.

## TSchofield - Added "Participant 11396788" for 10577170 (submission via email) 


length(unique(marks$Component)) ## Should be 25 different components (#16 missing from mark sheet)
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
mean(cmp.markers$mean) # 3.4
sd(cmp.markers$mean) # 0.3 

## To one d.p., most markers have an average mark that is within one s.d. of the other
## markers' average marks (3.1-3.7).

## The exceptions are:

## RBaxter (3.04, N=22) Last year, Rory was towards the top of the
## distribution, so I don't think he's a habitual under-marker. Seems more
## likely he had a few uncharacteristically poor students this year - including
## 6 with <= 2.5 as a mean score. His own analysis points to this being a table effect
## i.e. he had a table which was uncharacteristically poor this year. Leave as is.

## ACaunt (3.9, N=26). New to marking this year. Substantially over other
## markers. I will make the smallest change possible to bring her within 1 s.d.
scores$score[scores$marker == "ACaunt"]  <- scores$score[scores$marker == "ACaunt"] - .22

## Now look at score distribution
hist(scores$score)
mean(scores$score) # 3.4
sd(scores$score) # 0.7
min(scores$score) # 1.7 - Identical to 2020, where we made this a D
max(scores$score) # 4.8 - Similar to 2020 (4.7), where highest mark as an A.

## Convert to mark, using the same thresholds as last year

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
sd(scores$mark)
nrow(scores)

## Resultant mark distribution
table(scores$mark)

## Check against peg marks suggested by markers
pegs  <- read_csv("pegs.csv")
cmp.pegs  <- left_join(pegs, scores, by = "Identifier")
cmp.pegs
cor(cmp.pegs$mark.x, cmp.pegs$mark.y) # Excellent correlation (r = .97!)
mean(cmp.pegs$mark.x) # 61.5%
mean(cmp.pegs$mark.y) # 61.4% - Mean marks very similar (within 0.1%!). 

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
## Three cases were reported. All were sufficiently minor that a warning
## rather than a mark penalty is more appropriate.
##  11396737, 11396861, 11396861

## Plagiarism?

## 11396934, 11396825 - Marker TSchofield suspected plagiarism, ML looked,
## does not meet threshold for plagiarism

## 11396843 - Marker KNedza, had vague plagiarism suspicisions due to
## inconsistency, but could not find clear evidence. Neither could ML. 

## Copy across mark to correct column
full$Grade  <- full$mark

## Reduce to necessary columns
report  <- full %>% select(-mark, -marker)

## Clear feedback column
report$`Feedback comments`  <- ""

## Save out as CSV for upload to DLE
write_csv(report, "return520-report.csv")

## I also checked the written feedback on a sample of each of the 12
## markers. It was good, and pretty consistent across markers.

## Now, module review form
report %>% filter(Grade != 0) %>% summarise(mean = mean(Grade), sd = sd(Grade), n = n())
table(report$Grade)
