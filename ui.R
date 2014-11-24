library(shiny)

shinyUI(
  pageWithSidebar(
    headerPanel("Car Selection"),
  

  sidebarPanel(      
      selectInput("transtype", "Choose tranmission type:",
                  choices <- c("Automatic","Manual")),
      numericInput("hp","Enter minimum desired Horsepower:",50,max = 300),
      submitButton('Submit')
  ),
    mainPanel(
        h3('Car Results'),
        h4('You Selected'),
        verbatimTextOutput("choices"),
        plotOutput('newHist'),
        tableOutput('table')
    )
    
  )
)
