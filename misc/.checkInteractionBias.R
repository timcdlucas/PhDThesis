allFormulae <- allFormulae[1:32]

allModelMat <- allModelMat[1:32,]



modelSelect <- function(allForm, data, phy, boot, allModelMat, varList){
  
  set.seed(paste0('123', boot))
  bootData <- cbind(data, rand = runif(nrow(data)))


  coefs <- matrix(NA, ncol = length(varList) + 1, nrow = nrow(allModelMat), 
             dimnames = list(NULL, paste('beta', c('(Intercept)', varList))))

  results <- apply(allModelMat, 1, function(x) sapply(c(varList), function(y) y %in% x)) %>%
               t %>%
               data.frame %>%
               cbind(AIC = NA, boot = boot, lambda = NA, attempt = NA, predictors = NA, coefs)

  # Fit each model 
  # I'm having problems with convergence so sometimes have to try different starting values.
  for(m in 1:length(allForm)){
    if(exists('model')){
      rm(model)
    }
    try({
      model <- gls(allForm[[m]], correlation = corPagel(value = 0.4, phy = phy), data = bootData, method = 'ML')  
      results$attempt[m] <- 1
    }) 
    if(!exists('model')){
      try({
        model <- gls(allForm[[m]], correlation = corPagel(value = 0.3, phy = phy), data = bootData, method = 'ML')  
        results$attempt[m] <- 2
      }) 
    }
    if(!exists('model')){
      try({
        model <- gls(allForm[[m]], correlation = corPagel(value = 0.2, phy = phy), data = bootData, method = 'ML')  
        results$attempt[m] <- 3
      }) 
    }
    if(!exists('model')){
        try({
          model <- gls(allForm[[m]], correlation = corPagel(value = 0.1, phy = phy), data = bootData, method = 'ML')  
          results$attempt[m] <- 4
        }) 
      }
    if(!exists('model')){
      try({
        model <- lm(allForm[[m]], data = bootData) 
        results$attempt[m] <- 5
        message('Running lm')
      }) 
    }
    #model <- pgls(allForm[[m]], data = compBootData, lambda = 'ML')
    results$AIC[m] <- AICc(model)

    if(inherits(model, 'gls')){
        results$lambda[m] <- model$modelStruct$corStruct[1]
    }

    results$predictors[m] <- allForm[[m]] %>% as.character %>% .[3]


    results[m, paste('beta', names(coef(model)))] <- coef(model)

    message(paste('Boot:', boot, ', m:', m, '\n'))
  }

  results$dAIC <- results$AIC - min(results$AIC)
  results$weight <- exp(- 0.5 * results$dAIC) / sum(exp(- 0.5 * results$dAIC))


  return(results)

}


fitModelsBootStrap <- lapply(1:nBoots, function(b) modelSelect(allFormulae, nSpecies, pruneTree, b, allModelMat, varList))

allResults <- do.call(rbind, fitModelsBootStrap)

names(allResults)


varWeights <- sapply(names(allResults)[1:5], function(x) sum(allResults$weight[allResults[, x]])/nBoots)
