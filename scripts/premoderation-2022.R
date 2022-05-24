## Pre-moderation script
library(tools)
library(tidyverse)

markers  <- list.files('sample-marks-2022')

marks  <- NULL
for (this.marker in markers) {
    tmp  <- read_csv(paste0("sample-marks-2022/",this.marker))
    marker  <- file_path_sans_ext(this.marker)
    tmp  <- cbind(marker, tmp)
    marks  <- rbind(marks, tmp)
}

write_csv(marks, "mod-scores-2022.csv")

## 4 Participants - how many unique identifiers?
unique(marks$SRN)

## Mean score
grandmean  <- marks %>% summarise(mark = round(mean(Score),1))
grandmean

## So, across four reports, the mean score across 10 markers was 3.2

## Overall score by SRN
marks %>% group_by(SRN) %>% summarise(mark = round(mean(Score),1))

## This year, I managed to pick a wide range of - 2.0 to 4.3
## There's three clear categories of rank here: lowest, middle (2), highest
## Most markers agreed with this

# Grades
grades  <- marks %>% group_by(marker, SRN) %>% summarise(mark = mean(Score))
grades %>% pivot_wider(names_from = SRN, values_from = mark)

graph  <- grades %>%
    ggplot(aes(x=factor(SRN, levels =c(10686215, 10647196, 10685499, 10683463)),
               y=mark, group=marker)) +
    geom_line(aes(colour=marker)) +
    geom_point()

graph + facet_grid(marker ~ .)


## Mean scores, by marker
overall  <- marks %>% group_by(marker) %>% summarise(mark = round(mean(Score),1)) %>% arrange(mark)
hist(overall$mark)
overall

## Most markers were individually close to the group mean
## However the following were > +/- 0.3 away, suggesting over/under marking relative to peers:
overall %>% filter(mark > 3.5)
overall %>% filter(mark < 2.9)


## Which components on which reports have the most variance between markers?
score.by.comp  <- marks %>% group_by(Description, marker, SRN) %>% summarize(Score = mean(Score))
score.sd  <- score.by.comp %>% group_by(Description, SRN) %>% summarise(SD = sd(Score)) %>% arrange(-SD)
hist(score.sd$SD)
tops <- score.sd %>% arrange(-SD)
View(tops)


## Fairly impressive, SD close or below 1 for most component-SRN pairs, and none
## of the higher SDs occurred for more than 1 report.

## It looks like the one clear outlier here this year is 'Correct formatting of
## sections and sub-sections'
marks %>% filter(Component == 25) %>% filter(SRN == 10686215) %>%
    select(marker, Score) 

## The next three highest variances are:

## Discussion concludes appropriately

marks %>% filter(Component == 22) %>% filter(SRN == 10685499) %>%
    select(marker, Score) 

## Apparatus and materials sections are clear, accurate, and contain correct information

marks %>% filter(Component == 9) %>% filter(SRN == 10685499) %>%
    select(marker, Score) 

## Discussion makes appropriate links to previous literature

marks %>% filter(Component == 19) %>% filter(SRN == 10685499) %>%
    select(marker, Score) 

