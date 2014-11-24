library(shiny)
library(datasets)
library(ggplot2)


shinyServer(
  function(input, output) {

    
    output$choices <- renderPrint({input$transtype})
    output$newHist <- renderPlot({

        mtcars$am <- as.factor(mtcars$am)
        levels(mtcars$am) <- c("Automatic","Manual")
        mtcars$carnames <- as.character(rownames(mtcars))
        rownames(mtcars) <- 1:nrow(mtcars)
        type <- input$transtype
        horse <- input$hp
        ggplot(data = subset(mtcars,am == type & hp > horse), aes(x = carnames, y = mpg)) +
        theme_bw()+  
        geom_bar(stat="identity", fill="dodger blue4", colour="black") + 
        theme(axis.text.x = element_text(angle = 33, hjust =1))      
   })

    output$table <- renderTable({
      mtcars$am <- as.factor(mtcars$am)
      levels(mtcars$am) <- c("Automatic","Manual")
      mtcars$carnames <- as.character(rownames(mtcars))
      rownames(mtcars) <- 1:nrow(mtcars)
      type <- input$transtype
      horse <- input$hp
      mtcars$HP.Difference <- (mtcars$hp - horse)
      cars <- subset(mtcars,am == type & hp > horse)
      head(cars)
    })
    }
)
    
  
