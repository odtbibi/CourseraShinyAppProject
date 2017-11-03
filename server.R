library(shiny)
library(UsingR)
shinyServer(function(input, output) {
        fit<-lm(sheight~.,data=father.son)
        newx <- seq(min(father.son$fheight), max(father.son$fheight), length.out=100)
        preds <- predict(fit, newdata = data.frame(fheight=newx),interval = "confidence")
        
        
        pred <- reactive({
                fheightInput <- input$sliderfheight
                predict(fit, newdata = data.frame(fheight = fheightInput))
        })
        output$plot1 <- renderPlot({
                fheightInput <- input$sliderfheight
                plot(father.son$fheight, father.son$sheight, xlab = "Father's Height",
                     ylab = "Son's Height", col="gray",bty = "o", pch = 12)
                abline(fit, col = "red", lwd = 2)
                if(input$showInterval){
                        polygon(c(rev(newx), newx), c(rev(preds[ ,3]), preds[ ,2]), col = "lightblue", border = NA)
                        lines(newx, preds[ ,3], lty = 'dashed', col = 'black')
                        lines(newx, preds[ ,2], lty = 'dashed', col = 'black')
                }
                points(fheightInput, pred(), col = "blue", pch = 16, cex = 2)
                
        })
      
        url <- a("You can find more info on my github repository here", href="https://github.com/odtbibi/CourseraShinyAppProject")
        output$help <- renderUI({
                tagList( url)
        })
        
        output$predson <- renderText({
                paste("The predicted Son Height is:",round(pred(),2), " inch")
        })
})
