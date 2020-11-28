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
    
    
    formula <- reactive({
        paste("mpg ~", input$variable)
    })
    
    output$rtitle <- renderText({
        formula()
    })
    
    
    output$mpgBoxPlot <- renderPlot({
        boxplot(as.formula(formula()), 
                data = mtcars)
    })
    
    output$mpgScatterplot <- renderPlot({
        with(mtcars, {
            plot(as.formula(formula()))
        })
    })
    
    #4 the model 
    fit <- reactive({
        lm(mpg ~ ., data=mtcars)
    })

    output$fit <- renderPrint({
        summary(fit())
    })
    
    output$result <- renderText({
        
        
        fit <- lm(mpg ~ ., data=mtcars)
        pred <- predict(fit, newdata = data.frame(cyl = as.integer(input$cyl),
                                                  disp = as.integer(input$disp),
                                                  hp = as.integer(input$hp),
                                                  drat = as.integer(input$drat),
                                                  wt = as.integer(input$wt),
                                                  qsec = as.integer(input$qsec),
                                                  vs = as.integer(input$vs),
                                                  am = as.factor(input$am),
                                                  gear = as.integer(input$gear),
                                                  carb = as.integer(input$carb)
                                                  )
                        
                        
                        )
        res <- round(pred, digits = 1.5)
        res
    })
    
    
    ## 5 github
    
    url2 <- a("Server Project", href="https://github.com/Ibn-mohey/R-general-practice/tree/gh-pages/coursera%20Data%20Science%20Specialization/9-Developing%20Data%20Products/project/server")
    output$gitgub <- renderUI({
        tagList("Access My github for this project From here:", url2)
    })
    
})
