#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(

    # Application title
    titlePanel("Test title"),

    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
            h3 ("Move the slider ")
            ,sliderInput("s2", "silide me ", min = 0, max = 100,value = 0)
        
            ),

        # Show a plot of the generated distribution
        mainPanel(
            h3("main pannel text"),
            textOutput('t1')
            # ,plotOutput("distPlot")
        )
    )
))


