#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(datasets)

mpgData <- mtcars
mpgData$am <- factor(mpgData$am, labels = c("Automatic", "Manual"))

shinyServer(function(input, output) {
    
    #2 get the data 
    url <- a("MTcars Data set", href="https://www.kaggle.com/ruiromanini/mtcars")
    output$tab <- renderUI({
        tagList("you can get the data though as CSV if u need from here:", url)
    })
    
    #3 explore the data 
    
    
    
    
    formulaText <- reactive({
        paste("mpg ~", input$variable)
    })
    
    formulaTextPoint <- reactive({
        paste("mpg ~", "as.integer(", input$variable, ")")
    })
    
    
    
    #5 the model 
    fit <- reactive({
        lm(as.formula(formulaTextPoint()), data=mpgData)
    })
    
    output$caption <- renderText({
        formulaText()
    })
    
    output$mpgBoxPlot <- renderPlot({
        boxplot(as.formula(formulaText()), 
                data = mpgData,
                outline = input$outliers)
    })
    
    output$fit <- renderPrint({
        summary(fit())
    })
    
    output$mpgPlot <- renderPlot({
        with(mpgData, {
            plot(as.formula(formulaTextPoint()))
            abline(fit(), col=2)
        })
    })
    url2 <- a("MTcars Data set", href="https://www.kaggle.com/ruiromanini/mtcars")
    output$tab <- renderUI({
        tagList("Access My github for this project From here:", url2)
    })
    
    
})