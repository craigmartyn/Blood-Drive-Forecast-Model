library(shiny)

shinyServer(
        function(input,output) {
                BDF<-reactive({
                        x<-c(1,2,3)
                        y<-c(input$Drive1,input$Drive2,input$Drive3)
                        next.x<-data.frame(x=4)
                        ##Fit a linear model using the number of the drive in order (1-3) as a predictor of units collected as input byt the user 
                        BDModel<-lm(y~x)
                        ##Use this model to predict collections for the next (4th) drive
                        BaseForecast<-predict(BDModel,next.x)
                        ##Adjust the forecast based on account type input by the user
                        ##Multiply by 0.95 for Business accounts (Account=2)
                        AdjForecast <- if (input$Account == "2")           {
                                BaseForecast*0.95
                        ##Multiply by 1.05 for School accounts (Account=3)
                        } else if (input$Account == "3")    {
                                BaseForecast*1.05
                        ##Otherwise do not adjust for Community accounts (Account=2)
                        } else
                                BaseForecast
                        AdjForecast
                })
                ##Output forecast for next blood drive
                output$forecast<-renderPrint({BDF()})
                ##Output plot of hisotorical collections and forecast
                output$forecastPlot <- renderPlot(barplot(c(input$Drive1,input$Drive2,input$Drive3,BDF()),
                        main="Forecast Plot",
                        col=c(4,4,4,2),
                        names.arg=c("Drive 1","Drive 2","Drive 3","Forecast")))
                ##Read in documentation file
                output$documentation <- renderText({  
                        readLines("Documentation/Blood_Drive_Forecast_Documentation.html")  
                })
                        }
)
