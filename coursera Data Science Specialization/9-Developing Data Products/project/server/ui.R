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
               tabPanel("business understanding",
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
                        p("  [, 8]	 vs	 V/S"),
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
                        h2("step 2 of the Data scinec project is to get the data"),
                        hr(),
                        p('Once you start your R program, mtcars data sets available within R along with loaded packages'),
                        p("you can load the data using" ,code('data(mtcars)'),"."),
                        uiOutput("tab")
                     ),
               
               tabPanel("Explore and Clean Your Data",
                        fluidPage(
                            titlePanel("Some data exploration techs to use"),
                            sidebarLayout(
                                sidebarPanel(
                                    selectInput("variable", "one variable exploration -select variable:",
                                                c("Number of cylinders" = "cyl",
                                                  "Displacement (cu.in.)" = "disp",
                                                  "Gross horsepower" = "hp",
                                                  "Rear axle ratio" = "drat",
                                                  "Weight (lb/1000)" = "wt",
                                                  "1/4 mile time" = "qsec",
                                                  "V/S" = "vs",
                                                  "Transmission" = "am",
                                                  "Number of forward gears" = "gear",
                                                  "Number of carburetors" = "carb"
                                                    )
                                                ),
                                    checkboxInput("outliers", "Show BoxPlot's outliers", FALSE)
                                ),
                                
                                

                                mainPanel(
                                    h3(textOutput("caption")),
                                    
                                    tabsetPanel(type = "tabs", 
                                                tabPanel("BoxPlot", plotOutput("mpgBoxPlot")),
                                                tabPanel("Regression model", 
                                                         plotOutput("mpgPlot"),
                                                         verbatimTextOutput("fit")
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
