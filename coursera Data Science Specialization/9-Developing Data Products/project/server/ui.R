#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

shinyUI(
    navbarPage("Data science project",
               tabPanel("About the data",
                        #this is dirictly from the mtcars help
                        h2("Motor Trend Car Road Tests"),
                        hr(),
                        
                        h3("Description"),
                        p("The data was extracted from the 1974 Motor Trend US magazine, and comprises fuel 
                          consumption and 10 aspects of automobile design and performance for 32 automobiles 
                          (1973-74 models)."),
                        
                        h3("Format"),
                        p("A data frame with 32 observations on 11 variables."),
                        
                        p("  [, 1]   mpg         Miles/(US) gallon"),
                        p("  [, 2]	 cyl	 Number of cylinders"),
                        p("  [, 3]	 disp	 Displacement (cu.in.)"),
                        p("  [, 4]	 hp	 Gross horsepower"),
                        p("  [, 5]	 drat	 Rear axle ratio"),
                        p("  [, 6]	 wt	 Weight (lb/1000)"),
                        p("  [, 7]	 qsec	 1/4 mile time"),
                        p("  [, 8]	 vs	 Engine (0 = V-shaped, 1 = straight)"),
                        p("  [, 9]	 am	 Transmission (0 = automatic, 1 = manual)"),
                        p("  [,10]	 gear	 Number of forward gears"),
                        p("  [,11]	 carb	 Number of carburetors"),
                        
                        h3("Source"),
                        
                        p("Henderson and Velleman (1981), Building multiple regression models interactively. Biometrics, 37, 391-411."),
                        
                        h3('project goals'),
                        p("explore the data set and see the relation ships between variables"),
                        p('predict the Milage of new cars based on some variables'),
                        p("see what effect the MPG the most of car characteristics")
               ),
               
               tabPanel("Get the data",
                        h2("get the data"),
                        hr(),
                        p('Once you start your R program, mtcars data sets available within R along with loaded packages'),
                        p("you can load the data using" ,code('data(mtcars)'),"."),
                        uiOutput("tab")
               ),
               
               tabPanel("Explore The Data",
                        fluidPage(
                            titlePanel("Miles/(US) gallon"),
                            sidebarLayout(
                                sidebarPanel(
                                    selectInput("variable", "one variable exploration -select variable:",
                                                c("Number of cylinders" = "cyl",
                                                  "Displacement (cu.in.)" = "disp",
                                                  "Gross horsepower" = "hp",
                                                  "Rear axle ratio" = "drat",
                                                  "Weight (lb/1000)" = "wt",
                                                  "1/4 mile time" = "qsec",
                                                  "Engine shape" = "vs",
                                                  "Transmission automatic vs manual" = "am",
                                                  "Number of forward gears" = "gear",
                                                  "Number of carburetors" = "carb"
                                                )
                                    )
                                ),
                                mainPanel(
                                    h3(textOutput("rtitle")),
                                    
                                    tabsetPanel(type = "tabs", 
                                                tabPanel("Scatterplot", plotOutput("mpgScatterplot")),
                                                tabPanel("BoxPlot", plotOutput("mpgBoxPlot"))
                                    )
                                )
                            )
                        )
               ),
               
               tabPanel("The Model",
                        fluidPage(
                            titlePanel("predict next MPG"),
                            sidebarLayout(
                                sidebarPanel(
                                    selectInput("cyl","Select Number of cylinders",c(4 ,6,8)),
                                    sliderInput("disp","Select Displacement (cu.in.)",100 ,min = 71 , max = 335),
                                    sliderInput("hp","Select Gross horsepower",         min = 52      ,max =335, value = 100),
                                    sliderInput("drat","Select Rear axle ratio",        min = 2.76 , max =4.34 ,value = 2),
                                    sliderInput("wt","Select Weight (1000 lbs)",        min = 1.5    ,max =5.4,value = 3),
                                    sliderInput("qsec","Select 1/4 mile time",          min = 14.5    ,max =20.22, value =15),
                                    selectInput("vs","Select Engine Shape",c('V-shaped' = 0,'straight' = 1)),
                                    selectInput("am","Select Transmission",c('automatic' = 0 , 'manual' = 1)),
                                    selectInput("gear","Select Number of forward gears",c(3, 4, 5)),
                                    selectInput("carb","Select Number of carburetors",c(1,2,3,4,6,8))
                                    
                                ),
                                mainPanel(
                                    h3("Final model"),
                                    tabsetPanel(type = "tabs",
                                                tabPanel("Model info" , verbatimTextOutput("fit"),h4("Predicted Miles/(US) gallon of this Car is:"),
                                                         h3(textOutput("result"))
                                                         )
                                    )
                                    
                                )
                            )
                        )
               ),
               tabPanel("Github link",
                        uiOutput("gitgub")
               )
    )
)
