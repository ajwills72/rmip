## Pre-moderation script
rm(list=ls())
library(tools)
library(tidyverse)

markers  <- list.files('scripts/sample-marks-2024')

marks  <- NULL
for (this.marker in markers) {
    tmp  <- read_csv(paste0("scripts/sample-marks-2024/",this.marker))
    marker  <- file_path_sans_ext(this.marker)
    tmp  <- cbind(marker, tmp)
    marks  <- rbind(marks, tmp)
}

write_csv(marks, "scripts/mod-scores-2024.csv")

## 4 Participants - how many unique identifiers?
unique(marks$Identifier)

## Mean score
grandmean  <- marks %>% summarise(mark = round(mean(Score),1))
grandmean

## So, across four reports, the mean score across 12 markers was 3.2
## This is the same as 2022.

## Overall score by SRN
marks %>% group_by(Identifier) %>% summarise(mark = round(mean(Score),1))

## This year, I managed to pick a wide range of - 2.6 to 4.1
## There's three clear categories of rank here: lowest (2), middle, highest
## Most markers agreed with this

# Grades
grades  <- marks %>% group_by(marker, Identifier) %>% summarise(mark = mean(Score))
grades %>% pivot_wider(names_from = Identifier, values_from = mark)

graph  <- grades %>%
    ggplot(aes(x=factor(Identifier, levels =c(1, 3, 2, 4)),
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
score.by.comp  <- marks %>% group_by(Description, marker, Identifier) %>% summarize(Score = mean(Score))
score.sd  <- score.by.comp %>% group_by(Description, Identifier) %>% summarise(SD = sd(Score)) %>% arrange(-SD)
hist(score.sd$SD)
tops <- score.sd %>% arrange(-SD)
View(tops)

marks %>% filter(Component == 21)

## Impressive, SD close or below 1 for almost all component-SRN pairs, and none
## of the top 3 SDs occurred for more than 1 report.

## It looks like the one clear outlier here this year is 'Figures have an 
## appropriate legend that is referred to in the main text'

marks %>% filter(Component == 13) %>% filter(Identifier == 3) %>%
    select(marker, Score) 

## The next highest variances is:

## Results section includes appropriate and accurate inferential stats (Bayesian ANOVA)

marks %>% filter(Component == 15) %>% filter(Identifier == 4) %>%
    select(marker, Score) 

