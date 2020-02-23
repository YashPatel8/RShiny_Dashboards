install.packages("shiny")
library(shiny)
library(ggplot2)
d1<-read.csv(file.choose())
ui <- fluidPage(titlePanel("Dynamic Histogram of Quantity around Globe"),
                sidebarLayout(
                  sidebarPanel(
                    sliderInput(
                      inputId = "bins",
                      label = "Number of bins:",
                      min = 1,
                      max = 14,
                      value = 5)
                    ),
                  mainPanel(
                    plotOutput(outputId = "distPlot")
                    )
                  )
                )
server <- function(input, output) {
  output$distPlot <- renderPlot({
    x    <- d1$Quantity
    bins <- seq(min(x), max(x), length.out = input$bins + 1)
    hist(x, breaks = bins, col = "light blue", border = "black",
         xlab = "Distribution of Quantity",
         main = ' ')
  })
  }
shinyApp(ui, server)
