## Pre-moderation script
library(tools)
library(tidyverse)

markers  <- list.files('sample-marks-2021')

marks  <- NULL
for (this.marker in markers) {
    tmp  <- read_csv(paste0("sample-marks-2021/",this.marker))
    marker  <- file_path_sans_ext(this.marker)
    tmp  <- cbind(marker, tmp)
    marks  <- rbind(marks, tmp)
}

write_csv(marks, "mod-scores-2021.csv")

## 4 Participants - how many unique identifiers?
unique(marks$SRN)

## Mean score
grandmean  <- marks %>% summarise(mark = round(mean(Score),1))
grandmean

## So, across four reports, the mean score across 12 markers was 3.7

## Overall score by SRN
marks %>% group_by(SRN) %>% summarise(mark = round(mean(Score),1))

## This year, each of the four samples was very close to that mean, so there's
## little to be gained in looking at e.g. consistency of rank ordering because,
## to a first approximation, these were equally good reports.
## This will sometimes happen with small pre-moderation samples. 

## Mean scores, by marker
overall  <- marks %>% group_by(marker) %>% summarise(mark = round(mean(Score),1)) %>% arrange(mark)
hist(overall$mark)
overall

## Most markers were individually close to the group mean
## However the following were > +/- 0.3 away, suggesting over/under marking relative to peers:
overall %>% filter(mark > 4)
overall %>% filter(mark < 3.4)

## Which components on which reports have the most variance between markers?
score.by.comp  <- marks %>% group_by(Description, marker, SRN) %>% summarize(Score = mean(Score))
score.sd  <- score.by.comp %>% group_by(Description, SRN) %>% summarise(SD = sd(Score)) %>% arrange(-SD)
hist(score.sd$SD)

## It seems like there are perhaps 20 component-SRN pairs (out of 200) on which
## disagreement was higher than others Of these, which have high variance for
## more than one report?
score.sd %>% head(20) %>% group_by(Description) %>% summarise(N = n()) %>%
    arrange(-N) %>% filter(N > 1)

## So, here's my view on those two components
## Top-level view: These are both things which would be easier to mark if you'd supervised the group and hence knew what the right answers were. Nonetheless, worth having a quick peek and discuss. 

## 8: Sample sizes are jutisfied through a power calculation

## 10671167 - 2 (3): These appear to be numbers for N=25/cond rather than what they actually tested
marks %>% filter(Component == 8) %>% filter(SRN == 10671167) %>%
    select(marker, Score) %>% filter(Score <2 | Score > 3)

## 10652376 - 2 (3): The b/subj power must be wrong I think.
marks %>% filter(Component == 8) %>% filter(SRN == 10652376) %>%
    select(marker, Score) %>% filter(Score <2 | Score > 3)

## 10557455 - 2: I didn't bother to look at the exact values because (a) power is about Type II errors only, and (b) a power can never be greater than 1.
marks %>% filter(Component == 8) %>% filter(SRN == 10557455) %>%
    select(marker, Score) %>% filter(Score != 2)

## 10646293 - 2: Both of these numbers seem wrong.
marks %>% filter(Component == 8) %>% filter(SRN == 10646293) %>%
    select(marker, Score)  %>% filter(Score != 2)

## 15: Results section includes appropriate and accurate inferential statistics

## 10671167 - 4: Basically fine. Perhaps not a 5 just because > 3 is more than weak, typically.
marks %>% filter(Component == 15) %>% filter(SRN == 10671167) %>%
    select(marker, Score) %>% filter(Score < 4)

## 10652376 - 2 (3): Appears to Interpret an inconclusive BF for interaction as
## evidence for absence of interaction.
marks %>% filter(Component == 15) %>% filter(SRN == 10652376) %>%
    select(marker, Score) %>% filter(Score > 3)

## 10557455 - 2 (3): Seems rather confused, errorful, incomplete (e.g. interaction for accuracy reported in RT section, bizzare statement about SD, statement about RT interaction incompatible with reported BF; English sufficiently poor it gets in the way of understanding)
marks %>% filter(Component == 15) %>% filter(SRN == 10557455) %>%
    select(marker, Score) %>% filter(Score > 3)

## 10646293 - 2 (3):  Misinterpretation of BF = 1.55. Repetition of same figures. 
marks %>% filter(Component == 15) %>% filter(SRN == 10646293) %>%
    select(marker, Score) %>% filter(Score > 3)


