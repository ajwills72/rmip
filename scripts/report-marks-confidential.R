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
chk[chk == 52]

## So, looks like someone has used the same identifier twice?
marks %>% filter(Identifier == "Participant 10735866")

## Nope, someone has used the wrong identifier

## Manual inspection of DLE indicates the culprit is Paul, who used 10735866 when he meant 10735886

marks$Identifier[marks$Identifier == "Participant 10735866" & marks$marker == "PSharpe"]  <-
    "Participant 10735886"

## Later on, I find two others (see end of script, but fixed here)

## Lenard  - Used SRN not participant number. Participant 10617928 ->  Participant 10747032
marks$Identifier[marks$Identifier == "Participant 10617928"]  <- "Participant 10747032"

## Saraj - Transposed digits in SRN. Participant 10747308 -> Participant 10747038
marks$Identifier[marks$Identifier == "Participant 10747308"]  <- "Participant 10747038"

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
sd(cmp.markers$mean) # 0.2 

## To one d.p., most markers have an average mark that is within one s.d. of the other
## markers' average marks (3.2-3.6).

## The exceptions are:

## JGriffin (3.1) - This is very close, and her N is quite small (13). No adjustment made.

## RBaxter (3.7) - Very close, with a small N (5). No adjustment made

## DDjama (3.9) - This is quite a long way out (.4 from the mean, and more than
## 2 s.d.) with a sample size as large as we're going to get. I will make the
## smallest change needed to bring her within one s.d.

scores$score[scores$marker == "DDjama"]  <- scores$score[scores$marker == "DDjama"] - .25

## Now look at score distribution
hist(scores$score)
mean(scores$score) # 3.4
sd(scores$score) # 0.6
min(scores$score) # 1.7 - Markers reported worst report was a D
max(scores$score) # 4.7 - Markers reported best reports were "a first", let's say A-.

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
cor(cmp.pegs$mark.x, cmp.pegs$mark.y) # Good correlation (r = .8)
mean(cmp.pegs$mark.x)
mean(cmp.pegs$mark.y) # Mean marks very similar (within 2%). 

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
full$mark[full$Identifier == "Participant 10735917"] ## 65
full$mark[full$Identifier == "Participant 10735917"]  <- 62

## Do not report mark for academic offence suspected
full$mark[full$Identifier == "Participant 10747018"] ## 55
full$mark[full$Identifier == "Participant 10747018"]  <- ""

full$mark[full$Identifier == "Participant 10735971"] ## 55
full$mark[full$Identifier == "Participant 10735971"]  <- ""

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

