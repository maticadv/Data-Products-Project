library(shiny)
library(ggplot2)

dataset <- mtcars

shinyUI(pageWithSidebar(
        
        headerPanel("Mtcars Data Relation"),
        
        sidebarPanel(
                
                sliderInput('sampleSize', 'Number of cars', min=10, max=nrow(dataset),
                            value=min(10, nrow(dataset)), step=5, round=0),
                
                selectInput('x', 'Axe X', names(dataset)),
                selectInput('y', 'Axe Y', names(dataset), names(dataset)[[2]]),
                selectInput('color', 'Color', c('None', names(dataset))),
                
                # checkboxInput('jitter', 'Jitter'),
                checkboxInput('smooth', 'Tendency'),
                
                selectInput('facet_row', 'Facet Row', c(None='.', names(dataset))),
                selectInput('facet_col', 'Facet Column', c(None='.', names(dataset)))
        ),
        
        mainPanel(
                plotOutput('plot')
        )
))