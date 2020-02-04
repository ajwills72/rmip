# Research Methods in Practice (Part 2) - Teachers' notes

## Week 7: Give group presentation

## High intensity and low intensity sessions

All the sessions this week are identical -- each is staffed by one TA and one
Teacher (who double mark). In each workshop, up to 7 groups present. 10 minute
presentations, 3 min for questions and informal feedback, 2 min for switch
over. Just about fits into a 2 hour session.

## Homework

- None!

## Marking process for group presentations

During the session itself, focus on giving frank feedback that will help them with the next stage of this module. You can also give presentational feedback, of course.

Immediately after the end of each session, the Teacher and TA agree component scores and feedback for each group. The Teacher then immediately emails the agreed [scores/feedback CSV file](mark-process/feedback.csv), and the [groups/attendance CSV file](mark-process/groups.csv) to the module leader. Note that you do not assign an overall grade, this is done during moderation, although if you have a suggested grade for the groups, feel free to put those in the body of the email. It is important that correctly formatted CSV files are used because much of the subsequent process is automated. The links give examples of the format needed. In particular:

Group_ID: Use their self-assigned group name, but it must be unique for each group and consistent within a group. If they didn't give themselves a name, assign a bland one (e.g. Workshop3Group4). 

PU_email: Give their full Plymouth University email address. Do not give their name (names can be non-unique, and emails make it easy to email feedback). You can find the email address for any student enrolled on the module by downloading a grading sheet from the DLE and searching it.

present: 1 = present, 0 = absent. It's important to explicitly record the absent, as well as the present, students in each group. 

Component: Use these exact words to describe the mark components.

Score: Use 1, 2, 3, 4, or 5.  1 = Poor, 2 = Patchy, 3 = OK, 4 = Good, 5 = Excellent.

Feedback: Write what and as much as you like, but don't use formatting (bold etc) and don't use carriage returns - just keep typing on a single line. 

Once the Module Leader receives files from all sessions, they moderate, and return overall grades and feedback to the students via email. The ML also uploads overall grade to the DLE. These processes are largely automated by R scripts.

Students are not required to upload their presentations to the DLE.




