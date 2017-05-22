library(LDAvis)

shinyUI(
  fluidPage(
    titlePanel("Topic Modelling"),
    
    
      mainPanel(tabsetPanel(
        tabPanel(strong("Instructions"),
                 h3("Description:"),
                 br(),
                 p("This small application performs topic modeling using Latent Dirichlet Allocation on the last 100 tweets from the twitter accounts ",
                   a("rbloggers,",href="https://twitter.com/rbloggers"),
                   a("revolutionr,",href="https://twitter.com/revolutionr"),
                   a("kdnuggets,",href="https://twitter.com/kdnuggets"),
                   a("ibmbigdata,",href="https://twitter.com/ibmbigdata"),
                   a("JulianHi,",href="https://twitter.com/JulianHi"),
                   "obtained on 19.06.2015 (All of them popular Data Science sites and communities).
                   Due to security reasons, the tweets were saved rather than have the application harvest them periodically from twitter.
                   This is normally performed with a larger base of texts and far more words and topics (and if you take a look at the details
                   of this algorithm, also with more resamples), but since this is uploaded on a free hosting service with limited capabilities,
                   it was simplified to make it less computationaly demanding."),
                 br(),
                 em("Note: the computations are slow so it might take several seconds to show the plot or to update. Also, this algorithms works
                    by performing random resamples, so you might get different results if you select the same settings twice, and you might get more
                    than one possible result."),
                 br(),
                 h3("How it works:"),
                 br(),
                 p("Topic modeling is used to determine, as its name indicates it, what topics are being treated in some texts and
                   what these topics are about."),
                 p("In the next tab (at the top of this page), you will have to select how many topics are there in these tweets and how many words to display to characterize each topic.
                   Unfortunately, no algorithm so far can do a good job at automatically finding the topics of texts,
                   so it has to be done manually.
                   In the plot that will appear below, you will be able see and click the topics and check what words characterize them.
                   You can also see how far apart are these topics from each other (based on the first two",
                   a("Principal Components",href="https://en.wikipedia.org/wiki/Principal_component_analysis"),
                   " - you can also try to interpret what they measure, but this is subjective)",
                    " and if you know the algorithm, you can also adjust the relevance metric.")
                 ),
        
        tabPanel(strong("Results"),
                 fluidRow(
                  column(6,sliderInput("topics", "Number of topics", min = 2, max = 20, value = 5)),
                  column(6,sliderInput("terms", "Number of terms per topic", min = 2, max = 20, value = 5))
                ),
                 visOutput('viz'))
      )
    ))
    
   
    
  )