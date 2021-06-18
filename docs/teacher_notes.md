# Research Methods in Practice (Part 2) - Teachers' notes

_2022 edition_. UNDER CONSTRUCTION - some mix of 2021 and 2022 currently.

## Contents

- [Overview](#over) 

- [Week 0: Pre-class preparation](#0) 

- [Week 1: Select topic and learn about statistical power](#1) 

- [Week 2: Define question, outline design and learn about data preprocessing](#2) 

- [Week 3: Finalise experimental design](#3) 

- [Week 4: Build experiment](#4) 

- [Week 5: Upload experiment and begin to learn about ANOVA](#5) 

- [Week 6: Collect data and finish learning about ANOVA](#6) 

- [Week 7: Finish data collection](#7) 

- [Week 8: Analyse data](#8) 

- [EASTER BREAK](#easter)

- [Week 9: Write a presentation](#9) 

- [Week 10: Give presentation](#10) 

- [Week 11: Planning a report](#11) 

- [Week 12: Critique and support](#12) 

- [Weeks 13-15: After the workshops end...](#13)


<a name="over"></a>

## Overview

### Course organisation and staffing

Students work in groups of 7 within workshop classes of 50, so there are six workshop groups in order to accommodate a cohort of 300 students. The course has 12 weeks of teaching. Throughout that time, there is a specified teaching assistant (Ph.D student or TARA) who is the supervisor of each group and is responsible for monitoring the progress of their groups. 

Each week, students attend a two-hour _early-week_ workshop, and a two-hour _late-week_ workshop. For the early-week workshop, two workshop groups combine for a class size of 100 students. The early-week workshops have a 20:1 student:staff ratio. One of those staff in the early-week session must be a member of academic staff (Lecturer / AP / Prof), who is expected to be present throughout the session. The late-week workshops are staffed solely by teaching assistants, at a 25:1 ratio. 

In addition to these sources of support, a subset of the TAs run 'hatch times' on a rota (one TA staffs the hatch at any given time). These are drop-in times, run every week day during term, until the workshops are over. The hatch is not open during vacation breaks, nor during public holidays. Opening hours vary:

- Hatch (Weeks 0-12 inclusive):  Mondays: 10 – 4, Tuesdays: 10 – 4, Wednesdays: 10 – 1, Thursdays: 10 – 4, Fridays: 10 - 4

After the main report deadline, support for students with Extenuating Circumstances is, until the EC deadline, via the office hours of the TA who worked with them throughout the semester. For TAs paid by the hour, these support hours are claimable. 

### Assessment

The module's mark is based on  20% Practical and 80% Coursework, with no exams, but with pass/fail competency components.

_References to 'week X' mean the Xth teaching week of the semester_. For the 2020/21 Plymouth University timetable, teaching week 1 of semester 2 begins 01/02/2021. 

20% - Group mark for a 10-min group oral presentation. The mark is weighted mainly on the quality of the research presented, rather than audio-visual slickness. There is a detailed quantitative mark scheme. **Occurs during class in Week 10**

80% - Individual mark for an individually-written report. The mark is derived from a detailed quantitative mark scheme. **Due Monday of Week 13**, noon. Return to students Friday of Week 16 (if returning earlier, do not return during the exam period).

Pass/fail - There are a set of pass/fail competency components, which also act as a **lab book**. In order to keep on track students should complete them in the week indicated (see below). **Each activity closes on the Friday of the week following its introduction in class**. In order to complete it after that time, students must request their personal tutor to re-open it. Some of these are group components. In these cases, every member of the group still has to submit it individually, but they can all submit the same thing without penalty.

They have to pass 80% of them to pass the module. 

### List of assessments

A full list of assessments, with proformas and model answers in most cases, are available [here](eg-student.md).

### Resources

We currently anticipate fully-online delivery of this module in 2021, due to COVID-19. Each student will need a _proper computer_ (PC, Mac, or Linux - not a phone, not a chromebook) in all sessions. 

For activities based around R, students will continue to use the RStudio server account they were allocated at Stage 1. They should be prompted a week before the module starts to request login details if they do not have them.

There is an online **lab book** system (see above). 

For activities using Open Sesame, students will need to install this on their machine. There is time in the schedule for them to do this in class. 

For online data collection, the students will need access to a JATOS server, so they can upload their converted OpenSesame experiment. 

### Employability skills

Communication skills. Group working to deadline. Project planning / timetabling. Critical thinking / analysis.

### Ethics

Students write a detailed description of their methods; the discussion and approval of this document by staff provides a practical insight into ethics in these fairly innocuous studies.

<a name="0"></a>

## Week 0: Pre-class preparation

One week before the first class, students must be emailed and requested to:

1. Check they can log in to RStudio Server, and request login details from the Tech Office if they cannot.

2. If they did not complete our Stage 1 for any reason, they must complete the [Very Brief Guide to R](https://https://ajwills72.github.io/rminr/#vbgtr), unless they have done so already.

2. Complete the R [revision worksheet](https://ajwills72.github.io/rminr/revision.html), as the module assumes this information will be fresh in their mind. It should take approximately 30 minutes to complete for most students. MSc/direct entry students will need a bit more time (perhaps 15 more minutes) as they'll need to read some additional material on effect size, which was not covered in the materials they have received to date.

3. Ensure they have access to a _proper computer_ (see above) for each session, and that they have at least a few GB of space left on their hard drive. 

<a name="1"></a>

## Week 1: Select topic and learn about statistical power

### Resources for teachers

- If you're new to R, work through the [Absolute Beginners' Guide to R, part 1](https://ajwills72.github.io/rminr). It should take about four hours.

- If you're new to OpenSesame, watch the video in this
  [tutorial](https://osdoc.cogsci.nl/3.2/tutorials/beginner/), and follow along
  as he does things. It should take less than two hours.
  
### Early-week session:

| min | Contents                                                                                                 |
|-----|----------------------------------------------------------------------------------------------------------|
| 005 | Teacher gets students to start installing Open Sesame |
| 010 | Teacher gives general introduction to PSYC520 |
| 015 | Teacher gives a short introduction to each of the three topics and sub-topics. |
| 030 | Students select topic and organise into groups. TA allocated to groups. Any given TA does one / two topics. |
| 055 | Break      |
| 065 | Students do the [Introduction to OpenSesame](openses_intro.html)  worksheet, with support |
| 115 | Finish                                                                                                   |

_Note 1_: When introducing the topic, teachers should lay the groundwork for students to understand the concept of an interaction.

_Note 2_: This is probably Plymouth-specific, but note that there is one restriction to the principle that students can pick their own groups -- group members must all be from the same exit-level of qualification (i.e. all B.Sc., or all M.Sc.). This is because M.Sc. work is marked to a higher standard, and the presentation is group marked.



### Late-week session

- Students do the [Statistical power](https://ajwills72.github.io/rminr/power.html) worksheet, with support.

- Students agree in their group which sub-topic they're going to investigate.

- Students read and discuss the assigned papers. There are three papers, so each paper gets read by at least two people.

### Homework

- Complete the worksheets.

- Do the first part of the [preprocessing](https://ajwills72.github.io/rminr/preproc.html) worksheet, up to and including running the facial prototypes experiment on yourself.

<a name="2"></a>

## Week 2: Define question, outline design and learn about data preprocessing

### Teachers' resources

Here are some [slides](expt-design.odp) on experimental design written about a decade ago for the Exeter Stage 2 practicals. I think Chris, Clare, or Michael have developed more recent versions for this module. 

### Early-week session

| min | Contents                                                               |
|-----|------------------------------------------------------------------------|
| 000 | Teacher introduces getting from sub-topic to broad experimental design |
| 030 | With TA support, groups define question and plan broad design          |
| 050 | BREAK                          |
| 060 |  Start [Data preprocessing](https://ajwills72.github.io/rminr/preproc.html) worksheet. If they have not already tried out the facial prototypes experiment in OpenSesame, they should skip this part, otherwise they will run out of time                         |
| 110 | Finish                                                                 |

_Note_: In the Teacher's presentation, there should be some focus of understanding the concept of an interaction.

### Late-week session, and homework

- Complete data preprocessing worksheet (allow around 40 minutes for this).

- Complete and submit one-page broad design summary.

<a name="3"></a>

## Week 3: Finalise experimental design

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


### Late-week session and homework

- Complete and submit all previous Psyc:EL activities if not already done so. 

- Finish and submit protocol to Psyc:EL.

- Watch Chris Longmore's video on using Open Sesame.

<a name="4"></a>

## Week 4: Build experiment

### Resources

Students may find this [library](openses_lib.md) of OpenSesame scripts useful.

### Both sessions

Both sessions are dedicated to achieving the following goal: Have a working,
bug-checked OpenSesame script ready to go.

If they forgot to watch the homework video (see above), they have to start by doing that. Then the tasks, which students need to divide between members of the group include: 

- Writing the instructions

- Creating the stimulus sets

- Building the structure in OpenSesame

- Testing for bugs.

- Checking the output is usable.

Each project should meet all the items on this checklist by the first session next week:

- Experiments takes no longer than 15 minutes to run. Check with a stopwatch.

- Open Sesame script runs from beginning to end without crashing, and runs as expected. 

### Homework

- Complete OpenSesame script and submit it.

- Ensure you've met all items on the above checklist

- Watch Chris Longmore's JATOS video


<a name="5"></a>

## Week 5: Upload experiment and begin to learn about ANOVA

### Early-week session

Session is dedicated to getting their experiment working on JATOS. If they've forgotten to watch the homework video (see above), they need to start there.
                                                            
### Late-week session

| min | Contents                                                               |
|-----|------------------------------------------------------------------------|
| 000 | Upload of experiment to JATOS |
| 050 | Complete [within-subjects differences](https://ajwills72.github.io/rminr/anova1.html) ANOVA worksheet |
| 110 | Finish |


#### Advice: "Last working version" debugging of R code

If a student's command in R is not working but is individually correct, then they have likely made an error at a previous step. This might have involved ignoring an earlier error message, or it might have involved doing something that was wrong but didn't immediately generate an error (like mis-naming a new variable). 

In these circumstances, you do 'last working version' debugging. In other words, go back through their previous commands until you find the error - the worksheets generally tell you what is expected as output at each step. 

### Homework

- Complete upload to JATOS if not already done so.

- Submit ANOVA exercise in not already done so.


<a name="6"></a>

## Week 6: Collect data and finish learning about ANOVA

### Early-week session

| min | Contents                                              |
|-----|-------------------------------------------------------|
| 000 | Complete [Understanding interactions](https://ajwills72.github.io/rminr/anova2.html) worksheet |
| 060 | BREAK |
| 070 | Data collection support |
| 110 | Finish |

**Data must be collected only from other students enrolled on the module.** Students can act as participants at any point across weeks 6 and 7, during or outside class. However, there are 10 hours of class time scheduled for 'data collection support' to facilitate this. Data collection support, from the teachers' perspective, involves two activities:

1. Giving each group a list of JATOS links for experiments that each member of the group should participate in. 

2. Troubleshooting/facilitating the process of data collection. 

### Late-week session

| min | Contents                                              |
|-----|-------------------------------------------------------|
| 000 | Complete  [Factorial differences](https://ajwills72.github.io/rminr/anova3.html) worksheet |
| 040 | BREAK |
| 050 | Data collection support |
| 110 | Finish |

## Homework

- Complete any outstanding activities.



<a name="7"></a>

## Week 7: Finish data collection

Both sessions are dedicated to the completion of data collection, plus any support students need for any R worksheet. 


<a name="8"></a>

## Week 8: Analyse data

Both sessions are dedicated to analysing and interpreting the collected data. Data analysis should ideally be submitted to Psyc:EL by the end of the week. 

<a name="easter"></a>

## EASTER BREAK

There is a now a four-week hiatus for Easter Vacation. The module is paused, and no support is available; questions must be held over until the beginning of term. 

<a name="9"></a>

## Week 9: Write a presentation

### Early-week session

There are two components to this session:

1. Supporting analysis (if not yet completed, see above), and interpretation of that analysis
2. TA-led support for presentation planning (see Notes).

The order and relative emphasis of these activities will likely differ between groups. 

Note 1:

TA and group reprise what they did, what they have found, and discuss any
problems/limitations of what they have done. TA then leads discussion of
examples of very clear, and very unclear, lectures they have encountered since
joining Stage 1. What do these good/bad experiences have in common? Possible
issues - Rate of presentation; incorrectly assumed knowledge; over-crowded
slides; a million facts but no big picture; a big picture but no facts;
conclusions do not clearly follow from facts. Then, TA supports group to
sub-divide the task of writing a presentation between them. The sections would
be something like: (A) Big picture overview, (B) Introducing the specific
question, (C) Methodology, (D) Results, (E) Interpretation, (F) problems and
next steps, (G) writing an abstract. Agree an allocation of time and number of
slides each.

Note 2:

Each group must be allocated a one-hour presentation slot for week 10. Approximately one-third of groups will present in their early-week session, and two-thirds in their late-week session (of which, from an instructor perspective, there are two per early-week session). With table group size of 7, each early-week workshop group will have approx. 14 groups to distribute across the six available one-hour slots. Sort which groups go when during week 10, and post the allocations to the DLE before the week 9 late-week session. Use the flexibility of having two sessions (from the student's perspective) to accommodate groups who have serious reasons for not being able to make one of the sessions (e.g. funeral of a close relative). If we can't accommodate this, then absent members have to present on their own in week 12, and they only get the opportunity to do that with a formal extenuating circumstances approval. 

Note 3:

Students should be expected to produce graphs that have proper labels that are of a readable size. Some of the things they need to know about this are covered in the Absolute Beginners' Guide, but the best source is the [Better Graphs](https://ajwills72.github.io/bettergraphs.html) page.


### Late-week session

This session is dedicated to ensuring all groups are ready for the week 10 presentation. This may include: 

- Finish data analysis if not already done so, and submit analysis script.

- Write presentation

- Practice on other groups, TAs, and reflect.

Students should submit presentation title, author names, and abstract by **end of the late-week session**. 


<a name="10"></a>

## Week 10: Give presentation

All the sessions this week are identical -- each is staffed by one TA and one
Teacher (who double mark). In each workshop hour, 2-3 groups present. Assuming a 10 minute
presentations, 3 min for questions and informal feedback, 2 min for switch
over, there should be spare time for 'issues', even with 3 groups. 

### Marking process for group presentations

During the session itself, focus on giving frank feedback that will help them with the next stage of this module. You can also give presentational feedback, of course.

Immediately after the end of each session, the Teacher and TA agree component scores and feedback for each group. The Teacher then immediately emails the agreed [scores/feedback CSV file](mark-process/feedback.csv), and the [groups/attendance CSV file](mark-process/groups.csv) to the module leader. Note that you do not assign an overall grade, this is done during moderation, although if you have a suggested grade for the groups, feel free to put those in the body of the email. It is important that correctly formatted CSV files are used because much of the subsequent process is automated. The links give examples of the format needed. In particular:


Group_ID: Use their self-assigned group name, but it must be unique for each group and consistent within a group. If they didn't give themselves a name, assign a bland one (e.g. Workshop3Group4). **It is absolutely VITAL that you use the SAME Group_ID in the two CSV files (feedback.csv and groups.csv)**. For example do not use, "W3G2" in one file, but "3.02" in the other file.

PU_email: Give their full Plymouth University email address. Do not give their name (names can be non-unique, and emails make it easy to email feedback). You can find the email address for any student enrolled on the module using the classlist system (accessible via S4). 

present: 1 = present, 0 = absent. It's important to explicitly record the absent, as well as the present, students in each group. 

Component: Use these exact words to describe the mark components. **It's really important that you do not mis-spell the Components, e.g. "Clairty of speech", because the script will treat this as a different component.** Also: **USE ALL COMPONENTS FOR ALL GROUPS**. It is not OK to, for example, drop the "advice on next steps" row if you don't have any advice. 

Score: Use 1, 2, 3, 4, or 5.  1 = Poor, 2 = Patchy, 3 = OK, 4 = Good, 5 = Excellent. **Zero is not a valid score**.

Feedback: Write what and as much as you like, but don't use formatting (bold etc) and don't use carriage returns - just keep typing on a single line. Apologies for the following basic advice, but it's all based on errors from the first time we ran this: (1) Start all your sentences with a capital letter, (2) avoid spelling and grammatical errors, (3) avoid abbreviations, (4) avoid note form, (5) if it's a question, use a question mark -- these comments are passed directly to students without editing!

Empty rows: There should be no empty rows anywhere in the completed files (e.g. do not separate groups with empty rows). 

NA: The only place "NA" should appear is for the score for "advice on next steps". It is not a valid feedback comment, for example. Also note that N/A is not the same as NA. Use only the latter. 

Once the Module Leader receives files from all sessions, they moderate, and return overall grades and feedback to the students via email. The ML also uploads overall grade to the DLE. These processes are largely automated by R scripts.

Students are not required to upload their presentations to the DLE.

#### Marking PSYC720

Although PSYC520 (a B.Sc. module) and PSYC720 (a M.Sc. module) were co-taught,
the marking of the presentation is done entirely separately, with different
marking criteria. Given you do not award a grade, much of this process is handled 
during moderation. However, there are still some important differences:

- Give less 'benefit of the doubt': So, in an UG presentation you might find something unclear but be able to work it out eventually (perhaps because you are familiar with the project). In these cases we tend to give some 'benefit of the doubt' in
that we assume the student meant the right thing and just didn't express it that well. For an M.Sc. student, don't try so hard to work out what they are saying. If it's unclear, treat it as if it is wrong.

- We expect a higher standard of spoken (and visual) expression at M.Sc. level. At B.Sc. level, in some weaker cases the quality of speech or slides is not that great. And, at B.Sc. level, we would try quite hard to see beyond that to the substantive content. For an M.Sc. piece of work, we expect consistently good-quality speaking and supporting visuals that shouldn't need to be 'decoded' into a clear presentation by the listener.



<a name="11"></a>

## Week 11: Write a report plan

### Early-week session

| min | Contents                                                          |
|-----|-------------------------------------------------------------------|
| 000 | Presentation feedback and reflection                              |
| 050 | BREAK                                                             |
| 060 | Talk on report writing                                            |
| 110 | Finish                                                            |

In the first hour, the group and TA reflect on their results, and the feedback received
on their presentation. They discuss what they would have done differently if
they were starting again. In the second hour, the Teacher gives a talk on report writing. 

Here are some [slides](report-writing.odp) on report writing I put together for
a similar course at Exeter about a decade ago. I think Michael now has an
updated version of these.

### Late-week session and homework

Students write and submit a bullet-point plan for their report, with support.


### Homework

- Complete and submit bullet-point plan.

- Read the good/bad reports used in Week 12.



<a name="12"></a>

## Week 12: Critique and support

The end of the late-week session in Week 12 is the **last** opportunity for students to receive support on this module (unless they have Extenuating Circumstances, in which case support continues through the office hours of their TA). It's important to make clear to students that this means all forms of support, including email, are over by the end of the second session. Between then and the Monday Week 13 deadline, they are on their own. 

### Early-week session

| min | Content                                              |
|-----|------------------------------------------------------|
| 000 | TA-led good-and-bad reports activity (see Note 1)    |
| 050 | BREAK                                                |
| 060 | TA-led discussion of bullet point plans (see Note 2) |
| 110 | Finish                                               |

Note 1: Groups are given one example 1st class and one example 2ii report. Can
they tell why those two reports differed in mark? What are the good points of
the 1st class report? Where did the 2ii report go wrong?

Note 2: All groups working with a TA get together.  Each group, with an
audience of that TA's other groups, talks through their bullet point
plan. TA and other groups provide feedback on what they found clear / unclear.

## Late-week session

An open Q&A, and support session, so students are best prepared to write their
report. In there is time, or a lack of queries, support them in the following: 

[APA referencing](https://plymouth.libguides.com/APA)

[Common issues of grammar and style](grammar.html)


<a name="13"></a>

## Week 13-15: After the workshops end...

### Hatch support

The TA hatch remains open every week day, until the EC deadline passes, to handle queries.

### TA guide to marking the main report

TAs mark the reports of the groups they led (normally around 20 reports). The
total time this takes should not exceed one hour per report (excluding breaks,
which you should take regularly). It's likely you will get faster with
practice, but if your average over the first five reports is substantially more
than an hour, speed up (e.g. write briefer comments). For TAs on an hourly rate,
report marking is paid at one report per hour.

In addition, allow two hours for the initial markers' meeting and the preparation required for it.

#### Timetable

**Thursday 20th May 2021, noon** - Submission deadline passes. Module leader sends marking sample to markers. Markers must not mark any further reports until after the EC deadline, below.

**Thursday 27th May 2021, noon** - Markers return marking sample with scores, but without feedback, to module leader.

**Friday 28th May 2021, 1pm** - Initial markers' meeting between all markers and module leader.

**Friday 4th June 2021, noon** - Extenuating Circumstances deadline passes. Reports available for marking.

**Monday 14th June 2021, noon** (HARD DEADLINE!)  - All reports marked and uploaded to DLE. All mark spreadsheets emailed to Module Leader. Process of moderation begins.

**Wed 16th June 2021** - Reports and marks are returned to students via DLE. 

#### Marking process

The marking process is as follows:

1. On the day of the main deadline (20th May 2021), every marker receives the same four reports to mark. Unlike all subsequent marking, you do not write feedback on these reports. You just read the report and allocate the 25 scores using the score spreadsheet (for details, see below). This should not take you more than about 20 minutes per report. 

2. Within one week, email your marks for these four reports to the module leader.

3. You'll then have a single, 30-minute, Zoom meeting with all markers and the module leader to discuss how we all have marked these four reports. The module leader will have also marked the reports. The purpose of this meeting is to ensure you are all marking to the same standard.

4. After the EC deadline has passed, download your set of reports from the DLE. **Do not** download any reports before this date, they could still change. 

    4.1. The DLE is set up so that you can select your name and hence just the reports you are marking. 

    4.2. Use the 'download as zip' functionality, which enables you to download all reports as a single zip archive. Then extract everything from the zip archive and work on the extracted version. 
  
    4.3. If you worked in Clare Walsh's workshop, some of your students were registered for PSYC720 (M.Sc. Psychology), not PSYC520 (B.Sc. Psychology). So, you'll have to download from both the PSYC520 and PSYC720 DLE pages. It's vitally important that you keep your files for PSYC720 students entirely seperate from those of PSYC520 students, and that you mark PSYC720 after you mark PSYC520 (see below for the reason).
    
    4.4. If any of your reports were in the original marking sample (above) then you will may to re-mark them, as they may have changed. The DLE gives the date of the last submission, so you can check.

5. Mark the report in the usual way:

    5.1. Use a PDF annotation tool to add helpful, specific, supportive comments as you go. Your comments must appear as directly visible elements on the page
    : not, for example, 'pin' elements which the reader has to hover their mouse over to reveal your comment. Such interactive elements do not work on all 
    devices, leading to complaints from students that they have not received feedback. There is a reason students are told to leave a wide right margin and
    to double space their work (i.e. in order to leave space for your comments). Make use of the space they have made for you.

    5.2. Do not use sarcasm. Do not belittle. Don't write anything you wouldn't want to receive on your work. If something is wrong, say so, but also say what is right.
 
    5.3. The [mark scheme](eg-student/report-mark-scheme.html) indicates the sorts of things you should be giving feedback on.

6. As you mark, fill in the [scores CSV file](mark-process/report-feedback.csv):
  
    6.1. This contains an example student, obviously remove this before returning the CSV file to the Module Leader. More generally, this file is automatically read, so it's really important you get the format exactly right. So:

     6.2. Use a single file for all your marking within the module (not one file per student).

    6.3. **It is vital** that the _Identifier_ column contains the student identifier _exactly_ as it appears in the zip file you downloaded from the DLE. You will probably find that this is the name of the directory (folder) that contains the report, with one directory for each report. So, if it says "Participant 10735888", put that, not e.g. "10735888" or "Participant_10735888". Do NOT put the Student Reference Number in the _Identifier_ column. Do NOT type in these numbers by hand, ALWAYS copy and paste. Typing in by hand leads, across 200+ reports, to various copy errors, which are devilish to fix, particuarly if your error is actually also a valid Identifier. 
  
    6.4. Always fill in the _SRN_ column. This is the unique Student Reference Number, which the student has written at the top of every page of their report. If they've forgotten to include it, write "NA" (not N.A. or n/a, etc.). The SRN provides a useful backup way of linking these anonymous reports back to the student should something go wrong with the DLE.
  
     6.5. In the _Score_ column, put a number from 1 to 5. Only use these numbers. Do not use fractional numbers. Do not use zero. Do not use NA. The numbers have the following meanings: 1 = Poor, 2 = Patchy, 3 = OK, 4 = Good, 5 = Excellent

     6.6. In the _Component_ and _Description_ columns, use the descriptions **exactly** as they appear in the example. Use copy-and-paste to ensure you do not make mistakes.

      6.7. Do not leave any blank cells. So, for example, the SRN should appear on every line for that student. Use _copy down_ in your spreadsheet application to ensure you don't make errors. Exactly how this works depends on your application, but for LibreOffice Calc and Microsoft Excel, highlight the cells you want to fill with the contents of the first row and press Ctrl+D.
  
    6.8. Do not leave any blank lines.

7. When you have finished reading and commenting on the report, fill in the
  'overall comments' section on the cover sheet. You should aim to say three
  ways in which the report was good, and three ways in which it could have been
  improved. Your scores CSV file should help you decide what to write here.
  
8. When you've finished annotating the PDF, ensure you've saved it, _flattened_,
  into the same folder, and overwriting the original file (i.e. same file
  name). 
  
    8.1. If you don't know how to produce a flattened PDF within your preferred PDF annotation tool, then use the Print to PDF functionality that is present on all major OS (Windows, Mac, Linux). PDF flattening is important, because not all devices can read PDFs properly unless they're flattened, and your document may give the appearance of having no comments on it. This is particularly a problem for Android / iOS smartphones and tablets, which quite a few students use as their primary device.

9. Note that **you do not assign an overall grade**, this is done during
  moderation, although if you have suggested grades, feel free to tell me what
  they are (in an email, not on this sheet). If you are curious about the
  process of moderation, including how number marks are mapped to letter
  grades, the R script is available in the github repository for this site -
  see `scripts/report-marks.R`.
    
10. When you have marked ALL your reports, use the 'upload zip' functionality on
  the DLE to upload your marked reports to the DLE. At the same time, send Andy
  Wills your marks CSV file. 

11. If any matter arises that is not covered by the marksheet - for example evidence
of plagiarism, collusion, or violation of formatting or page length rules - let
Andy know via email of your concerns, then mark as if you had not noticed these issues.
As module leader, Andy will consider each of these exceptional cases and take
appropriate action.

#### Marking PSYC720

Although PSYC520 (a B.Sc. module) and PSYC720 (a M.Sc. module) were co-taught,
the marking of the main report is done entirely separately, with different
marking criteria. Given you do not award a grade, much of this process is handled 
during moderation. However, there are still some important differences:

11. Mark PSYC520 first, so you have a clear picture of the average standard of B.Sc. work.

12. Now mark PSYC720. Relative to your B.Sc. marking you should:

    12.1. Give less 'benefit of the doubt': So, in an UG report you might find something unclear but be able to work it out eventually (perhaps because you are familiar with the project). In these cases we tend to give some 'benefit of the doubt' in
that we assume the student meant the right thing and just didn't express it that well. For an M.Sc. student, don't try so hard to work out what they are saying. If it's unclear, treat it as if it is wrong.

    12.2. We expect a higher standard of written (and graphical) expression at M.Sc. level. At B.Sc. level, in some weaker cases the quality of English is not that great. And, at B.Sc. level, we would try quite hard to see beyond that to the substantive content. For an M.Sc. piece of work, we expect consistently good-quality writing that shouldn't need to be 'decoded' into a clear expression by the reader.

### After marking

After the marking is complete, the ML runs a statistical moderation process (for details, see the `script` folder in the github repository for these pages), and then uploads the marks to Moodle (the DLE). The final step for the module team is to release the marks to the students (again done by the ML). This done via Moodle, folllowing [these instructions](moodle-mark-release.md). From this point, the marks are imported into the university's record system ("Unit-E") by Faculty administrative staff, for preparation of exam board materials. 
