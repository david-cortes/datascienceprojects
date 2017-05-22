library(LDAvis)
library(shiny)
#devtools::install_github("cpsievert/LDAvis")
library(lda)
library(tm)
library(stringr)
library(NLP)


process.text=function(tx){
  
  tx=str_sub(tx, start = 1L, end = str_locate(tx,"http")-5)
  stop_words= stopwords("SMART")
  tx <- gsub("'", "", tx)
  tx <- gsub("[[:punct:]]", " ", tx)
  tx <- gsub("[[:cntrl:]]", " ", tx)
  tx <- gsub("^[[:space:]]+", "", tx)
  tx <- gsub("[[:space:]]+$", "", tx)
  tx <- tolower(tx)
  
  doc.list <- strsplit(tx, "[[:space:]]+")
  
  term.table <- table(unlist(doc.list))
  term.table <- sort(term.table, decreasing = TRUE)
  
  del <- names(term.table) %in% stop_words | term.table < 5
  term.table <- term.table[!del]
  vocab <- names(term.table)
  
  get.terms <- function(x) {
    index <- match(x, vocab)
    index <- index[!is.na(index)]
    rbind(as.integer(index - 1), as.integer(rep(1, length(index))))
  }
  documents <- lapply(doc.list, get.terms)
  
  doc.length <- sapply(documents, function(x) sum(x[2, ]))
  term.frequency <- as.integer(term.table) 
  
  return(list(documents,vocab,term.frequency,doc.length))
}


run.algorithm=function(k,data){
  documents=data[[1]]
  vocab=data[[2]]
  term.frequency=data[[3]]
  doc.length=data[[4]]
  G <- 500 #Number of samples
  alpha <- 0.02
  eta <- 0.02
  
  fit <- lda.collapsed.gibbs.sampler(documents = documents, K = k, vocab = vocab, 
                                     num.iterations = G, alpha = alpha, 
                                     eta = eta, initial = NULL, burnin = 0,
                                     compute.log.likelihood = TRUE)
  
  
  theta <- t(apply(fit$document_sums + alpha, 2, function(x) x/sum(x)))
  phi <- t(apply(t(fit$topics) + eta, 2, function(x) x/sum(x)))
  vars <- list(phi = phi,
               theta = theta,
               doc.length = doc.length,
               vocab = vocab,
               term.frequency = term.frequency)
  invisible(vars)
}

tx=read.csv("tweets.csv", encoding="utf-8", row.names=1, sep="", stringsAsFactors=FALSE)
tx=as.matrix(tx)
tx=as.vector(tx)
data=process.text(tx)


shinyServer(function(input, output, session) {
  output$viz <- renderVis({
    with(run.algorithm(input$topics,data),
         createJSON(phi, theta, doc.length, vocab, term.frequency,
                    R = input$terms))})
})

