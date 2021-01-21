<a name="change"></a>

## For next year...

- Change Psyc:EL such that it is possible for staff to reset a passed activtiy from the main web interface. This is to deal with the case where a student notices they have uploaded the wrong thing, but the auto-marking does not, and the student requests to fix the issue.

### Notes on loaned laptops

These notes refer specifically to the laptop loan system operating in Link 301, Plymouth University.

- If at all possible, don't use the loaned laptops for testing! It will make your life and everyone else's more complex. Bring your own laptop unless you do not own one and cannot afford to buy one.

- If you have to, then get your Open Sesame script installed on a specific loaned machine,  and note the machine's number so you can pick up the same one next week.

- Note that if using OpenSesame on loaned laptops for the first time, you will have to log in, log out and log in again before OpenSesame will work. 

- Also note that, on loaned laptops, you cannot open an OpenSesame script directly from your email. You must download it from your email, then open the OpenSesame program, then use that to open the downloaded file.

### Optional third session

- Run ONE (i.e. not one per workshop group, one in total) third two-hour session after the low-intensity session, as a final opportunity to collect additional data from members of other workshop groups, for those who need to do this to hit their data collection target. This session should not be needed if everything runs to plan, but it's useful to have it as a backup, as it's unlikely everything will run to plan for all groups!

### Notes on data collection (in person)

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


## OLD Week 6: Analyze data and prepare presentation

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




## OLD Week 7: Give group presentation

### High intensity and low intensity sessions



## Homework

- None!


## OLD Week 8: Modify, and start to rebuild, experiment

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

## OLD Week 9: Finish experiment rebuild and start to collect data

### High intensity session

The whole session is dedicated to achieving the following goal:
Have a working, bug-checked OpenSesame script ready to go.

### Homework

- Complete OpenSesame script and submit it.

### Low-intensity session

Data collection.


## Old week 10

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

## OLD Week 11: Analyze data and start report plan

One 'gotcha' here might be the combination of the two datsets into one in order to be able to do the factorial ANOVA. Basically, all you need to do is use the same sorts of commands you did in the preprocessing worksheet to add a column that contains the Experiment ID, and then combine the two data frames as before. Note that you may need to set the appropriate columns as factors again after doing this.

### Low-intensity session

- Finish and submit analysis script.

- As a group, write and submit a bullet point plan for the report.

### Homework

- Read the good/bad reports used in Week 12.
