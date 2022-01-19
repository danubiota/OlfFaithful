# Este histograma tem como objetivo ajudar a analisar a probabilidade
# (frequência) de erupção de um dos maiores gêisers do mundo, o Old Faithful.
# Ao entender a probabilidade de ocorrar a erupção de acordo com o tempo de
# espera, é possível estimar quando será a próxima erupção, dado que ajuda
# os visitantes do local.
# O tempo médio estimado entre erupções é de 72,31 minutos, mas o intervalo
# entre elas pode variar entre 43 e 108 minutos.
# Informações obtidas de:
# <https://rstudio-pubs-static.s3.amazonaws.com/377416_b7b768df75504a30a541d8cf654e8dc1.html>
# <https://www.stat.cmu.edu/~larry/all-of-statistics/=data/faithful.dat>
# Projeto em R retirado de <https://shiny.rstudio.com/tutorial/written-tutorial/lesson1/>

library(shiny)


ui <- fluidPage(

  # Título do site
  titlePanel("Histograma com dados do Gêiser Old Faithful."),


  sidebarLayout(


    sidebarPanel(


      sliderInput(inputId = "bins",
                  label = "Número de barras:",
                  min = 1,
                  max = 50,
                  value = 30)

    ),


    mainPanel(


      plotOutput(outputId = "distPlot")

    )
  )
)


server <- function(input, output) {

  # Histograma da base de dados do gêiser Old Faithful ----
  output$distPlot <- renderPlot({

    x    <- faithful$waiting
    bins <- seq(min(x), max(x), length.out = input$bins + 1)

    hist(x, breaks = bins, col = "#75AADB", border = "orange",
         xlab = "Tempo de espera até a próxima erupção (minutos)",
         main = "Histograma do tempo de espera")

  })

}


library(shiny)

shinyApp(ui = ui, server = server)

