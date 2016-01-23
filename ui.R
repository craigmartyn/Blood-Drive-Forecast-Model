library(shiny)

shinyUI(navbarPage("Blood Drive Forecast",
        tabPanel("Model", pageWithSidebar(
                headerPanel("Blood Drive Forecast Model"),
                sidebarPanel(
                        ##Get user input on historical data and account type
                        numericInput("Drive1", "Drive 1 Units Collected",10,min=0),
                        numericInput("Drive2", "Drive 2 Units Collected",10,min=0),
                        numericInput("Drive3", "Drive 3 Units Collected",10,min=0),
                        selectInput("Account","Account Type",
                                c("Community"="1",
                                "Business"="2",
                                "School"="3"),
                                multiple=FALSE),
                        submitButton("Update Forecast"),
                        h5("Code is posted on github at: ", a("github.com/craigmartyn/Blood-Drive-Forecast-Model", href="https://github.com/craigmartyn/Blood-Drive-Forecast-Model"))
                ),
                mainPanel(
                        ##Disply forecast for next drive and plot of historical collections and forecast
                        h3("Forecast Model Output"),
                        h4("Forecast units collected at next drive:"),
                        verbatimTextOutput("forecast"),
                        plotOutput("forecastPlot")
                )
        )),
        tabPanel("Documentation", fluidPage(
                ##Show documentation
                htmlOutput('documentation'))
        )
))