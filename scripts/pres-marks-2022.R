## Presentation mark moderation and distribution
## Andy Wills,  GPL 3

rm(list=ls())

## Load packages
library(tidyverse)

## Load feedback and marks
fback.W1 <- read_csv("pres-marks/feedbackMV.csv") %>%
    add_column(work_ID = 1, .before = TRUE)

fback.W2 <- read_csv("pres-marks/feedbackSS.csv") %>%
    add_column(work_ID = 2, .before = TRUE)

fback.W3 <- read_csv("pres-marks/feedbackCW.csv") %>%
    add_column(work_ID = 3, .before = TRUE)

fback <- bind_rows(fback.W1, fback.W2, fback.W3)

## Load attendances

grps.W1 <- read_csv("pres-marks/groupsMV.csv") %>%
    add_column(work_ID = 1, .before = TRUE)

grps.W2 <- read_csv("pres-marks/groupsSS.csv")  %>%
    add_column(work_ID = 2, .before = TRUE)

grps.W3 <- read_csv("pres-marks/groupsCW.csv")  %>%
    add_column(work_ID = 3, .before = TRUE)

grps <- bind_rows(grps.W1, grps.W2, grps.W3)


## Check/clean feedback data
length(unique(fback$Component)) == 10 ## 10 feedback components
unique(fback$Component) ## They the correct components
data.frame(groupid = unique(fback$Group_ID)) %>% arrange(groupid) ## Sensible-looking group IDs
unique(fback$Score) ## Valid scores

ngroups  <- length(unique(fback$Group_ID)) ## number of groups
ngroups
nrow(fback) / ngroups ## number of rows / number of groups should equal 10
table(fback$Group_ID)  ## find groups with missing feedback.


## Calculate overall scores
scores <- fback %>% group_by(work_ID, Group_ID) %>%
    summarise(score = mean(Score, na.rm = TRUE))

## Compare workshop groups on summary stats
scores %>% group_by(work_ID) %>%
    summarise(mean = mean(score),
              min = min(score),
              max = max(score),
              sd = sd(score))

## Although Workshop 1 is slightly higher, the difference is small and given that each
## workshop is an N of 12, some variation is expected.
## Also, workshop 1 is lower mainly because of one very poorly performing group (score = 1.33)

## No statistical moderation required at workshop level.

## Ignore workshop grouping from here on
scores <- fback %>% group_by(Group_ID) %>%
    summarise(score = mean(Score, na.rm = TRUE))

## Summary stats
scores %>% summarise(mean = mean(score), min = min(score), max = max(score),
                     sd = sd(score))
hist(scores$score)

## Convert to mark
scores$mark <- 0

## Lowest mark overall, descrptively "Mainly poor, aspects of patchy", letter: D-
scores$mark[scores$score > 1.32] <- 42

## Descrptively "Mainly patchy, aspects of poor", letter: D
scores$mark[scores$score > 1.77] <- 45

## Descriptively "Mainly patchy, aspects of OK", letter: D+
scores$mark[scores$score > 2.21] <- 48

## Descriptively "Patchy / OK", letter: C-
scores$mark[scores$score > 2.50] <- 52

## Descrptively "Mainly OK, some patchy", letter: C
scores$mark[scores$score > 2.74] <- 55

## Descriptively "OK", letter: C+
scores$mark[scores$score > 2.99] <- 58

## One s.d. below mean, descriptively "OK with aspects of good", letter: B-
scores$mark[scores$score > 3.17] <- 62
## Mean mark, descriptively "good", letter: B
scores$mark[scores$score > 3.99] <- 65
## Interpolated, descriptively "mainly good, aspects of excellence", letter: B+
scores$mark[scores$score > 4.24] <- 68
## Descriptively, more excellent than good. letter: A-
scores$mark[scores$score > 4.50] <- 77
## Highest mark, descriptively "Mostly excellent". letter: A
scores$mark[scores$score > 4.74] <- 88

## Resultant mean score
mean(scores$mark)
## Resultant mark distribution
round(table(scores$mark) / ngroups, 2)

## Create plain text feedback forms

## Recode scores as text
fback$Mark <- recode(fback$Score, `1` = "Poor", `2` = "Patchy",
                     `3` = "OK", `4` = "Good", `5` = "Excellent")

## Ensure 'NA' does not appear as a Mark
fback$Mark[is.na(fback$Mark)] <- ""

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
                 paste0("FEEDBACK: ", oneg$Feedback[rw]),
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

## Number of duplicate email addresses
sum(duplicated(grps$PU_email))

## Count N students on our lists
nrow(grps)

## Load DLE grade books
dle520 <- read_csv("pres-marks/520dle.csv")
dle720 <- read_csv("pres-marks/720dle.csv")
dle <- bind_rows(dle520, dle720)

## Number of duplicated email addresses
sum(duplicated(dle$`Email address`))

## Count N students on DLE list
nrow(dle)

## Script to find any mismatches between our and DLE lists
grps$`Email address` <- grps$PU_email
full <- left_join(dle, grps, by="Email address")
nrow(full)
full$`Full name`[is.na(full$`PU_email`)]

## Differs by two students. One has interrupted, the other is in Stage 4
## We should not return a mark for either.

## Who was absent?
absent <- grps %>% filter(present != 1)

## OK, contact those students

## Check email system working
cmd  <- 'mutt -s \"Absence from assessed presentation\" -- andy.wills@plymouth.ac.uk < ec-email.txt'
system(cmd)

