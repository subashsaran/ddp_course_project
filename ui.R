library(shiny)
library(ggplot2)

dataset <- diamonds

shinyUI(fluidPage(navbarPage("Coursera Developing Data Products: Course Project"),
 
        titlePanel("Diamonds Dataset Analysis"),
        sidebarLayout(
                sidebarPanel(
                        
                        h3('Tweek the Plot'),
                
                sliderInput('sampleSize', 'Sample Size', min=1, max=nrow(dataset),
                            value=min(1000, nrow(dataset)), step=500, round=0),
                
                selectInput('x', 'X', names(dataset)),
                selectInput('y', 'Y', names(dataset), names(dataset)[[2]]),
                selectInput('color', 'Color', c('None', names(dataset))),
                
                checkboxInput('jitter', 'Jitter'),
                checkboxInput('smooth', 'Smooth'),
                
                selectInput('facet_row', 'Facet Row', c(None='.', names(dataset))),
                selectInput('facet_col', 'Facet Column', c(None='.', names(dataset))),
                downloadButton('downloadData', 'Download Train set'),
                 tags$br(),
                 tags$br(),
                strong('Column names:'),
                tags$ul(
                        tags$li('carat: weight of the diamond (0.2-5.01)'),
                        tags$li('cut: quality of the cut (Fair, Good, Very Good, Premium, Ideal)'),
                        tags$li('color: diamond colour, from J (worst) to D (best)'),
                        tags$li('clarity: a measurement of how clear the diamond is (I1 (worst), SI1, SI2, VS1, VS2, VVS1, VVS2, IF (best))'),
                        tags$li('x: length in mm (0-10.74)'),
                        tags$li('y: width in mm (0-58.9)'),
                        tags$li('z: depth in mm (0-31.8)'),
                        tags$li('depth: total depth percentage = z / mean(x, y) = 2 * z / (x + y) (43-79)'),
                        tags$li('table: width of top of diamond relative to widest point (43-95)')
                ),
                        strong('SPECIAL NOTES:'),
                        p(' Diamonds is a dataset containing the prices of round cut diamonds and other attributes of almost 54,000 diamonds.'),
                        tags$br(),
                        p('A brilliant is a diamond or other gemstone, cut in a particular form '),
                        p('with numerous facets so as to have exceptional brilliance.'),
                        p('The shape resembles that of a cone and provides maximized light return through the top of the diamond.')
                      
                   
                ),
                
        
                mainPanel(
                        h2('Basic Introductory Exploratory Analysis'),
                        p('Please note that this is a very basic App intended to provide some introductory exploratory analysis.'),
                        p("It uses solely the training dataset in RStudio, which you can easily download.However you could reproduce this analysis following this link"),
                        a("http://shiny.rstudio.com/articles/shinyapps.html"),
                        p('On the side panel you can change the variables that are injected to the plot (from ggplot2 library).'),
                        p('You can change which variable go the the X-axis, Y-axis, color by variable, and include jitter, smooth, and row/column facets.'),
                        p('Use it to your advantage in order to extract the maximum logic conclusions out of the plot for latter implementation of Machine Learning Algorithms.'),
                        strong('About the plot'),
                        p('The plot has already some variables choosen by default, to help you interprete the data.')
                        
                ),
                
                plotOutput('plot'),
                tags$br(),
                tags$br(),
                tags$br(),
                tags$br(),
                tags$br(),
                tags$br(),
                tags$br(),
                tags$br(),
                tags$br(),
                tags$br(),
                tags$br(),
                tags$br(),
                tags$br(),
                tags$br(),
                tags$br(),
                tags$br(),
                tags$br(),
                h4('Training Dataset'),
                p('Finally, you can view the raw training dataset and play with it as well.'),
                tags$br(),
                tabPanel('trainData', dataTableOutput('diamond_table'))
        )
)
)
)
