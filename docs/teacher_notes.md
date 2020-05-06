# Research Methods in Practice (Part 2) - Teachers' notes

## Contents

- [For next year...](#change)

- [Overview](#over)

- [Week 0: Pre-class preparation](#0)

- [Week 1: Select topic and learn skills](#1)

- [Week 2: Define question, outline design and learn skills](#2)

- [Week 3: Finalize design and learn skills](#3)

- [Week 4: Build experiment](#4)

- [Week 5: Collect data and learn skills](#5)

- [Week 6: Analyze data and prepare presentation](#6)

- [Week 7: Give group presentation](#7)

- [Week 8: Modify, and start to rebuild, experiment](#8)

- [Week 9: Finish experiment rebuild and start to collect data](#9)

- [Week 10: Learn skills and finish data collection](#10)

- [Week 11: Analyze data and start report plan](#11)

- [Week 12: Critique and finish report plan](#12)

<a name="change"></a>

## For next year...

- Change Psyc:EL such that it is possible for staff to reset a passed activtiy from the main web interface. This is to deal with the case where a student notices they have uploaded the wrong thing, but the auto-marking does not, and the student requests to fix the issue.

<a name="over"></a>

## Overview

### Course organization and staffing

Students work in groups of 6 within workshop classes of 80, so each class is three times to accommodate a cohort of 240 students. The course has 12 weeks of teaching. Throughout that time, there will be a specified teaching assistant (Ph.D student or TARA) who is the supervisor of each group and is responsible for monitoring the progress of their groups. 

Each week, students attend a two-hour _high intensity_ workshop, and a two-hour _low intensity_ workshop. The high-intensity workshops have a student:staff ratio of 16:1. One of those staff must be a member of academic staff (Lecturer / AP / Prof), who is expected to be present throughout the session. High-intensity sessions are where new topics are introduced, and where students can expect prompt high-quality support from topic experts, including their supervisor. 

The low-intensity workshops are staffed (normally at a 40:1 ratio), by teaching assistants. No academic staff member is present. The low-intensity sessions are where students continue to work on material introduced in the high-intensity workshops, with support that is mainly technical or procedural in nature. In some weeks (specifically weeks 2, 4, 5 and 6) more teaching assistants are required as the activities generate more queries. Staff these at around 25:1.

The following additional sessions are also run:

- Weeks 3 to 6 (inclusive): A single, one-hour drop-in session, after high-intensity, but before low-intensity. The session is staffed by one person, and is dedicated to resolving OpenSesame issues. This is one session per week, not one session per workshop group per week.

- Week 5: A single, two-hour, 'overflow' data collection session, after the low-intensity session. This allows groups who have not quite finished data collection to test people from other workshop groups to make up the numbers. This is one session, not one session per workshop group.

In addition to these sources of support, a subset of the TAs run 'hatch times' on a rota (one TA staffs the hatch at any given time). These are drop-in times, run every week day during term, until the EC deadline for the main report passes. Opening hours vary:

- Hatch (Weeks 0-12 inclusive):  Mondays: 9 – 5, Tuesdays: 9 – 5, Wednesdays: 9 – 1, Thursdays: 9 – 5, Fridays: 9 - 4.30

- Hatch (Weeks 13-15 inclusive): Monday-Friday, 10-2.

### Assessment

The module's mark is based on  20% Practical and 80% coursework, with no exams, but wth pass/fail comptency components.

_References to 'week X' mean the Xth teaching week of the semester_. For the 2019/20 Plymouth University timetable, teaching week 1 of semester 2 begins 27/01/2020. 

20% - Group mark for a 10-min group oral presentation. The mark is weighted mainly on the quality of the research presented, rather than audio-visual slickness. There is a detailed quantitative markscheme. **Occurs during class in Week 7**

80% - Individual mark for an individually-written 4000-word journal article. The feedback is returned in the format of a journal peer review, and the mark derived from this feedback via a detailed quantitative mark scheme. **Due Thursday of Week 13**. Aim to completing marking by end of Week 14 (in order to assist assessment officers. Return to students Friday of Week 16 (if returning earlier, do not rreturn during the exam period).

Pass/fail - There are a set of pass/fail competency components, and also act as a **lab book**. In order to keep on track students should complete them in the week indicated (see below). However, they can revise their entries at any point up until the end of week 12. Some of these are group components. In these cases, every member of the group still has to submit it individually, but they can all submit the same thing without penalty.

They have to pass 80% of them to pass the module. 

### List of assessments

A full list of assessments, with proformas and model answers in most cases, are available [here](eg-student.md)

### Resources

All sessions in 2019/20 will be run in the Psyc:EL space. The course requires one computer (PC, Mac, or Linux) per student, in all sessions, so any student with a laptop must bring it.

For activities based around R, students will continue to use the RStudio server account they were allocated at Stage 1. They should be prompted a week before the module starts to request login details if they do not have them.

There is an online **lab book** system (see above). 

For activities using Open Sesame, students will need to install this on their machine. There is time in the schedule for them to do this in class. 

### Employability skills

Communication skills. Group working to deadline. Project planning / timetabling. Critical thinking / analysis.

### Ethics

Students write a detailed description of their methods; the discussion and approval of this document by staff provides a practical insight into ethics in these fairly innocous studies.

<a name="0"></a>

## Week 0: Pre-class preparation


One week before the first class, students must be emailed and requested to:

1. Check they can log in to RStudio Server, and request login details from the Tech Office if they cannot.

2. If they did not complete our Stage 1 for any reason, they must complete the [Very Brief Guide to R](https://https://ajwills72.github.io/rminr/#vbgtr), unless they have done so already.

2. Complete the R [revision worksheet](https://ajwills72.github.io/rminr/revision.html), as the module assumes this information will be fresh in their mind. It should take approximately 30 minutes to complete for most students. MSc/direct entry students will need a bit more time (perhaps 15 more minutes) as they'll need to read some additional material on effect size, which was not covered in the materials they have received to date.

3. Bring their laptop to every session if they have one, ensuring they have at least a few GB of space left on their hard drive. A limited number of laptops are available for loan to those who do not have one.

<a name="1"></a>

## Week 1: Select topic and learn skills

### Resources for teachers

- If you're new to R, work through the [Absolute Beginners' Guide to R, part 1](https://ajwills72.github.io/rminr). It should take about four hours.

- If you're new to OpenSeame, watch the video in this
  [tutorial](https://osdoc.cogsci.nl/3.2/tutorials/beginner/), and follow along
  as he does things. It should take less than two hours.
  
### High-intensity session:

| min | Contents                                                                                                 |
|-----|----------------------------------------------------------------------------------------------------------|
| 005 | Teacher gets students to start installing Open Sesame |
| 010 | Teacher gives general introduction to PSYC520 |
| 015 | Teacher gives a short introduction to each of the three topics and sub-topics. |
| 030 | Students select topic and organize into groups. TA allocated to groups. Any given TA does one / two topics. |
| 055 | Break      |
| 065 | Students do the [Introduction to OpenSesame](openses_intro.html)  worksheet, with support |
| 085 | Teacher does introduction to Statistical Power |
| 090 | Students do the [Statistical power](https://ajwills72.github.io/rminr/power.html) worksheet, with support  |
| 115 | Finish                                                                                                   |

_Note_: This is probably Plymouth-specific, but note that there is one restriction to the principle that students can pick their own groups -- group members must all be from the same exit-level of qualification (i.e. all B.Sc., or all M.Sc.). This is because M.Sc. work is marked to a higher standard, and the presentation is group marked.

### Low-intensity session, and homework

- Agree in your group which sub-topic you're going to investigate.

- Read and discuss the assigned papers. There are three papers, so each paper gets read by two people.

- Complete the worksheets.

- Do the first part of the [preprocessing](https://ajwills72.github.io/rminr/preproc.html) worksheet, up to and including running the facial prototypes experiment on yourself.

<a name="2"></a>

## Week 2: Define question, outline design and learn skills

### Teachers' resources

Here are some [slides](expt-design.odp) on experimental design written about a decade ago for the Exeter Stage 2 practicals. They might be useful for developing materials for Weeks 2 and 3 of this module. 

### High intensity session

| min | Contents                                                               |
|-----|------------------------------------------------------------------------|
| 000 | Teacher introduces getting from sub-topic to broad experimental design |
| 020 | With TA support, groups define question and plan broad design          |
| 050 | BREAK                          |
| 060 |  Start [Data preprocessing](https://ajwills72.github.io/rminr/preproc.html) worksheet. If they have not already tried out the facial prototypes experiment in OpenSesame, they should skip this part, otherwise they will run out of time                         |
| 110 | Finish                                                                 |

Allow some flexibility in timing after the break, depending on how much help the groups need with the broad design and with the data preprocessing worksheet. Bear in mind that help on the broad design is more easily got at the high-intensity session, as all TAs are present at these sessions (but not at the low-intensity session). 

### Low-intensity session, and homework

**Staff this low-intensity session more heavily, at 25:1**. This is because the preprocessing exercise is not easy, and probably isn't completable within the high-intensity session.

- Complete data preprocessing worksheet (allow around 40 minutes for this).

- Complete and submit one-page broad design summary.

<a name="3"></a>

## Week 3: Finalize design

### High intensity session

| min | Contents                                                 |
|-----|----------------------------------------------------------|
| 000 | Teacher introduces getting from broad to specific design |
| 020 | With TA support, groups work towards a specific protocol |
| 050 | BREAK                                                    |
| 060 | Work continues towards a specific protocol |
| 110 | FINISH                                                   |

**All groups need to bear in mind the limitations of the testing time and space they have**. In particular:

- The experiment must not take more than 15 minutes to run.

- Experiments should not involve participants speaking loudly - 'under your breath' utterances are OK. 


### Low-intensity session and homework

- Complete and submit all previous Psyc:EL activities if not already done so. 

- Finish and submmit protocol to Psyc:EL.

<a name="4"></a>

## Week 4: Build experiment

### Resources

Students may find this [library](openses_lib.md) of OpenSesame scripts useful.

### High- and low-intensity sessions

Both sessions are dedicated to achieving the following goal: Have a working,
bug-checked OpenSesame script ready to go. **Staff the low-intensity session more heavily than usual, at 25:1**. 

Begin with an interactive session on programming experiments in Open Sesame; this will likely take much of the high-intensity session. Following this, the tasks, which students need to divide between members of the group include: 

- Writing the instructions

- Creating the stimulus sets

- Building the structure in OpenSesame

- Testing for bugs.

- Checking the output is usable.

Each project should meet all the items on this checklist by the first session next week:

- Experiments takes no longer than 15 minutes to run. Check with a stopwatch.

- Experiments do not involve participants speaking loudly.

- Open Sesame script runs from beginning to end without crashing, and runs as exepcted. 

- If headphones are required for a project, students must source at least six pairs of headphones themselves, or ask us by the end of the low-intensity session to provide them.

- The open sesame script is on  EVERY laptop in the gorup and checked that it runs correctly on every laptop BEFORE the week 5 first session.

### Homework

- Complete OpenSesame script and submit it.

- Ensure you've met all items on the above checklist

- Ensure you bring your laptop _fully charged_ to next week's sessions.

- Attendance during week 5 is crucial. Low attendance means low N per testing round, which causes problems for everyone.

### Notes on loaned laptops

These notes refer specifically to the laptop loan system operating in Link 301, Plymouth University.

- If at all possible, don't use the loaned laptops for testing! It will make your life and everyone else's more complex. Bring your own laptop unless you do not own one and cannot afford to buy one.

- If you have to, then get your Open Sesame script installed on a specific loaned machine,  and note the machine's number so you can pick up the same one next week.

- Note that if using OpenSesame on loaned laptops for the first time, you will have to log in, log out and log in again before OpenSesame will work. 

- Also note that, on loaned laptops, you cannot open an OpenSesame script directly from your email. You must download it from your email, then open the OpenSesame program, then use that to open the downloaded file.

<a name="5"></a>

## Week 5: Collect data and learn skills 

### High intensity session

- Collect data.
                                                            
### Low-intensity session

| min | Contents                                                               |
|-----|------------------------------------------------------------------------|
| 000 | Finish collecting data |
| 050 | Complete [within-subjects differences](https://ajwills72.github.io/rminr/anova1.html) ANOVA worksheet |
| 110 | Finish |

**Note:** This session should probably be staffed at 30:1, as there's a fair need for support on the ANOVA worksheet.

#### Advice: "Last working version" debugging

If a student's command in R is not working but is individually correct, then they have likely made an error at a previous step. This might have involved ignoring an earlier error message, or it might have involved doing something that was wrong but didn't immediately generate an error (like mis-naming a new variable). 

In these circumstances, you do 'last working version' debugging. In other words, go back through their previous commands until you find the error - the worksheets generally tell you what is expected as output at each step. 

### Optional third session

- Run ONE (i.e. not one per workshop group, one in total) third two-hour session after the low-intensity session, as a final opportunity to collect additional data from members of other workshop groups, for those who need to do this to hit their data collection target. This session should not be needed if everything runs to plan, but it's useful to have it as a backup, as it's unlikely everything will run to plan for all groups!

### Notes on data collection

Data collection is done during class time, and only people enrolled on the module can be tested (for ethical clearance reasons). Data collection works by 5/6 of each student group participating in six experiments. Each group simultaneously tests five people on five different laptops, with the sixth member being the experimenter for their study. Then the 5/6th of each group move to another experiment, and so on. 

Remember that this module involves two data collection phases, weeks apart, so you need a plan to ensure **no one is tested twice in the same experiment across those two phases**. This requires very careful organization in order to complete in the time available. Here's one scheme we know works well:

1. PRIOR TO THE SESSION, make sure all tables are numbered, and create a chart showing where each table will go for the 11 data collection sessions (6 in phase one, 5 in phase two - [example chart](groups_testing.ods), sampled from the week 5 low-intensity session of a workshop in 2020.

2. Make sure there are 6 machines set up at each table. 

3. Every group sets up their experiment, ready to run 

4. Each group raises their hands when ready to run, you then announce which group is going to their table 

5. Do not start until supervisors have gone to each table to check correct group is at that table 

6. Remind people - no talking unless they need to be talking. It's important to have quiet during data collection. 

7. TAs monitor when groups finish.

8. When everybody is finished, have everyone return to their original tables.

9. Go back to step 3 for next session.

### Homework

- Submit ANOVA exercise in not already done so.

- Submit raw data files.

<a name="6"></a>

## Week 6: Analyze data and prepare presentation

### High intensity session

| min | Contents                                              |
|-----|-------------------------------------------------------|
| 000 | With TA support, analyse and interpet data            |
| 080 | BREAK                                                 |
| 090 | TA led discussion of presentation planning (see Notes) |
| 110 | Finish                                                |

Note 1:

TA and group reprise what they did, what they have found, and discuss any
problems/limitations of what they have done. TA then leads discussion of
examples of very clear, and very unclear, lectures they have encountered since
joining Stage 1. What do these good/bad experiences have in common? Possible
issues - Rate of presentation; incorrectly assumed knowledge; over-crowded
slides; a million facts but no big picture; a big picture but no facts;
conclusions do not cleary follow from facts. Then, TA supports group to
sub-divide the task of writing a presentation between them. The sections would
be something like: (A) Big picture overview, (B) Introducing the specific
question, (C) Metholodgy, (D) Results, (E) Interpretation, (F) problems and
next steps, (G) writing an abstract. Agree an allocation of time and number of
slides each.

Note 2:

Each group must be allocated a presentation day for week 7. Half the groups for a workshop present in the first week 7 session; half present in the second week 7 session. Sort which groups go when during this week 7 high-intensity session, and post the allocations to the DLE before the low-intensity session. Use the flexibility of having two sessions to accommodate groups who have serious reasons for not being able to make one of the sessions (e.g. funeral of a close relative). If we can't accommodate this, then absent members have to present on their own in week 9, and they only get the opportunity to do that with a formal extenuating circumstances approval. 

Note 3:

Students should be expected to produce graphs that have proper labels that are of a readable size. Some of the things they need to know about this are covered in the Absolute Beginners' Guide, but the best source is the [Better Graphs](https://ajwills72.github.io/bettergraphs.html) page.

### Low-intensity session, and homework

**Staff this session at a 25:1 ratio** - some groups need the whole high-intensity session for data analysis, and some of this low-intensity session, too. So one needs the full set of TAs in the low-intensity session to ensure continuity of advice.

- Finish data analysis if not already done so, and submit analysis script.

- Write presentation

- Practice on other groups, TAs, and reflect.

- Submit presentation title, author names, and abstract by **end of the
  low-intensity session**. 

<a name="7"></a>

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

Group_ID: Use their self-assigned group name, but it must be unique for each group and consistent within a group. If they didn't give themselves a name, assign a bland one (e.g. Workshop3Group4). **It is absolutely VITAL that you use the SAME Group_ID in the two CSV files (feedback.csv and groups.csv)**. For example do not use, "W3G2" in one file, but "3.02" in the other file.

PU_email: Give their full Plymouth University email address. Do not give their name (names can be non-unique, and emails make it easy to email feedback). You can find the email address for any student enrolled on the module by downloading a grading sheet from the DLE and searching it.

present: 1 = present, 0 = absent. It's important to explicitly record the absent, as well as the present, students in each group. 

Component: Use these exact words to describe the mark components. **It's really important that you do not mis-spell the Components, e.g. "Clairty of speech", because the script will treat this as a different component.**

Score: Use 1, 2, 3, 4, or 5.  1 = Poor, 2 = Patchy, 3 = OK, 4 = Good, 5 = Excellent. **Zero is not a valid score**.

Feedback: Write what and as much as you like, but don't use formatting (bold etc) and don't use carriage returns - just keep typing on a single line. Apologies for the following basically advice, but it's all based on errors from the first time we ran this: (1) Start all your sentences with a capital letter, (2) avoid spelling and grammatical errors, (3) avoid abbreviations, (4) avoid note form, (5) if it's a question, use a question mark -- these comments are passed directly to students without editing!

Once the Module Leader receives files from all sessions, they moderate, and return overall grades and feedback to the students via email. The ML also uploads overall grade to the DLE. These processes are largely automated by R scripts.

Students are not required to upload their presentations to the DLE.

<a name="8"></a>

## Week 8: Modify, and start to rebuild, experiment

### High intensity session

The group and TA reflect on their results, and the feedback received
on their presentation. They discuss what they would have done differently if
they were starting again. They make an assessment of how serious these
shortcomings are to drive the following decision. Should they:

(A) Run a modified version of their first experiment, mainly centered on
addressing the shortcomings of their design or results (e.g. ceiling/floor
effects).

(B) Add a between-subjects condition to their existing study that widens the
investigation to add another factor. Run that second condition in their second
data collection phase. 

If choosing B, the TA needs to clarify that adding a condition that this
is OK for teaching purposes but should  be avoided in research you're going
to publish. It introduces a time-of-testing confound. Between-subject
conditions should be finely intermixed. 

Students then revise their protocol, and re-program their experiment in
OpenSesame.

### Low intensity session, and homework

- Submit revised protocol.

- Reprogram experiment.

<a name="9"></a>

## Week 9: Finish experiment rebuild and start to collect data

### High intensity session

The whole session is dedicated to achieving the following goal:
Have a working, bug-checked OpenSesame script ready to go.

### Homework

- Complete OpenSesame script and submit it.

### Low-intensity session

Data collection.

<a name="10"></a>

## Week 10: Learn skills and finish data collection

Whole session dedicated to two-factor ANOVA. There are two worksheets,
[Understanding interactions](https://ajwills72.github.io/rminr/anova2.html) (60
minutes) and [Factorial
differences](https://ajwills72.github.io/rminr/anova3.html) (40 min), so
perhaps encourage students to take a break after the first worksheet.

### Low intensity session

Complete data collection.

### Homework

- Submit ANOVA exercises.

- Submit raw data files. 

<a name="11"></a>

## Week 11: Analyze data and start report plan

### Teachers' resources

Here are some [slides](report-writing.odp) on report writing I put together for a similar course at Exeter about a decade ago. They might be helpful in developing materials here.

### High-intensity session

| min | Contents                                                          |
|-----|-------------------------------------------------------------------|
| 000 | With TA support, analyse and interpet data                        |
| 080 | BREAK                                                             |
| 090 | Teacher presentation report writing                               |
| 110 | Finish                                                            |

One 'gotcha' here might be the combination of the two datsets into one in order to be able to do the factorial ANOVA. Basically, all you need to do is use the same sorts of commands you did in the preprocessing worksheet to add a column that contains the Experiment ID, and then combine the two data frames as before. Note that you may need to set the appropriate columns as factors again after doing this.

### Low-intensity session

- Finish and submit analysis script.

- As a group, write and submit a bullet point plan for the report.

### Homework

- Read the good/bad reports used in Week 12.

<a name="12"></a>

## Week 12: Critique and finish report plan

### High intensity session

| min | Content                                              |
|-----|------------------------------------------------------|
| 000 | TA-led good-and-bad reports activity (see Note 1)    |
| 050 | BREAK                                                |
| 060 | TA-led discussion of bullet point plans (see Note 2) |


Note 1: Groups are given one example 1st class and one example 2ii report (we
would put these together ourselves by coming up with an imaginary study,
writing it up well, and then breaking it). Can they tell why those two reports
differed in mark? What are the good points of the 1st class report? Where did
the 2ii report go wrong?

Note 2: All groups working with a TA get together.  Each group, with an
audience of that TA's other two groups, talks through their bullet point
plan. TA and other groups provide feedback on what they found clear / unclear.

### Low-intensity session

An open Q&A, and support session, so students are best prepared to write their
report.

### Homework

Write the report.

[APA referencing guide](https://plymouth.libguides.com/APA)

[Common issues of grammar and style](grammar.html)

