# course projects

this course has 3 projects in it

## week 2 Peer-graded Assignment: R Markdown and Leaflet
## week 3 Peer-graded Assignment: R Markdown Presentation & Plotly
## week 4 Peer-graded Assignment: Course Project: Shiny Application and Reproducible Pitch

---

## week 2 Peer-graded Assignment: R Markdown and Leaflet

### Instructions

Create a web page using R Markdown that features a map created with Leaflet.

Host your webpage on either GitHub Pages, RPubs, or NeoCities.

Your webpage must contain the date that you created the document, and it must contain a map created with Leaflet. We would love to see you show off your creativity!

### Review criteria

The rubric contains the following two questions:

1. Does the web page feature a date and is this date less than two months before the date that you're grading this assignment?
2. Does the web page feature an interactive map that appears to have been created with Leaflet?

### Example Submissions

[Here](https://seankross.neocities.org/week2.html)'s an extremely minimal passing example, but we hope your submission is much cooler!

### Solution for the project 
[R markdown](https://github.com/Ibn-mohey/R-general-practice/blob/gh-pages/coursera%20Data%20Science%20Specialization/9-Developing%20Data%20Products/project/project.Rmd)

[HTML](https://github.com/Ibn-mohey/R-general-practice/blob/gh-pages/coursera%20Data%20Science%20Specialization/9-Developing%20Data%20Products/project/project%201.html)

[rpubs](https://rpubs.com/Abdelrhman-mohey/home)

---

## week 3 Peer-graded Assignment: R Markdown Presentation & Plotly

### Instructions

Create a web page presentation using R Markdown that features a plot created with Plotly. Host your webpage on either GitHub Pages, RPubs, or NeoCities. Your webpage must contain the date that you created the document, and it must contain a plot created with Plotly. We would love to see you show off your creativity!


### Review criteria

The rubric contains the following two questions:

1. Does the web page feature a date and is this date less than two months before the date that you're grading this assignment?
2. Is the web page a presentation and does it feature an interactive plot that appears to have been created with Plotly?

### Example Submissions

[Here](http://seankross.neocities.org/week3.html)'s an extremely minimal passing example, but we hope your submission is much cooler!


### Solution for the project 
[R markdown](https://github.com/Ibn-mohey/R-general-practice/blob/gh-pages/coursera%20Data%20Science%20Specialization/9-Developing%20Data%20Products/project/Plotly%20Presentation.Rmd)

[HTML](https://github.com/Ibn-mohey/R-general-practice/blob/gh-pages/coursera%20Data%20Science%20Specialization/9-Developing%20Data%20Products/project/Plotly-Presentation.html)

[rpubs](https://rpubs.com/Abdelrhman-mohey/Plotly)


---

## week 4 Peer-graded Assignment: Course Project: Shiny Application and Reproducible Pitch

### Instructions

This peer assessed assignment has two parts. First, you will create a Shiny application and deploy it on Rstudio's servers. Second, you will use Slidify or Rstudio Presenter to prepare a reproducible pitch presentation about your application.

## Shiny Application

1. Write a shiny application with associated supporting documentation. The documentation should be thought of as whatever a user will need to get started using your application.
2. Deploy the application on Rstudio's shiny server
3. Share the application link by pasting it into the provided text box
4. Share your server.R and ui.R code on github


**The application must include the following:**

1. Some form of input (widget: textbox, radio button, checkbox, ...)
2. Some operation on the ui input in sever.R
3. Some reactive output displayed as a result of server calculations
4. You must also include enough documentation so that a novice user could use your application.
5. The documentation should be at the Shiny website itself. Do not post to an external link.


The Shiny application in question is entirely up to you. However, if you're having trouble coming up with ideas, you could start from the simple prediction algorithm done in class and build a new algorithm on one of the R datasets packages. Please make the package simple for the end user, so that they don't need a lot of your prerequisite knowledge to evaluate your application. You should emphasize a simple project given the short time frame.

### Review criteria

1. Was there enough documentation on the shiny site for a user to get started using the application?
2. Did the application run as described in the documentation?
3. Was there some form of widget input (slider, textbox, radio buttons, checkbox, ...) in either ui.R or a custom web page?
4. Did server.R perform some calculations on the input in server.R?
5. Was the server calculation displayed in the html page?
6. Was the app substantively different than the very simple applications built in the class? Note, it's OK if the app is simple and based on the one presented in class. I just don't want it to be basically a carbon copy of the examples we covered. For example, if someone simply changed the variable names, then this would not count. However, a prediction algorithm that had a similar layout would be fine.
7. Here's your opportunity to give the app +1 for being well done, or neat, or even just a solid effort.

### Solution for the project 
[The server](https://ibn-mohey.shinyapps.io/server/)

[The server code](https://github.com/Ibn-mohey/R-general-practice/tree/gh-pages/coursera%20Data%20Science%20Specialization/9-Developing%20Data%20Products/project/server)

## Reproducible Pitch Presentation

OK, you've made your shiny app, now it's time to make your pitch. You get 5 slides (inclusive of the title slide) to pitch a your app. You're going to create a web page using Slidify or Rstudio Presenter with an html5 slide deck.

Here's what you need

1. 5 slides to pitch our idea done in Slidify or Rstudio Presenter
2. Your presentation pushed to github or Rpubs
3. A link to your github or Rpubs presentation pasted into the provided text box

**presentation must satisfy the following**

1. It must be done in Slidify or Rstudio Presenter
2. It must be 5 pages
3. It must be hosted on github or Rpubs
4. It must contained some embedded R code that gets run when slidifying the document


NOTE: Slidify is no longer compatible with with Rpubs. If you choose to use Slidify you must share your presentation using GitHub Pages.

Notice to publish your slidify presentation to github or Rpubs, there's the publish command. This link outlines how to do it (it's one line).

Rstudio presenter has a button to publish directly to Rpubs [https://support.rstudio.com/hc/en-us/articles/200714023-Displaying-and-Distributing-Presentations](https://support.rstudio.com/hc/en-us/articles/200714023-Displaying-and-Distributing-Presentations). If you are using Rpubs, put in the link to the presentation into the submission box as a http:// link not a https:// link.

You can also publish using both formats to github manually using gh-pages, though your github branch must have a .nojekyll fle and be on a branch names gh-pages. There's more on gh-pages here [https://pages.github.com/](https://pages.github.com/) and there is a video lecture outlining how to do this.


### Review criteria

1. Was the presentation completed in slidify or R Presenter?
2. Was it 5 pages?
3. Did it contain an R expression that got evaluated and displayed?
4. Did it contain an R expression that got evaluated and displayed?
5. Was it hosted on github or Rpubs?
6. Was the server calculation displayed in the html page?
7. Here's your opportunity to give this presentation a +1 for being well done. Did they tinker around with the default style? Was the presentation particularly lucid and well organized? In other words, the student made a legitimate try.
8. There were no R errors displayed in the presentation.

### Solution for the project
[R markdown](https://github.com/Ibn-mohey/R-general-practice/tree/gh-pages/coursera%20Data%20Science%20Specialization/9-Developing%20Data%20Products/project/presentation)

[rpubs](https://rpubs.com/Abdelrhman-mohey/projectpresentation)

