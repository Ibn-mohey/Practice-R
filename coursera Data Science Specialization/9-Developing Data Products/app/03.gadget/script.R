library(shiny)
library(miniUI)

myFirstGadget <- function() {
    ui <- miniPage(
        gadgetTitleBar("My First Gadget")
    )
    server <- function(input, output, session) {
        # The Done button closes the app
        observeEvent(input$done, {
            stopApp()
        })
    }
    runGadget(ui, server)
}


multiplyNumbers <- function(numbers1, numbers2) {
    ui <- miniPage(
        gadgetTitleBar("Multiply Two Numbers"),
        miniContentPanel(
            selectInput("num1", "First Number", choices=numbers1),
            selectInput("num2", "Second Number", choices=numbers2)
        )
    )
    server <- function(input, output, session) {
        observeEvent(input$done, {
            num1 <- as.numeric(input$num1)
            num2 <- as.numeric(input$num2)
            stopApp(num1 * num2)
        })
    }
    runGadget(ui, server)
}


pickTrees <- function() {
    ui <- miniPage(
        gadgetTitleBar("Select Points by Dragging your Mouse"),
        miniContentPanel(
            plotOutput("plot", height = "100%", brush = "brush")
        )
    )
    server <- function(input, output, session) {
        output$plot <- renderPlot({
            plot(trees$Girth, trees$Volume, main = "Trees!",
                 xlab = "Girth", ylab = "Volume")
        })
        observeEvent(input$done, {
            stopApp(brushedPoints(trees, input$brush,
                                  xvar = "Girth", yvar = "Volume"))
        })
    }
    
    runGadget(ui, server)
}