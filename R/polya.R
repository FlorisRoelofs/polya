#' polya urn function, call with polya()
#' @param idk
#' @return value
#' @export

polya = function(){

  install.packages('shinydashboard') # Instal shiny dashboard
  install.packages('shiny')          # Instal shiny
  install.packages('ggplot2')        # Instal ggplot
  library(shinydashboard)      # Load shiny dashboard
  library(shiny)               # Load shiny
  library(ggplot2)             # Load ggplot2

  ui <- dashboardPage( skin = 'green',                                                                  # creat UI
                       dashboardHeader(title = 'Tracing Memory Traces',titleWidth = 230),               # set main title and size
                       dashboardSidebar(
                         sidebarMenu(
                           menuItem('Introduction' , tabName = 'nul', icon = icon('hand-peace-o')),     # creat side menus with names, and icons
                           menuItem('Standard Model' , tabName = 'een', icon = icon('info-circle')),
                           menuItem('Positive Feedback', tabName = 'twee',icon = icon('info-circle')),
                           menuItem('Critical Moments', tabName = 'drie',icon = icon('info-circle')),
                           menuItem('Life Events', tabName = 'vier',icon = icon('info-circle')),
                           menuItem('Decay', tabName = 'vijf',icon = icon('info-circle')),
                           menuItem('Testing', tabName = 'zes',icon = icon('gamepad'))
                         )
                       ),
                       dashboardBody(
                         tabItems(


                           # tab 0 Introduction
                           tabItem(tabName = 'nul', fluidRow( h1('Welcome to this simulation'),         # provide title of the first page
                                                              htmlOutput('summary0')                    # set variable name for summary0 text box
                           )),


                           # tab 1 Standard Model
                           tabItem(tabName = 'een', fluidRow(
                             box(sliderInput("urn_size", "Starting Urn Size:", min = 2, max = 100, value = 2)),               # Initialize parameters (urn size, n_picks & n_experiments) with their range
                             box(sliderInput("n_picks", "Amount of Picks:", min = 2, max = 300,value = 100)),
                             box(sliderInput("n_experiments", "Amount of Experiments:", min = 1, max = 300,value = 100)),
                             tabsetPanel(
                               tabPanel("Summary", htmlOutput('summary1'),br(),                                                        # create summary tab and set variable name for summary1 text box and a break
                                        box(selectInput('test1', 'Do you think that the outcome distribution is normal distributed?',  # create multiple choise test
                                                        c('-Please select answer-' = 0,
                                                          'Yes' = 1,
                                                          'No' = 2))),
                                        box(actionButton("check1", "Check")),             # create validation check button
                                        textOutput('feedback1'),                          # create variable feedback text output
                                        htmlOutput('room')),                              # create empty room in order to fully be able to see all the answers from drop menu

                               tabPanel("Plot",plotOutput('plot1'),"",plotOutput('hist1')))    # create plot tab with figure and histogram
                           )),


                           # tab 2 Positive Feedback
                           tabItem(tabName = 'twee', fluidRow(                                                              # Initialize parameters
                             box(sliderInput("urn_size2", "Starting Urn Size:", min = 2, max = 100, value = 2)),
                             box(sliderInput("n_picks2", "Amount of Picks:", min = 2, max = 300,value = 100)),
                             box(sliderInput("n_experiments2", "Amount of Experiments:", min = 1, max = 300,value = 100)),
                             box(numericInput("extra_balls", "Amount of Extra Balls: (1-10)", min = 1, max = 10,value = 1)),
                             tabsetPanel(
                               tabPanel("Summary", htmlOutput('summary2'),br(),                                             # create summary tab
                                        box(selectInput('test2', 'By adding the maximum amount of extra blue balls, do you think the proportion of blue balls will always go to its maximum?', # create multiple choise test
                                                        c('-Please select answer-' = 0,
                                                          'Yes' = 1,
                                                          'No' = 2))),
                                        box(actionButton("check2", "Check")),                  # set validation button, feedback text and room for dropdown menu
                                        textOutput('feedback2'),
                                        htmlOutput('room2')),

                               tabPanel("Plot",plotOutput('plot2'),"",plotOutput('hist2')))    # create plot tab with figure and histogram
                           )),


                           # tab 3 Critical Moments
                           tabItem(tabName = 'drie', fluidRow(                                                      # Initialize parameters
                             box(sliderInput("urn_size3", "Starting Urn Size:", min = 2, max = 100, value = 2)),
                             box(sliderInput("n_picks3", "Amount of Picks:", min = 2, max = 300,value = 100)),
                             box(sliderInput("n_experiments3", "Amount of Experiments:", min = 1, max = 300,value = 100)),
                             box(numericInput("streak", "When will it be an Effective Streak? (2-10)", min = 2, max = 10,value = 5)),
                             box(numericInput("extra_balls3", "How many Extra Balls? (0-10)", min = 0, max = 10,value = 0)),
                             tabsetPanel(
                               tabPanel("Summary", htmlOutput('summary3'),br(),                                     # create summary tab
                                        box(selectInput('test3', 'Do you think its possible to get around 50/50 proportion of blue and red balls when you have a streak at 2 with a high amount of extra balls?',
                                                        c('-Please select answer-' = 0,
                                                          'Yes' = 1,
                                                          'No' = 2))),
                                        box(actionButton("check3", "Check")),                                       # set validation button, feedback text and room for dropdown menu
                                        textOutput('feedback3'),
                                        htmlOutput('room3')),


                               tabPanel("Plot",plotOutput('plot3'),"",plotOutput('hist3')))                         # create plot tab with figure and histogram
                           )),


                           # tab 4 Life Events
                           tabItem(tabName = 'vier', fluidRow(                                                      # Initialize parameters
                             box(sliderInput("urn_size4", "Starting Urn Size:", min = 2, max = 100, value = 2)),
                             box(sliderInput("n_picks4", "Amount of Picks:", min = 2, max = 300,value = 100)),
                             box(sliderInput("n_experiments4", "Amount of Experiments:", min = 1, max = 300,value = 100)),
                             box(sliderInput("occ_trauma", "When did the Trauma occured?", min = 2, max = 300,value = 50)),
                             box(selectInput("drastic_trauma", "How Drastic was the Trauma?",
                                             c('Minor (lose last 25% experiences)' = 25,
                                               'Intermediate (lose last 50% experiences)' = 50,
                                               'Major (lose last 75% experiences)' = 75))),
                             tabsetPanel(
                               tabPanel("Summary", htmlOutput('summary4'),br(),                                     # create summary tab
                                        box(selectInput('test4', 'When does the onset of the trauma has the biggest effect?',
                                                        c('-Please select answer-' = 0,
                                                          'Early on' = 1,
                                                          'Around the middle' = 2,
                                                          'In the end' = 3))),
                                        box(actionButton("check4", "Check")),                                       # set validation button, feedback text and room for dropdown menu
                                        textOutput('feedback4'),
                                        htmlOutput('room4')),


                               tabPanel("Plot",plotOutput('plot4'),"",plotOutput('hist4')))                         # create plot tab with figure and histogram
                           )),


                           # tab 5 Decay
                           tabItem(tabName = 'vijf', fluidRow(                                                      # Initialize parameters
                             box(sliderInput("urn_size5", "Starting Urn Size:", min = 2, max = 100, value = 2)),
                             box(sliderInput("n_picks5", "Amount of Picks:", min = 2, max = 300,value = 100)),
                             box(sliderInput("n_experiments5", "Amount of Experiments:", min = 1, max = 300,value = 100)),
                             box(numericInput("many_picks", "After how many Picks... (2-50)", min = 2, max = 50,value = 20)),
                             box(numericInput("much_decay", "How much Decay? (1-20)", min = 1, max = 20,value = 5)),
                             tabsetPanel(
                               tabPanel("Summary", htmlOutput('summary5'),br(),                                     # create summary tab
                                        box(selectInput('test5', 'Do you think that memories in this model are resilient?',
                                                        c('-Please select answer-' = 0,
                                                          'Yes' = 1,
                                                          'No' = 2))),
                                        box(actionButton("check5", "Check")),                                       # set validation button, feedback text and room for dropdown menu
                                        textOutput('feedback5'),
                                        htmlOutput('room5')),




                               tabPanel("Plot",plotOutput('plot5'),"",plotOutput('hist5')))                         # create plot tab with figure and histogra
                           )),


                           # tab 6 Testin
                           tabItem(tabName = 'zes', fluidRow(
                             box(actionButton("start", "Generate!")),                                  # creat generate button
                             tabPanel("Summary", htmlOutput('summary6')),                              # set text for this tab
                             tabPanel("Plot",'',plotOutput('plot6'),                                   # give output plot (2x breaks)
                                      br(),
                                      br(),
                                      box(selectInput("model", "What scenario could this represent?",  # set question with choises
                                                      c('-choose a scenario-' = 1,
                                                        'Positive feedback' = 2,
                                                        'Critical moments' = 3,
                                                        'Life events' = 4,
                                                        'The standard model' = 5))),
                                      box(actionButton("check", "Check")),                             # set validation button, feedback text and room for dropdown me
                                      tabPanel("feedback", htmlOutput('feedback')),
                                      htmlOutput('room6')
                             ))
                           )
                         )
                       ))

  server <- function(input, output){           # create server

    ################################## Create plots and check questions ##################################################

    # Plot for standard model

    fraction_blue = reactive({                                  # create reactive function responsive to users input

      df_fractions = data.frame()                             # initialize dataframe for collecting proportions blue balls per experiment
      for( j in 1:input$n_experiments){                       # loop over the amount of experiments

        urn = rep(c('blue', 'red'), each = input$urn_size/2)  # initialize the urn with eaual amount of balls
        fraction_blue_ = vector()                             # initialize vector of proportion blue balls
        for (i in 1:input$n_picks){                           # loop over the amount of picks
          pick = sample(urn,1)                                # pick a random ball
          urn[length(urn)+1] = pick                           # add this ball to urn
          fraction_blue_[i] = sum(urn == 'blue')/length(urn)  # calculate fraction blue and store
        }
        df_fractions[1:length(fraction_blue_),j] = fraction_blue_ # put proportion balls per experiment in each colomn of the dataframe
      }
      #  }
      return(df_fractions)                                      # return dataframe of all proportions over all experiments to plot later
    })

    observeEvent(input$check1, {           # Check question 1
      if (input$test1 == 2){
        output$feedback1 = renderText({paste('Correct!')})
      }else if (input$test1 == 1){
        output$feedback1 = renderText({paste('Wrong!')})
      }else{
        output$feedback1 = renderText({paste('Please select answer')})
      }
    })

    #####################################################################################################

    # Plot for learning model

    fraction_blue2 = reactive({                              # create reactive function responsive to users input

      df_fractions = data.frame()

      for( j in 1:input$n_experiments2){

        urn = rep(c('blue', 'red'), each = input$urn_size2/2)
        fraction_blue_ = vector()
        for (i in 1:input$n_picks2){
          pick = sample(urn,1)                               # pick a random ball
          if (pick == 'blue'){                               # if pick is blue:
            urn[length(urn)+1:input$extra_balls] = pick      # add 1 + input amount of balls
          }else{                                             # if pick is red:
            urn[length(urn)+1] = pick                        # add 1
          }
          fraction_blue_[i] = sum(urn == 'blue')/length(urn) # calculate fraction blue and store
        }
        df_fractions[1:length(fraction_blue_),j] = fraction_blue_
      }
      return(df_fractions)                                   # return dataframe of all proportions over all experiments to plot later
    })

    observeEvent(input$check2, {           # Check question 2
      if (input$test2 == 2){
        output$feedback2 = renderText({paste('Correct! Try this out yourself.')})
      }else if (input$test2 == 1){
        output$feedback2 = renderText({paste('Wrong! Try this out yourself.')})
      }else{
        output$feedback2 = renderText({paste('Please select answer')})
      }
    })

    #####################################################################################################

    # Plot for streak model

    fraction_blue3 = reactive({                               # create reactive function responsive to users input

      df_fractions = data.frame()

      for( j in 1:input$n_experiments3){

        urn = sample(rep(c('blue', 'red'), each = input$urn_size3/2))
        fraction_blue_ = vector()
        for (i in 1:input$n_picks3){
          pick = sample(urn,1)                                # pick a random ball
          urn[length(urn)+1] = pick                           # add this ball to urn
          if (identical(tail(urn,input$streak),rep(pick, input$streak))){     # if last [N input] picks are equal = put in [N input] extra
            urn[length(urn)+1:input$extra_balls3] = pick
          }
          fraction_blue_[i] = sum(urn == 'blue')/length(urn)  # calculate fraction blue and store
        }
        df_fractions[1:length(fraction_blue_),j] = fraction_blue_
      }
      return(df_fractions)                                    # return dataframe of all proportions over all experiments to plot later
    })

    observeEvent(input$check3, {           # Check question 3
      if (input$test3 == 1){
        output$feedback3 = renderText({paste('Correct! Try this with the maximum amount of experiments.')})
      }else if (input$test3 == 2){
        output$feedback3 = renderText({paste('Wrong! Try this with the maximum amount of experiments.')})
      }else{
        output$feedback3 = renderText({paste('Please select answer')})
      }
    })

    #####################################################################################################

    # Plot for life event model

    fraction_blue4 = reactive({

      df_fractions = data.frame()
      drastic_trauma = as.numeric(input$drastic_trauma)                # set input as numeric value

      for( j in 1:input$n_experiments4){

        urn = sample(rep(c('blue', 'red'), each = input$urn_size4/2))
        fraction_blue_ = vector()
        for (i in 1:input$n_picks4){
          pick = sample(urn,1)                                # pick a random ball
          urn[length(urn)+1] = pick                           # add this ball to urn
          fraction_blue_[i] = sum(urn == 'blue')/length(urn)  # calculate fraction blue and store
          if (i == input$occ_trauma){
            urn = urn[1:(length(urn) - (length(urn)/100)*drastic_trauma)]    # delete [input] percentage from urn
            sample(urn)                                       # shuffle urn
          }
        }
        df_fractions[1:length(fraction_blue_),j] = fraction_blue_
      }
      return(df_fractions)                                    # return dataframe of all proportions over all experiments to plot later
    })

    observeEvent(input$check4, {           # Check question 4
      if (input$test4 == 0){
        output$feedback4 = renderText({paste('Please select answer')})
      }else if (input$test4 == 1){
        output$feedback4 = renderText({paste('Correct! Try looking at a major trauma with an very early onset.')})
      }else{
        output$feedback4 = renderText({paste('Wrong! Try looking at a major trauma with an very early onset.')})
      }
    })

    #####################################################################################################

    # Plot for decay model

    fraction_blue5 = reactive({

      df_fractions = data.frame()

      for( j in 1:input$n_experiments5){

        urn = rep(c('blue', 'red'), each = input$urn_size5/2)
        fraction_blue_ = vector()
        for (i in 1:input$n_picks5){
          pick = sample(urn,1)                                # pick a random ball
          urn[length(urn)+1] = pick                           # add this ball to urn
          if (i %% input$many_picks == 0){                    # after each [imput] picks
            urn[-sample(length(urn),(input$much_decay))]      # delete [imput] random elements form urn
          }

          fraction_blue_[i] = sum(urn == 'blue')/length(urn)  # calculate fraction red and store
        }
        df_fractions[1:length(fraction_blue_),j] = fraction_blue_
      }
      return(df_fractions)                                    # return dataframe of all proportions over all experiments to plot later
    })

    observeEvent(input$check5, {           # Check question 5
      if (input$test5 == 1){
        output$feedback5 = renderText({paste('Correct!')})
      }else if (input$test5 == 2){
        output$feedback5 = renderText({paste('Wrong!')})
      }else{
        output$feedback5 = renderText({paste('Please select answer')})
      }
    })

    #####################################################################################################

    # Plot for testing page                   ##########  I unfortunately didnt had enough time to generate a different models on each click. SO now it plots the previous set models

    observeEvent(input$start, {
      X = sample(c(2:5),1)                      # generate random number between 2 and 5 to generate previous models, plot model based on number
      
      if (X == 2){
        output$plot6 = renderPlot({
          matplot(fraction_blue2(),ylab = 'Fraction Blue',xlab = 'picks', ylim = c(0,1),type = 'l',lty = 1, lwd = 2)
        })
      }else if (X == 3){
        output$plot6 = renderPlot({
          matplot(fraction_blue3(),ylab = 'Fraction Blue',xlab = 'picks', ylim = c(0,1),type = 'l',lty = 1, lwd = 2)
        })
      }else if (X == 4){
        output$plot6 = renderPlot({
          matplot(fraction_blue4(),ylab = 'Fraction Blue',xlab = 'picks', ylim = c(0,1),type = 'l',lty = 1, lwd = 2)
        })
      }else if (X == 5){
        output$plot6 = renderPlot({
          matplot(fraction_blue(),ylab = 'Fraction Blue',xlab = 'picks', ylim = c(0,1),type = 'l',lty = 1, lwd = 2)
        })
      }
      observeEvent(input$check, {           # Check if input model corresponds with the generated model and give feedback
        if (X == input$model){
          output$feedback = renderText({paste('Correct!')})
        }else{
          output$feedback = renderText({paste('Wrong!')})
        }
      })
    })

    ################################### Create all output ##################################################################

    # Output 0
    output$summary0 = renderText({         # Summary introduction
      paste('In this application we are trying to simulate a model known as the Polya urn model. In this model, objects of real interest (such as atoms, people, cars, etc.) are represented as coloured balls in an urn or other container. This urn contains x red and y blue balls; one ball is drawn randomly from the urn and its colour observed; it is then returned in the urn, and an additional ball of the same colour is added to the urn, and the selection process is repeated. Thus, every time a ball is observed, an additional ball of the same colour is added to the urn. Hence, the number of total marbles in the urn grows. Questions of interest are the evolution of the urn population and the sequence of colours of the balls drawn out.','<br>', '<br>',
            'This model has many applications. Here, the balls represent previous memories and how they influence learning behaviour. For instance, imagine learning to play the piano. When you start learning a song, you might have two failing attempts then you take a lesson and you learn how to play your song for the first time. Now you have a total of three memories of playing the song; two incorrect experiences and one correct. In our model the balls represent these experiences in the form of memory traces. All the blue balls represent correct previous experiences and the red balls incorrect ones. Now you want to play this song for the fourth time, to do this correctly you have to sample from your earlier experiences and hope retrieve the experience when you correctly played the song (grab a blue ball). ','<br>','<br>',
            'Based on this simple learning scheme, how does your skill develop? On the long term, will you be able to learn to play the song and, what factors will influence this development. That is exactly what we will try to figure out with this simulation. If you head over to the next tab on the left (Standard Model) the standard Polya urn model will be shown, based on this process.','<br>', '<br>', 'Enjoy!'
      )})


    # Output 1
    output$plot1 = renderPlot({         # Plot the return value, the dataframe
      matplot(fraction_blue(), main = 'Proportion of blue balls after picks:',ylab = 'Fraction Blue',xlab = 'picks', ylim = c(0,1), type = 'l',lty = 1, lwd = 2)
    })
    output$hist1 = renderPlot({         # Plot the density
      hist(as.numeric(tail(fraction_blue(),1)),main = 'Final density over the proportion of blue balls:',xlab="Proportion of blue balls",freq = F, xlim = c(0,1))
      lines(density(as.numeric(tail(fraction_blue(),1))), xlab="", ylab="", main="", xaxt="n", yaxt="n", col = "blue", lwd = 2)
    })                                  # summary first tab
    output$summary1 = renderText({paste('Here we will discover the standard Polya urn model. As you can see, there are three parameters to adjust:','<br>','<br>',
                                        '- Starting urn size.','<br>','In this simulation you always start with an equal amount of red and blue balls in the urn, with a minimum of one each. This represents the amount of initial experiences.','<br>', '<br>',
                                        '- Amount of picks.','<br>','As the name implies, this parameter influences how many times a ball is picked from the urn and put back with a ball of the same colour. As you might infer from reading the introduction, this represents how many experiences someone will have','<br>', '<br>',
                                        '- Amount of experiments. ','<br>', 'Experiment refers to separate individuals who are partaking in this model. As you will discover, this model does not have a fixed outcome and may vary each time this experiment will run. In the plot tab (next to Amount of experiments), you will see different coloured lines representing each experiment.','<br>', '<br>',
                                        'In the plot tab you are able to see the outcome of the simulation dependent on your given parameters. The figure plots the proportion of blue balls inside of the urn over the course of each pick per experiment. Thus this represents how well someone has learned a certain skill. Beneath this plot, there is also a density plot (only if amount of experiments > 1). Representing the final outcome of the blue balls. That is, the outcome distribution per experiment.' ,'<br>', '<br>',
                                        'To test your knowledge, try to awnser the question below. Click on Check to check your answer. Then try to play around wit the parameters and understand how they influence the model (by looking at the plot tab).')})
    output$room = renderText({paste('.','<br>','<br>','<br>','<br>','<br>','.')})         # needed in order to create room for the drop out box


    # Output 2
    output$plot2 = renderPlot({
      matplot(fraction_blue2(),ylab = 'Fraction Blue',xlab = 'picks', ylim = c(0,1),type = 'l',lty = 1, lwd = 2)
    })
    output$hist2 = renderPlot({
      hist(as.numeric(tail(fraction_blue2(),1)),main = 'Final density over the proportion of blue balls:',xlab="Proportion of blue balls",freq = F, xlim = c(0,1))
      lines(density(as.numeric(tail(fraction_blue2(),1))), xlab="", ylab="", main="", xaxt="n", yaxt="n", col = "blue", lwd = 2)
    })
    output$summary2 = renderText({paste('As you might saw, the outcome of each experiment fluctuates greatly between each other. Even the density plot has no real consistent outcome. It seems that this standard model is very stochastic, unable to predict a certain outcome. This does not seem intuitively reflect learning behaviour. Lets improve this model.', '<br>', '<br>',
                                        'Here we are adding a positive feedback parameter called, amount of extra balls. What this does is, when you had a successful experience (e.g. grabbed a blue ball), you will not add only one extra blue ball, but more then one. You could think of this as positive feedback; once you had a good experience, this will be stronger remembered compared to a bad experience. So to make it more easily to retrieve this memory, you could increase the chance of retrieving this memory again. By adding more blue balls during correct experiences, you are able to do this. Lets see how this parameter influences our model.','<br>',
                                        'But first, try to answer this next question.')})
    output$room2 = renderText({paste('.','<br>','<br>','<br>','<br>','<br>','.')})        # needed in order to create room for the drop out box


    # Output 3
    output$plot3 = renderPlot({
      matplot(fraction_blue3(),ylab = 'Fraction Blue',xlab = 'picks', ylim = c(0,1),type = 'l',lty = 1, lwd = 2)
    })
    output$hist3 = renderPlot({
      hist(as.numeric(tail(fraction_blue3(),1)),main = 'Final density over the proportion of blue balls:',xlab="Proportion of blue balls",freq = F, xlim = c(0,1))
      lines(density(as.numeric(tail(fraction_blue3(),1))), xlab="", ylab="", main="", xaxt="n", yaxt="n", col = "blue", lwd = 2)
    })
    output$summary3 = renderText({paste('All right, that already looked a lot better. Now, it could be possible that if you had a certain few experiences in a row, they would amplify each other. For instance, having multiple good practice experiences in a row would be more beneficial than these experiences in separation. However, experiencing multiple failures in a row could also be harmful, perhaps demotivating someone or creating a stressful situation. These critical moments could potentially influence development greatly.','<br>', '<br>',
                                        'Lets call these -same type of experiences in a row- a streak. Where you could have a streak of correct and incorrect experiences. With these following parameters you are able to decide when it counts as a streak and how many extra balls will be added afterwards, representing the effectiveness of the streak.','<br>',
                                        'But first, try to answer this next question.'
    )})
    output$room3 = renderText({paste('.','<br>','<br>','<br>','<br>','<br>','.')})        # needed in order to create room for the drop out box


    # Output 4
    output$plot4 = renderPlot({
      matplot(fraction_blue4(),ylab = 'Fraction Blue',xlab = 'picks', ylim = c(0,1),type = 'l',lty = 1, lwd = 2)
    })
    output$hist4 = renderPlot({
      hist(as.numeric(tail(fraction_blue4(),1)),main = 'Final density over the proportion of blue balls:',xlab="Proportion of blue balls",freq = F, xlim = c(0,1))
      lines(density(as.numeric(tail(fraction_blue4(),1))), xlab="", ylab="", main="", xaxt="n", yaxt="n", col = "blue", lwd = 2)
    })
    output$summary4 = renderText({paste('Time to get a bit dramatic. What if you were unlucky and suffered a head trauma and you would lose a few past experiences (retrograde amnesia)? How resilient are memories based on this model? These kind of major live events could have a big influence on development.','<br>', '<br>',
                                        'Lets figure this out with these new parameters. First you are able to indicate the time of the trauma. After how many picks did the trauma occurred? Secondly, how drastic was the trauma. That is, how many previous experiences did you lose.','<br>', 'But first, try to answer this next question.')})
    output$room4 = renderText({paste('.','<br>','<br>','<br>','<br>','<br>','.')})        # needed in order to create room for the drop out box


    # Output 5
    output$plot5 = renderPlot({
      matplot(fraction_blue5(),ylab = 'Fraction Blue',xlab = 'picks', ylim = c(0,1),type = 'l',lty = 1, lwd = 2)
    })
    output$hist5 = renderPlot({
      hist(as.numeric(tail(fraction_blue5(),1)),main = 'Final density over the proportion of blue balls:',xlab="Proportion of blue balls",freq = F, xlim = c(0,1))
      lines(density(as.numeric(tail(fraction_blue5(),1))), xlab="", ylab="", main="", xaxt="n", yaxt="n", col = "blue", lwd = 2)
    })
    output$summary5 = renderText({paste('There is one more obvious parameter we could incorporate inside our model, decay. As we know memories fade over time. Does this mean that our learned behaviour fades as well?', '<br>', '<br>',
                                        'Here you are able to choose after how many picks, how many (random) balls will be removed from the urn. It stands to reason that some people are more forgetful then others. Before we will look how this will influence the model, try to anwer the next question.')})
    output$room5 = renderText({paste('.','<br>','<br>','<br>','<br>','<br>','.')})        # needed in order to create room for the drop out box


    # Output 6
    output$summary6 = renderText({paste('Now to put our knowledge to the test... Lets generate a random model and try to estimate which scenario it represents. Press the generate button to start...')})
    output$room6 = renderText({paste('.','<br>','<br>','<br>','<br>','<br>','<br>','.')}) # needed in order to create room for the drop out box
  }
  shinyApp(ui = ui, server = server) #start app
}
