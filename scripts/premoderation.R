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

## 4 Participants - how many unique identifiers?
unique(marks$Identifier)

## Note for meeting, the Identified column is "Participant 10735832" - so, a
## space, not a underscore, and none of that assign file stuff after it
## either".

## OK, will SRN do better?
unique(marks$SRN)

## Overall scores by marker
marks %>% group_by(marker) %>% summarise(mark = mean(Score))

marks %>% group_by(marker) %>% summarise(mark = mean(Score))


