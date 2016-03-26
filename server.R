library(shiny)

# Define server logic required to to calculate and display prescription Copay
shinyServer(function(input, output) {
        
       
        output$oid1 <- renderPrint({input$ri})
        output$oid2 <- renderPrint({input$mos})
        output$oid3 <- renderPrint({input$mem})
        output$oid4 <- renderPrint({round(5.486446 + (input$ri * 0.04641785)
                                          + (input$mos * input$mem * -0.000001611097 )
                                          + (input$ri * input$mos * input$mem * 0.00000007610164), 2 )})
        
})
