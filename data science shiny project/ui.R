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
               tabPanel( 'About the Project', 
                         p('this project is small full data sceine project with it\'s steps'),
                         hr(),
                         h2('Steps to Complete a Data Analytics Project'),
                         # actionLink("link_to_tabpanel_1", h3('Step 1: Understand the Business')),
                         # actionLink("link_to_tabpanel_2", h3('Step 2: Get Your Data')),
                         # actionLink("link_to_tabpanel_3", h3('Step 3: Explore and Clean Your Data')),
                         # actionLink("link_to_tabpanel_4", h3('Step 4: Enrich Your Dataset')),
                         # actionLink("link_to_tabpanel_5", h3('Step 5: Build Helpful Visualizations')),
                         # actionLink("link_to_tabpanel_6", h3('Step 6: Get Predictive')),
                         # actionLink("link_to_tabpanel_7", h3('Step 7: Iterate, Iterate, Iterate')),
                         h3('Step 1: Understand the Business'),
                         p('Understanding the business or activity that your data project is part of is key 
                           to ensuring its success and the first phase of any sound data analytics project.'),
                         h3('Step 2: Get Your Data'),
                         p("Once you've gotten your goal figured out, it\'s time to start looking for your data, 
                            the second phase of a data analytics project. Mixing and merging data from as many data sources as possible
                            is what makes a data project great, so look as far as possible."),
                         h3('Step 3: Explore and Clean Your Data'),
                         p("The next data science step is the dreaded data preparation process that typically takes
                          up to 80% of the time dedicated to a data project."),
                         h3('Step 4: Enrich Your Dataset'),
                         p("Now that you have clean data, it's time to manipulate it in order to get the most value out of it."),
                         h3('Step 5: Build Helpful Visualizations'),
                         p('You now have a nice dataset (or maybe several), so this is a good time to start exploring it by building graphs.'),
                         h3('Step 6: Get Predictive'),
                         p('is when the real fun starts. Machine learning algorithms can help you
                           go a step further into getting insights and predicting future trends.'),
                         h3('Step 7: Iterate, Iterate, Iterate'),
                         p('The main goal in any business project is to prove its effectiveness as fast as possible to justify,
                           well, your job. The same goes for data projects. By gaining time on data cleaning and enriching,
                           you can go to the end of the project fast and get your initial results. This is the final phase of
                           completing your data analytics project and one that is critical to the entire data life cycle.')
               ),
               
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
               tabPanel( "manipulate Date set"
                         
               ),
               
               tabPanel( "Get Predictive"
                         
               ),
               
               tabPanel("Build Helpful Visualizations"
                        
               ),
               
               tabPanel("Github link",
                        uiOutput("gitgub")
               )
    )
)
