library(shiny)
shinyUI(fluidPage(
        titlePanel("Predict the height of Men's children"),
        sidebarLayout(
                sidebarPanel(
                        sliderInput("sliderfheight", "What is the father height (in inch)?", 60, 75, value = 65),
                        checkboxInput("showInterval", "Show/Hide Confidence Interval", value = TRUE),
                        uiOutput("help")
                        
                ),
                mainPanel(
                        plotOutput("plot1"),
                        textOutput("predson"),
                        br(),
                        br(),
                        h4("Documentation:"),
                        p("This app is based on the father.son dataset in the UsingR library."),
                        p("The goal is to predict the son'sheight for a given father height."),
                        p("The model used is a simple linear model."),
                        br(),
                        p("In order to get the prediction, you will have to move the slider to the targeted father height."),
                        p("The prediction of the son's height will be displayed below and also on the chart."),
                        br(),
                        p("You also have the possiblity to display the confidence interval by checking the check box below the slider.")
                        
                        
                )
        )
))