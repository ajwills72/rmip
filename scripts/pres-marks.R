## Presentation mark moderation and distribution
## Andy Wills,  GPL 3

## Notes for future years
## 1. Start feedback comments with a capital letter.
## 2. Try to avoid spelling and grammatical errors!
## 3. Avoid non-standard abbreviations (e.g. "dep variable")
## 4. If it's a question, use a question mark.
## 5. Group_IDs have to match between the group and feedback files you send me! Only MV did this.
## 6. It's really important you don't misspell the Components  e.g. "Clairty of speech", because the script will treat these as different components!

## MV: Row 39: Comment incomplete, I have added text for students to talk to you for clarification

## MV: 1_07: Advice on next steps - Zero is not a valid score. I have inserted 3. It's too late to change this now, hopefully not a major issue.


rm(list=ls())
## Load packages
library(tidyverse)

## Load feedback and marks
fback.W1 <- read_csv("pres-marks/520_feedback_MV.csv") %>%
    add_column(work_ID = 1, .before = TRUE)

fback.W2 <- read_csv("pres-marks/520_feedback_CL.csv") %>%
    add_column(work_ID = 2, .before = TRUE)

fback.W3 <- read_csv("pres-marks/520_feedback_CW.csv") %>%
    add_column(work_ID = 3, .before = TRUE)

fback <- bind_rows(fback.W1, fback.W2, fback.W3)

## Check/clean data
length(unique(fback$Component)) == 10 ## 10 feedback components
unique(fback$Component) ## They the correct components
unique(fback$Group_ID) ## Sensible-looking group IDs
unique(fback$Score) ## Valid scores

## Calculate overall scores
scores <- fback %>% group_by(work_ID, Group_ID) %>%
    summarise(score = mean(Score, na.rm = TRUE))

## Compare workshop groups on summary stats
scores %>% group_by(work_ID) %>%
    summarise(mean = mean(score),
              min = min(score),
              max = max(score),
              sd = sd(score))

## Groups are sufficiently close that no statistical moderation between groups
## is necessary

## Ignore workshop grouping from here on
scores <- fback %>% group_by(Group_ID) %>%
    summarise(score = mean(Score, na.rm = TRUE))

## Summary stats
scores %>% summarise(mean = mean(score), min = min(score), max = max(score),
                     sd = sd(score))
## Convert to mark

scores$mark <- 0
## Lowest mark overall, descrptively "Mainly OK, some patchy", letter: C
scores$mark[scores$score > 2.88] <- 55
## Descriptively "OK", letter: C+
scores$mark[scores$score > 2.99] <- 58
## One s.d. below mean, descriptively "OK/good", letter: B-
scores$mark[scores$score > 3.52] <- 62
## Mean mark, descriptively "good", letter: B
scores$mark[scores$score > 3.97] <- 65
## Interpolated, descriptively "mainly good, aspects of excellence", letter: B+
scores$mark[scores$score > 4.24] <- 68
## Descriptively, more excellent than good. letter: A-
scores$mark[scores$score > 4.50] <- 77
## Highest mark, descriptively "Mostly excellent". letter: A
scores$mark[scores$score > 4.77] <- 88

## Resultant mean score
mean(scores$mark)
## Resultant mark distribution
table(scores$mark)


## Create plain text feedback forms

## Recode scores as text
fback$Mark <- recode(fback$Score, `1` = "Poor", `2` = "Patchy",
                     `3` = "OK", `4` = "Good", `5` = "Excellent", .default = "")

## Ensure 'NA' does not appear
fback[is.na(fback)] <- ""

## If feedback is not written, replace with 'none'
fback$Feedback[fback$Feedback == ""] <- "None"

## Function to generate text of feedback email
make.feedback <- function(oneg, mrk) {
    preamble <- c(
    "PSYC520 / PSYC720: Group Presentation",
    "",
    "Your group's presentation was marked independently by two markers, who then agreed the following scores and feedback. The overall mark for each group was calculated by taking the mean across the nine scores below. The module leader took the set of overall marks, moderated them, and converted them to the grade you see below. This was done with reference to the generic marking criteria you can find in your Stage handbook. The mark awarded is for your group. Every member of the group who attended their group’s presentation gets this mark. Failure to attend results in a mark of zero.",
    "",
    "These marks are provisional, and will remain so until confirmed by the Board of Examiners.",
    "",
    "DO NOT REPLY TO THIS AUTO-GENERATED EMAIL, as replies will not be received. If you have questions about this feedback, ask your group leader in your next session.", ""
)
   
    gid <- oneg$Group_ID[1]
    fnam <- paste0("feedback/",gid,".txt")
    txt <- c(
        paste0("Group: ", gid), "",
        preamble,"", 
        paste0("OVERALL MARK: ", mrk, "%"), ""
    )
    
    for(rw in 1:nrow(oneg)) {
        txt <- c(txt,
                 paste0(rw,". ", oneg$Component[rw]),
                 if(rw != 10) paste0("SCORE: ", oneg$Mark[rw]),
                 paste0("FEEDBACK: ", oneg$Feedback[rw], "."),
                 ""
                 )
    }
    fileConn <- file(fnam)
    writeLines(txt, fileConn)
    close(fileConn)
}

## Create feedback files
for(gid in unique(fback$Group_ID)) {
    onef <- fback %>% filter(Group_ID == gid) 
    omark <- scores$mark[scores$Group_ID == gid]
    make.feedback(onef, omark)
}

###################

## Group memberships

grps.W1 <- read_csv("pres-marks/520_groups_MV.csv") %>%
    add_column(work_ID = 1, .before = TRUE)

grps.W2 <- read_csv("pres-marks/520_groups_CL.csv")  %>%
    add_column(work_ID = 2, .before = TRUE)

grps.W3 <- read_csv("pres-marks/520_groups_CW.csv")  %>%
    add_column(work_ID = 3, .before = TRUE)

grps <- bind_rows(grps.W1, grps.W2, grps.W3)

## Absent
grps %>% filter(present != 1)
