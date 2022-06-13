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

write_csv(marks, "report-scores-2022.csv")

## Check/clean data

## SHartgen had missed one mark (no entry)

## NKout entered Participant 11859590 identifier twice (the 2nd one was
## actually Participant 11859560)

## CJones had entered combo of Participant 11859439 and SRN 10682068
## twice. I cannot recover which reports these two are without
## further input.

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
mean(cmp.markers$mean) # 3.6
sd(cmp.markers$mean) # 0.3 

## To one d.p., most markers have an average mark that is within one s.d. of the other
## markers' average marks (3.3-3.9).

## The exceptions are:

## DGraham (3.14, N=18) - Daniel was new to marking this year and was towards
## the bottom of the distribution on pre-moderation. Of the 18 scripts he
## marked, none averaged a good (4.0) score, and about a third were below "OK"
## (3.0). Overall I think this merits a minor correction upwards for Daniel's
## marking. Increased by minimum required to bring mean within 1 s.d. of grand
## mean.
scores %>% filter(marker == "DGraham") %>% arrange(score)
scores$score[scores$marker == "DGraham"]  <- scores$score[scores$marker == "DGraham"] + .16

## DDjama (4.03, N=22) - Despina was close to the centre of the distribution in
## pre-moderation. She is a highly experienced marker on this module. There seems
## to have been four reports in her set that were exceptionally good (>4.5 average).
## It is likely these few reports that make the difference, so overall I think
## no correction is needed, and to do so would run the risk of inappopriately
## disadvantaging some high-performing students. NO CORRECTION MADE.
scores %>% filter(marker == "DDjama") %>% arrange(score) %>% print(n=Inf)

## Now look at score distribution
hist(scores$score)
mean(scores$score) # 3.6 - Up .2 from last year, in depths of pandemic
sd(scores$score) # 0.7 - Same as last year
min(scores$score) # 1.8 - Similar to last year (1.7), where we made this a D
max(scores$score) # 4.8 - Same as last year, where highest mark as an A.

## Convert to mark, using the same thresholds as last two years

scores$mark <- 0

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
mean(scores$mark) # 65.8
sd(scores$mark)   # 10.3
nrow(scores)      # 173

## Resultant mark distribution
round(table(scores$mark) *100 / nrow(scores))

## No peg marks suggested this year, but in both of the last two years,
## correlations were very high to peg marks (r=.97), and means very similar
## (within 0.1%!)

## Load DLE grade book
dle <- read_csv("520dle-main.csv")

## Reduces 'scores' to required columns
grades  <- scores %>% ungroup %>% select(Identifier, mark, marker)

## Combinied by Identifier
full  <- full_join(dle, grades) 

View(full)
## Visual inspection (all seems OK)

## Where student did not submit, and hence we have NA as a mark, record mark as zero.
full$mark[is.na(full$mark)]  <- 0

## Apply mark penalties for reported infractions
## Participant 11859420 - Full page over on Discussion. Marked dropped, student informed.
full$mark[full$Identifier == "Participant 11859420"] <- 55

## The following were technical infractions, but minor so warning given rather than
## mark deduction:
## Participant 11859536
## Participant 11859572
## Participant 11859429

## Plagiarism? No reports of plagiarism from markers.

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
report %>% filter(Grade != 0) %>% summarise(mean = mean(Grade), sd = sd(Grade), n = n())
table(report$Grade)
