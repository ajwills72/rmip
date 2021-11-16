# Building An Experiment In OpenSesame

_Chris Longmore_

## Introduction

In the workshops during Week 4 of the module you will be building your own experiments in OpenSesame from scratch. To help you prepare for this, this worksheet works through creating an experiment. The experiment is rather simple and is described below. It is meant not so much for you to base your own experiments upon the experiment we produce, but rather to introduce you to the concepts used by OpenSesame. The process, including what the experiment is, is covered in a video below. This video is a little over an hour long, so block out some time to complete it. If you are a ChromeBook user who cannot run OpenSesame, it is still worth watching the video and making notes so that you can contribute ideas to your group.

## Why An Online Worksheet?

A common question we have received is why we are running this introduction to OpenSesame outside of the timetabled sessions. The answer is that we appreciate that many students are studying using a laptop with a single, sometimes small, screen. It is very difficult to keep the Zoom call showing the demonstration, your OpenSesame window, and desktop files in view all at once. By using the video method here, you can watch part of the video, then move over to OpenSesame whilst the video is paused, and then return to the video to continue. This I hope will make the task much easier. **Support is available in the timetabled sessions, at the additional OpenSesame sessions on Wednesday afternoons, and from the TARAs, so if you get stuck do not worry - bring those questions to us and we will help you**.

## Variables And Loops

Before we even begin discussing OpenSesame there is a couple of concepts that you need to be introduced to - loops and variables. The computer implementation here is not important. It is just the concept of what a variable is and what a loop is that is important.

### Loops

Imagine you work in an office and have a particular task to do. This task involves taking the prices of 50 products, and adding VAT at 20% onto the price. So you start by looking at the first price, work out what 20% of that value is, add the value onto the original price and writing down what the new cost is. To do the calculation of the next price, you begin the cycle again; look at the second price, work out 20% of the value, add that onto the original value and end up with the final price. So the cycle, or to put it another way, loop continues until you have calculated all of the prices. This is so boring you think. So you decide to program a computer to do the task for you. You could approach this from what is known as a _hardcoded_ approach. You write some code to calculate the price of the first item. You then write some code to work out the price of the second item and so on. By the time you finish you might have well just done the task manually as you originally did!

The fact that there was a loop of set steps you went through in your original calculation method can be exploited here - after all the loop is the same: take some value (lets call it _price_), and apply a set known of steps to this value.
Programming uses this the term **loop** to mean exactly this. A loop is run through a set number of times performing the same commands each time. How many iterations for our loop? Fifty - as that is the number of products we need to price. What happens on each pass through the loop? We take the value of product, work out 20% of the value, and add that back to the original value.

### Variables

_price_ as mentioned in the example above is a variable. A variable is the name of something that can change its value, or, in other words, something that varies. You might remember your maths teacher regularly saying things like, _x = 3_. In this case, _x_ is a variable. Likewise, you might also remember the equation _y = ax + b_ from your schooldays. Here, _y_, _a_, _x_ and _b_ are all variables - they can take different values. Returning to our pricing example, on the first time through the process, _price_ might represent the value £10.49. On the second time through it might represent the value £302.12, and so on.

So, by using a loop with variables, we have simplified the task substantially. In fact, all we need to do is feed the loop with a list of values, run the program, and then knock off work early.

This session on OpenSesame is not about programming. However, the concept of variables, such as _price_ is a very important one in OpenSesame. The reason this is important in OpenSesame is that on each trial there will be something you probably want to be different. For example, you would not want to run an experiment on face recognition in which every trial shows the same face. Instead you want the face to change, or, to use the alternative term, vary. As the face is changing on every trial in a similar fashion to the way _price_ changes in the example above, variables are very useful when producing an OpenSesame experiment. If you understand the general concept of variables, creating the experiment itself will make much more sense as you will be able to see what is happening on every trial.

## Our Demo Experiment

Let's say that we want to find out if people are able to identify the sex of a domestic cat from looking at its face. To find this out, we could present participants with a series of images of different cats and ask them if they think that the cat is male or female. This sort of experiment is very easy to implement in OpenSesame and this is what we will be doing in this worksheet. This study is a variation on a study that was published a few years ago. You can view the paper [here](https://journals-sagepub-com.plymouth.idm.oclc.org/doi/pdf/10.1068/p2884) (you may need to log in) if you are interested.

### Preparation

Before the watching the video, download the cat face pictures from [here](images/cat_face_photos.zip). This file is a ZIP archive file. macOS users can simply double-click on the downloaded file and it will decompress. Depending upon your browser, it might even decompress the file when you have finished downloading. Windows users should find the downloaded file, right click on the file, and select _Extract All_ and follow the instructions.

Once you have extracted the pictures (they will probably be placed in a folder called _cat_face_photos_), copy the folder that contains them to your desktop for easy finding during the video.

## Building The Experiment

This [youtube video](https://youtu.be/tw5W_qGcgBc) goes over how to create an experiment in OpenSesame. Note that the first part is about the design of the study and OpenSesame is not in sight. Make sure you are comfortable with what the experiment is supposed to look like before beginning the OpenSesame section. Work along with me in the video and by the end you should have a working OpenSesame experiment. If you have any difficulties, bring along your questions to the first PSYC520/720 workshop session in Week 4.

 **Please note: any reference in the video to Week 3 of the course should be taken to mean Week 4. Second, in the explanation of the experiment design I included a fixation point into the design, yet in the experiment creation part of the video I do not include this. As a check for your own understanding, you might want to try to insert this extra display after you have got the experiment working**.


## After Completing The task

After going through the video you should have a complete working experiment. You do not need to upload this anywhere, but it is a good idea to keep it available if you need to refer to it when creating your own experiment.
