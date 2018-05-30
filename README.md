# Users guide

This guide will explain how to open and to use this package.

First, in order to get it running, use the following codes one at the time inside R:

  install.packages('devtools')

  library(devtools)

  install_github("FlorisRoelofs/polya")

  library(Polya)

Now you have installed the package.

##################################################################

In this application we are trying to simulate a model known as the Polya urn model. In this model, objects of real interest (such as atoms, people, cars, etc.) are represented as coloured balls in an urn or other container. This urn contains x red and y blue balls; one ball is drawn randomly from the urn and its colour observed; it is then returned in the urn, and an additional ball of the same colour is added to the urn, and the selection process is repeated. Thus, every time a ball is observed, an additional ball of the same colour is added to the urn. Hence, the number of total marbles in the urn grows. Questions of interest are the evolution of the urn population and the sequence of colours of the balls drawn out. 

This model has many applications. Here, the balls represent previous memories and how they influence learning behaviour. For instance, imagine learning to play the piano. When you start learning a song, you might have two failing attempts then you take a lesson and you learn how to play your song for the first time. Now you have a total of three memories of playing the song; two incorrect experiences and one correct. In our model the balls represent these experiences in the form of memory traces. All the blue balls represent correct previous experiences and the red balls incorrect ones. Now you want to play this song for the fourth time, to do this correctly you have to sample from your earlier experiences and hope retrieve the experience when you correctly played the song (grab a blue ball). 

Based on this simple learning scheme, how does your skill develop? On the long term, will you be able to learn to play the song and, what factors will influence this development. That is exactly what we will try to figure out with this simulation.

