## Pre-moderation script
library(tools)
library(tidyverse)

markers  <- list.files('sample-marks')

marks  <- NULL
for (this.marker in markers) {
    tmp  <- read_csv(paste0("sample-marks/",this.marker))
    marker  <- file_path_sans_ext(this.marker)
    tmp  <- cbind(marker, tmp)
    marks  <- rbind(marks, tmp)
}

write_csv(marks, "mod-scores.csv")

## 4 Participants - how many unique identifiers?
unique(marks$Identifier)

## Note for meeting, the Identified column is "Participant 10735832" - so, a
## space, not a underscore, and none of that assign file stuff after it
## either".

## OK, will SRN do better?
unique(marks$SRN)

## Overall scores by marker
overall  <- marks %>% group_by(marker) %>% summarise(mark = mean(Score))
hist(overall$mark)

## Overall score by SRN
marks %>% group_by(SRN) %>% summarise(mark = mean(Score))

# Grades
grades  <- marks %>% group_by(marker, SRN) %>% summarise(mark = mean(Score))
grades %>% pivot_wider(names_from = SRN, values_from = mark)

graph  <- grades %>%
    ggplot(aes(x=factor(SRN, levels =c(10611086, 10615235, 10614635, 10608855)),
               y=mark, group=marker)) +
    geom_line(aes(colour=marker)) +
    geom_point()

graph + facet_grid(marker ~ .)



