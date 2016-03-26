library(shiny)

# Define UI for prescription copay application
shinyUI(pageWithSidebar(
        
        # Application title
        headerPanel("Calculate Estimate of Prescription Copay"),
        
        sidebarPanel(
                h4("Using the drugcost dataset from the package alr3, a model was built to predict a plan member's prescripton copay amount."),
                h4("Select values for 3 variables as inputs to the model in order to generate a prediction of the copay."),
                h4("Restrictiveness measures the range of drugs that can be dispensed. Zero means all drugs are dispensed, 100 means only one drug per category is available."),
                
                sliderInput("ri", "Indicate restrictiveness of plan (higher is more restrictive)", 0.3, 46.0,
                            20),
                
                h4("The months a plan has been active combined with the member count will measure the size of the plan in member months."),
                numericInput("mos", "Select months plan has been active:",12, min = 12, max = 24, step = 1),
                
                sliderInput("mem", "Select number of members in plan", 35, 58000,
                            20000),
                h4("Click submit to generate the estimate."),
                submitButton("Submit")
                
        ),
        
        mainPanel(
                h3('To estimate your copay, you entered:'),
                verbatimTextOutput("oid1"),
                h3('as the plan\'s restrictiveness,'),
                verbatimTextOutput("oid3"),
                h3('as the plan\'s member count.'),
                verbatimTextOutput("oid2"),
                h3('as the plan\'s active months,'),
                h3('Your copay is estimated to be:'),
                verbatimTextOutput("oid4")
         )
))
