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

## List of people who are failing 520
fails  <- complete %>% filter(Module == "PSYC520") %>%
    group_by(StudentEmail) %>% summarise(N = n()) %>% filter(N < 11) %>%
    arrange(-N)

## Load grading worksheet from DLE
grad  <- read_csv("Grades-PSYC520.csv")

## Reduce to people who have actually submitted main report
submitted  <- grad %>% filter(Status != "No submission - Not marked")

## Who has submitted report but not complete Psyc:EL
contact  <- fails %>% filter(StudentEmail %in% submitted$`Email address`)

## Urgent email sent via DLE announcements
## Now, go through the whole thing again for 720

## List of people who are failing 520
fails720  <- complete %>% filter(Module == "PSYC720") %>%
    group_by(StudentEmail) %>% summarise(N = n()) %>% filter(N < 11) %>%
    arrange(-N)

## Load grading worksheet from DLE
grad720  <- read_csv("Grades-PSYC720.csv")

## Reduce to people who have actually submitted main report
submitted720  <- grad720 %>% filter(Status != "No submission - Not marked")

## Who has submitted report but not complete Psyc:EL
contact720  <- fails720 %>% filter(StudentEmail %in% submitted720$`Email address`)

