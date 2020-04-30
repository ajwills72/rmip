## Main report marking
rm(list=ls())
library(tidyverse)

## Load group allocations from presentations
grps.W1 <- read_csv("pres-marks/520_groups_MV.csv") %>%
    add_column(work_ID = 1, .before = TRUE)

grps.W2 <- read_csv("pres-marks/520_groups_CL.csv")  %>%
    add_column(work_ID = 2, .before = TRUE)

grps.W3 <- read_csv("pres-marks/520_groups_CW.csv")  %>%
    add_column(work_ID = 3, .before = TRUE)

grps <- bind_rows(grps.W1, grps.W2, grps.W3) %>% select(-present, -first, -last)

## Load group leaders
markers.W1  <- read_csv("main-marks/markers_MV.csv")
markers.W2  <- read_csv("main-marks/markers_CL.csv")
markers.W3  <- read_csv("main-marks/markers_CW.csv")
markers  <- bind_rows(markers.W1, markers.W2, markers.W3)

## Produce marker allocation list
marker.alloc  <- left_join(grps, markers, by="Group_ID")

## Add module indicator (520 or 720?)
dle720  <- read_csv("pres-marks/720dle.csv")
dle720  <- dle720 %>% add_column(module = "PSYC720")
dle520  <- read_csv("pres-marks/520dle.csv")
dle520  <- dle520 %>% add_column(module = "PSYC520")

mod.map  <- bind_rows(dle520, dle720) %>% select(`Email address`, module)
colnames(mod.map)  <- c("PU_email", "module")
marker.alloc  <- left_join(mod.map, marker.alloc, by = "PU_email")

## Output list for DLE entry
dle.markers  <- marker.alloc %>% select(module, PU_email, marker) %>%
    arrange(module, marker, PU_email)

## Output as CSV
write_csv(dle.markers, "dle_markers.csv")

## Analytics - reports per marker
table(dle.markers$marker)
