# Users guide

This guide will explain how to open and use this package.

First, in order to get it running, use the following codes one at the time inside the R console:

install.packages('devtools')

library(devtools)

install.packages('nlme')

library(nlme)

install_github("FlorisRoelofs/polya")

library(Polya)

Now you have installed the package.

############################### EXTRA PACKAGES #######################################

In order to run the simulation, be sure to have shiny, shiny dashboard and ggplot installed.
If you haven't, please do so by running the following code:

install.packages('shiny')          # Instal shiny

library(shiny)                     # Load shiny

install.packages('shinydashboard') # Instal shiny dashboard

library(shinydashboard)            # Load shiny dashboard

install.packages('ggplot2')        # Instal ggplot

library(ggplot2)                   # Load ggplot2

############################### INTRODUCTION #########################################

In this application we are trying to simulate a model known as the Polya urn model. In this model, objects of real interest (such as atoms, people, cars, etc.) are represented as coloured balls in an urn or other container. This urn contains x red and y blue balls; one ball is drawn randomly from the urn and its colour observed; it is then returned in the urn, and an additional ball of the same colour is added to the urn, and the selection process is repeated. Thus, every time a ball is observed, an additional ball of the same colour is added to the urn. Hence, the number of total marbles in the urn grows. Questions of interest are the evolution of the urn population and the sequence of colours of the balls drawn out. 

This model has many applications. Here, the balls represent previous memories and how they influence learning behaviour. For instance, imagine learning to play the piano. When you start learning a song, you might have two failing attempts then you take a lesson and you learn how to play your song for the first time. Now you have a total of three memories of playing the song; two incorrect experiences and one correct. In our model the balls represent these experiences in the form of memory traces. All the blue balls represent correct previous experiences and the red balls incorrect ones. Now you want to play this song for the fourth time, to do this correctly you have to sample from your earlier experiences and hope retrieve the experience when you correctly played the song (grab a blue ball). 

Based on this simple learning scheme, how does your skill develop? On the long term, will you be able to learn to play the song and, what factors will influence this development. That is exactly what we will try to figure out with this simulation.

############################### FUNCTIONS ############################################

This package contains a total of 8 functions:

1. polya() : 
To open the simulation, simply run the polya function by typing 'polya()' inside the console

Next to this simulation, there are also small individual functions of the polya model:

2. polya_red_blue(N):
This will run the standard polya model where N stands for the amount of experiments. The output will be a plot of the proportion blue balls over 200 picks.

3. polya_red_blue_blue(N):
This will run the polya model where two blue balls will be added and only one red ball. N stands for the amount of experiments. The output will be a plot of the proportion blue balls over 200 picks.

4. polya_streak(N):
This will run the polya model where any streak of the same 3 couloured balls will be doubled in the urn. N stands for the amount of experiments. The output will be a plot of the proportion blue balls over 200 picks.

5. polya_life_events(N):
This will run the polya model where at the half point of the amount of experiments, 50% of all previous picks become either red or blue. This will be random. N stands for the amount of experiments. The output will be a plot of the proportion blue balls over 200 picks.

6. polya_decay(N)
This will run the polya model where after each 10 picks, 5 random balls will be deleted from the urn. N stands for the amount of experiments. The output will be a plot of the proportion blue balls over 200 picks.

7. polya_all(N)
This will run the polya model where all functions 2-6 are incorperated. N stands for the amount of experiments. The output will be a plot of the proportion blue balls over 200 picks.

8. polya_three_colours(N)
This will run the standard polya model where there are three colours inside the urn (blue, red and white). N stands for the amount of experiments. The output will be a plot of the proportion blue balls over 200 picks.
