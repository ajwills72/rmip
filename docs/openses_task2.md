# Building An Experiment In OpenSesame 

_Chris Longmore_

## Introduction

In the workshops during Week 3 of the module you will be building an experiment in OpenSesame from scratch. The experiment is rather simple and is described below. It is meant not so much for you to base your own experiments upon the experiment we produce, but rather to introduce you to the concepts used by OpenSesame. We begin by looking at something from the [data preprocessing](https://ajwills72.github.io/rminr/preproc.html) worksheet.

## Variables

Variables are an important concept not just in programming, but also in OpenSesame. Whilst you do not do any coding in OpenSesame, but you will still need to use variables. Thus, to begin this worksheet, we will look at them again.

In the data preprocessing worksheet you saw how to combine multiple files together using what is known as a **for loop**. The code that did this is this:

	for(fnam in fnamlist) {
  		dat <- read_csv(fnam)
  		alldat <- bind_rows(alldat, dat)
	}
		
In this example _fnamlist_ contained three items: "subject-11.csv", "subject-12.csv", "subject-13.csv". The line: _for(fnam in fnamlist)_ tells R that we want to loop through the code that is given between the curly brackets a number of times and the number of times is given by the length of fnamlist - namely three. On each loop (or more technically, _iteration_), fnam takes on a different value. On the first time through the loop fnam is set to the first item in fnamlist (subject-11.csv). On the next time through the loop fnam is set to the second item in fnamlist (subject-12.csv). On the final time through the loop fnam is set to the third and last item in fnamlist (subject-13.csv).

This session on OpenSesame is not about R programming. However, the fact that fnam is changing on each cycle through the loop is an example of a very important concept in OpenSesame; the idea of variables. Variables can change and be set to different things. We can then look at what is contained in a variable to see it current value. The reason this is important in OpenSesame is that on each trial there will be something you probably want to be different. For example, you would not want to run an experiment on face recognition in which every trial shows the same face. Instead you want the face to change, or, to use a different term, vary. As the face is changing on every trial in a similar fashion to the way fnam changes in the R example above, variables are very useful when producing an OpenSesame experiment. If you understand the general concept of variables, creating the experiment itself will make much more sense as to what is going on.

## Our Demo Experiment

Let's say that we want to find out if people are able to identify the sex of a domestic cat from looking at its face. To find this out, we could present participants with a series of images of different cats and ask them if they think that the cat is male or female. This sort of experiment is very easy to implement in OpenSesame and this is what we will be doing in Week 3's workshop.

### Preparation

Before the workshop, download the cat face pictures from [here](images/cat_face_photos.zip). This file is a ZIP archive file. macOS users can simply double-click on the downloaded file and it will decompress. Depending upon your browser, it might even decompress the file when you have finished downloading. Windows users should find the downloaded file, right click on the file, and select _Extract All_ and follow the instructions.

Once you have extracted the pictures (they will probably be placed in a folder called _cat_face_photos_), copy the folder that contains them to your desktop for easy finding during the workshop.

Also, make sure that OpenSesame is running correctly on your laptop.

## Building The Experiment

In workshop 3 we will go through, step by step, how you create the cat faces experiment. There are a number of steps and it is easy to forget a step that can throw everything out however. Therefore, after the workshop, this section of text will be modified and a video inserted going over the steps again.