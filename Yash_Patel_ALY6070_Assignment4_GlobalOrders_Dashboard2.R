install.packages("shiny")
library(shiny)
library(ggplot2)
d1<-read.csv(file.choose())
ui<-shinyUI(fluidPage(
  titlePanel("Dynamic Scatter Plot of Gobal Superstore Orders"),
  sidebarLayout(
    sidebarPanel(
      radioButtons("x", "Select x-axis of Globar Super Order dataset:",
                   list("Sales"='a', "Profit"='b', "Shipping Cost"='c')),
      
      radioButtons("y", "Select y-axis of Globar Super Order dataset:",
                   list("Sales"='d', "Profit"='e', "Shipping Cost"='f'))
      ),
    mainPanel(
      plotOutput("distPlot")
      )
    )
  ))
server<-shinyServer(function(input, output) {
  output$distPlot <- renderPlot({
    d1_reduced<- d1[,c("Sales","Profit","Shipping.Cost","Segment")]
    if(input$x=='a'){
      i<-1
    }
    if(input$x=='b'){
      i<-2
    }
    if(input$x=='c'){
      i<-3
    }
    if(input$y=='d'){
      j<-1
    }
    
    if(input$y=='e'){
      j<-2
    }
    
    if(input$y=='f'){
      j<-3
    }
    plot(d1_reduced[[i]],d1_reduced[[j]],xlab = "x-axis",
         ylab = "y-axis")})})
shinyApp(ui, server)
