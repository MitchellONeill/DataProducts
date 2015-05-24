library(shiny)
load("NFLscores")
shinyServer(function(input, output) {
        sliderValues <- reactive({
                data.frame(
                 names=c("Field","Points Scored"),
                 values=c(as.character(input$id1), input$id2),
                stringsAsFactors=FALSE)
        })
        f <- function(id1, id2){
         homeFit <- glm(homeWin ~ homeScore, data=Table, family="binomial")
         awayFit <- glm(awayWin ~ awayScore, data=Table, family="binomial")
         if( id1 == "away"){
                predict(awayFit, newdata=data.frame(awayScore=id2), type="response")
         } else {
                predict(homeFit, newdata=data.frame(homeScore=id2), type="response")
          }
        }
output$values <- renderTable({
        sliderValues()
        })
output$focal <- renderText(
   {
paste("The Probability your team won is:", round(f(input$id1, input$id2)*100,2), "%")}
        )
output$instructions <- renderText({
        })
})
