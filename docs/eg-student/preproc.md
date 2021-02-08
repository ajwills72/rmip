# Preprocessing

Cut and paste your R commands to preprocess the data from the worksheet exercise:

----

You can find a model answer in the worksheet [source code](https://github.com/ajwills72/rminr/blob/master/src/preproc.Rmd)

----

_AUTO MARKING_: Accept any entry that meets all of the following conditions:

(a) More than 10 lines 

(b) Less than 30 lines

(c) Contains ALL of the following strings: 


lexdat <- tibble(filename=list.files("lexdec", pattern = "csv", full.names=TRUE)) %>% 
  group_by(filename) %>% 
  do(read_csv(.$filename)) 
lexdat.tidy <- lexdat %>% 
  select(subject_nr, practice, live_row, category, correct, response_time) %>% 
  set_names( c("filenamme", "subj", "practice", "trial", "type", "acc", "rt"))
lexdat.tidy %>% 
  filter(practice == "no") %>% 
  filter(acc == 1)  %>% 
  group_by(subj, type) %>% 
  summarise(mean(rt))

- [x] do 

- [x] list.files

- [x] read_csv

- [ ] bind_rows 

- [ ] colnames

- [x] filter

- [x] group_by

- [x] summarise

- [x] select

When throwing an error, give an error message (e.g. "no group_by") 
