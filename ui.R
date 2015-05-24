library(shiny)
shinyUI(pageWithSidebar(
        headerPanel("NFL: Win Predictor"),
        sidebarPanel(tabsetPanel(
        tabPanel("Inputs", radioButtons("id1", label = h3("Field Status:"),
          choices = list("Home" = "home", "Away" = "away"),selected="home"),
          sliderInput("id2", "Points Scored:", min=0, max=70, value=14)),
        tabPanel("Instructions", helpText("The data for this predictor is the compiled scores from the AFC East in the 2013-2014 NFL season (upgraded from the Baltimore only predictor in the regression models course). 
        Using two inputs, whether or not your team was home and how many points they scored, the predictor
        will tell you the probability that they won the game. The field status can be set by the 'radio box'
        and the point total of your team is chosen via slider with a range of 0 to 70."
        )))),
        mainPanel(    
        tableOutput("values"),
        uiOutput("focal"))
))
