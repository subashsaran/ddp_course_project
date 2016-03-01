library(shiny)
library(ggplot2)

function(input, output) {
        #Option to choose sample size
        dataset <- reactive({
                diamonds[sample(nrow(diamonds), input$sampleSize),]
        })
        #Option to download the Dataset
        output$downloadData <- downloadHandler(
                filename = function() { paste(input$dataset, '.csv', sep='') },
                content = function(file) {
                        write.csv(dataset(), file)
                }
        )
        #View the dataset in table
        output$diamond_table <- renderDataTable({
                diamonds
        }, options = list(bSortClasses = TRUE))
        #Plotting
        output$plot <- renderPlot({
                
                p <- ggplot(dataset(), aes_string(x=input$x, y=input$y)) + geom_bar(stat = "identity")
                
                if (input$color != 'None')
                        p <- p + aes_string(color=input$color)
                
                facets <- paste(input$facet_row, '~', input$facet_col)
                if (facets != '. ~ .')
                        p <- p + facet_grid(facets)
                
#                 if (input$jitter)
#                         p <- p + geom_jitter()
#                 if (input$smooth)
#                         p <- p + geom_smooth()
                
                print(p)
                
        }, height=700)
        
        }