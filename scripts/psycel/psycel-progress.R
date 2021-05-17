library(tidyverse)

## Load raw data from PsycEL website
raw  <- read_csv("PsycEL_PSYC520-720_2020.csv")

## Select colums for progress check
prog  <- raw %>% select(Module, Activity, StudentEmail, Status)

## Reduce to distinct rows
prog  <- distinct(prog)

## Filter to completed
complete  <- prog %>% filter(Status == "Completed")

## Percentage completions by student (520)
completed  <- complete %>% filter(Module == "PSYC520") %>%
    group_by(StudentEmail) %>% summarise(N = n()) %>% filter(N > 10)
nrow(completed) / 245

## Count completions by activity (520)
complete %>% filter(Module == "PSYC520") %>% group_by(Module, Activity) %>%
    summarise(pc = round(n()*100/245, 0)) %>%
    arrange(-pc)


## Percentage completions by student (720)
completed  <- complete %>% filter(Module == "PSYC720") %>%
    group_by(StudentEmail) %>% summarise(N = n()) %>% filter(N > 10)
nrow(completed) / 48

## Count completions by activity (720)
complete %>% filter(Module == "PSYC720") %>% group_by(Module, Activity) %>%
    summarise(pc = round(n()*100/48, 0)) %>%
    arrange(-pc)

