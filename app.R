library()

library(shiny)

ui <- fluidPage(
    
    
    titlePanel(strong("Anom")),
    
    
    tabsetPanel(
        type = "pills",

        tabPanel(
            "Data",
            titlePanel("Chargement du Fichier"),
            sidebarLayout(sidebarPanel(
                fileInput(
                    inputId = "info",
                    label = "Choisissez votre fichier",
                    accept = c("Excel", "Excel file", ".xlsx"),
                    buttonLabel = "Chargez ... "
                )
                
                
                
            ),
                mainPanel(
                    ##################### main panel
                    h4("Un aperçu de la table INFO : "),
                    tableOutput("info_content")
                ))
        ), 
        
        
        tabPanel(
            
            title = "Anom", 
            
            titlePanel("Anomalie Detection"), 
            
            
            
            
            
            
            
        )
        
    )
    
    

   
)

server <- shinyServer(function(input, output, session) {
    
    data <- reactive({
        req(input$info) 
        inFile <- input$info 
        df <- rio::import(inFile$datapath)
        return(df)
    })
    
    
    output$info_content <- renderTable({
        head(data())
    })
    
    
    
    
    
})

shinyApp(ui = ui, server = server)