## Email all absentees
for(student in absent$PU_email) {
    subj <- '"Absence from assessed presentation"'
    cmd <- paste0(
        "mutt -s ",
        subj,
        " -- ",
        student,
        " < ec-email.txt"
    )
    print(cmd)
##  system(cmd)
}

## Right, so now who was present?
present <- grps %>% filter(present == 1)

## OK, send feedback to those students
##sink("dump.txt")
for(student in present$PU_email) {
    subj <- '"PSYC520/720: Group presentation mark and feedback"'
    groupid <- present$Group_ID[present$PU_email == student]
##  student <- "andy.wills@plymouth.ac.uk"        
    cmd <- paste0(
        "mutt -s ",
        subj,
        " -- ",
        student,
        " < feedback/",
        groupid,
        ".txt"
    )
    print(cmd)
   ## system(cmd)  
}
##sink()

## OK, so now the EC deadline has passed...

## load in mark sheet from that
## and merge with the original absent list
ec.marks  <- read_csv("pres-marks/ec_pres_2022.csv")
ec.comb  <- left_join(absent, ec.marks, by="PU_email") %>%
    select(Group_ID, PU_email, present, EC_presented, EC_type)

## Remake feedback files with EC preamble
make.ec.feedback <- function(oneg, mrk) {
    preamble <- c(
    "PSYC520 / PSYC720: Presentation",
    "",
    "Your Extenuating Circumstances presentation has been marked; below is your mark, which is the same as for the rest of your group.",
    "",
    "These marks are provisional, and will remain so until confirmed by the Board of Examiners.",
    "",
    "DO NOT REPLY TO THIS AUTO-GENERATED EMAIL, as replies will not be received. If you have questions about this mark, ask your workshop group leader (Chris Longmore, Michael Verde, or Clare Walsh) during their office hours.", ""
)
    gid <- oneg$Group_ID[1]
    fnam <- paste0("ec_feedback/",gid,".txt")
    txt <- c(
        paste0("Group: ", gid), "",
        preamble,"", 
        paste0("OVERALL MARK: ", mrk, "%"), ""
    )
    fileConn <- file(fnam)
    writeLines(txt, fileConn)
    close(fileConn)
}

## Create feedback files
for(gid in unique(fback$Group_ID)) {
    onef <- fback %>% filter(Group_ID == gid) 
    omark <- scores$mark[scores$Group_ID == gid]
    make.ec.feedback(onef, omark)
}

## Contact those who were present for the EC assessment, and had ECs approved
ec.success  <- ec.comb %>% filter(EC_presented == 1 & EC_type == "extension")

##sink("dump.txt")
for(student in ec.success$PU_email) {    
    subj <- '"PSYC520/720: Extenuating Circumstances presentation mark"'
    groupid <- ec.success$Group_ID[ec.success$PU_email == student]
    ##student <- "andy.wills@plymouth.ac.uk"        
    cmd <- paste0(
        "mutt -s ",
        subj,
        " -- ",
        student,
        " < ec_feedback/",
        groupid,
        ".txt"
    )
    print(cmd)
    system(cmd)    
}
##sink()


## Email all fails
ec.comb$EC_presented[is.na(ec.comb$EC_presented)] <- 0
ec.comb$EC_type[is.na(ec.comb$EC_type)] <- "none"

ec.fail  <- ec.comb %>% filter(EC_presented != 1 & EC_type != "non-attendance")

for(student in ec.fail$PU_email) {
    ##student <- "andy.wills@plymouth.ac.uk"        
    subj <- '"Failure of assessed presentation"'
    cmd <- paste0(
        "mutt -s ",
        subj,
        " -- ",
        student,
        " < ec-fail.txt"
    )
    print(cmd)
    system(cmd)
}


## Time to return marks to DLE

## 1. Treat those successfully completing EC and with EC approval as if they were present
final  <- grps
final$present[final$PU_email %in% ec.success$PU_email]  <- 1

## 2. Combine group marks with individual students
all.marks  <- final %>% full_join(scores, by = "Group_ID")

## 3. Where student was not present, change mark to zero
all.marks$mark[all.marks$present == 0]  <- 0

## 4. Reduce to necessary columns and rename
all.marks  <- all.marks %>% select(`Email address`, mark)
colnames(all.marks)  <- c("Email address", "Graded")

## 5. Insert marks in PSYC720 spreadsheet
return720  <- dle720 %>% left_join(all.marks, by = "Email address")
return720$Grade  <- return720$Graded
return720  <- return720 %>% select(-Graded)
return720$`Feedback comments`  <- ""

## 6. Save out as CSV for upload to DLE
write_csv(return720, "return720.csv")

## 7. Same rigmarole for PSYC520
return520  <- dle520 %>% left_join(all.marks, by = "Email address")
return520$Grade  <- return520$Graded
return520  <- return520 %>% select(-Graded)
return520$`Feedback comments`  <- ""

## 8. Remove students who are Uni system admin errors by hand
## (Scripting would put the names into repo, which is not good)


write_csv(return520, "return520.csv")

## Now do summary stats for module report form

rm(list=ls())
library(tidyverse)
return520  <- read_csv("return520.csv")

attempt520 <- return520 %>% filter(Grade != 0)
attempt520 %>% summarise(mean = mean(Grade), sd = sd(Grade), n = n())

round(table(attempt520$Grade) * 100 / nrow(attempt520),0)

return720  <- read_csv("return720.csv")

attempt720 <- return720 %>% filter(Grade != 0)
attempt720 %>% filter(Grade != 0) %>% summarise(mean = mean(Grade), sd = sd(Grade), n = n())
round(table(attempt720$Grade) * 100 / nrow(attempt720),0)

