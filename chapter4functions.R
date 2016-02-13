

  #################################
  # Density sim definitions       #
  #################################


# Define our simulation function.
fullSim <- function(x){

  # Set seed (this is set within each parallel simulation to prevent reusing random numbers).
  simSeed <- paste0(seed, x)
  set.seed(simSeed)

  # Make the population.
  p <- makePop(space = side[x], 
               transmission = tran[x], 
               meanColonySize = colonySize[x], 
               nColonies = 20, 
               model = 'SIR', 
               events = nEvent, 
               nPathogens = 2, 
               recovery = 0.5,  
               sample = sample, 
               dispersal = 0.01, 
               birth = 0.05, 
               death = 0.05,
               crossImmunity = 0.1, 
               infectDeath = 0,
               maxDistance = 100)

  p$I[1, , 1] <- colonySize[x] - 20

  # Seed endemic pathogen.
  p$I[3, , 1] <- 20
  
  # Recalculate rates of each event after seeding.
  p <- transRates(p, 1)

  # Burn in simulation
  p <- runSim(p, end = invadeT)

  # Seed invading pathogen.
  p$I[2, 1, (invadeT + 1) %% sample] <- 5
  
  # Recalculate rates of each event after seeding.
  p <- transRates(p, (invadeT + 1) %% sample)

  # Continue simulation
  p <- runSim(p, start = invadeT + 1, end = 'end')

  # Was the invasion succesful?
  invasion <- findDisDistr(p, 2)[1] > 0

  # Save summary stats
  d <- data.frame(transmission = NA)

  d$transmission <- p$parameters['transmission']
  d$dispersal <- p$parameters['dispersal']
  d$nExtantDis <- sum(findDisDistr(p, 2) > 0)
  d$nPathogens <- p$parameters['nPathogens']
  d$meanK <- sum(p$adjacency != 0 )/p$parameters['nColonies']
  d$maxDistance <- p$parameters['maxDistance']
  d$nEvents <- p$parameters['events']
  d$colonySize <- p$parameters['meanColonySize']
  d$colonyNumber <- p$parameters['nColonies']
  d$pop <- p$parameters['meanColonySize'] * p$parameters['nColonies']
  d$area <- p$parameters['space']^2
  d$dens <- d$pop / d$area


  message(paste0("finished ", x, ". Invasion: ", invasion ))
  message(paste('trans:', d$transmission, 'nColonies:', d$colonyNumber, 
    'colonySize:', d$colonySize, 'dens:', d$dens, 'pop:', d$pop))
  
  if(saveData){ 
    file <- paste0('data/Chapter4/DensSim_', formatC(x, width = 4, flag = '0'), '.RData')
    save(p, file = file)
  }

  rm(p)

  return(d)

}


  #################################
  # Density2 sim definitions      #
  #################################

# Define our simulation function.
fullSim <- function(x){

  # Set seed (this is set within each parallel simulation to prevent reusing random numbers).
  simSeed <- paste0(seed, x)
  set.seed(simSeed)

  # Make the population.
  p <- makePop(space = side[x], 
               transmission = tran[x], 
               meanColonySize = colonySize, 
               nColonies = colonyNumber[x], 
               model = 'SIR', 
               events = nEvent, 
               nPathogens = 2, 
               recovery = 0.5,  
               sample = sample, 
               dispersal = 0.01, 
               birth = 0.05, 
               death = 0.05,
               crossImmunity = 0.1, 
               infectDeath = 0,
               maxDistance = 100)

  p$I[1, , 1] <- colonySize - 20

  # Seed endemic pathogen.
  p$I[3, , 1] <- 20
  
  # Recalculate rates of each event after seeding.
  p <- transRates(p, 1)

  # Burn in simulation
  p <- runSim(p, end = invadeT)

  # Seed invading pathogen.
  p$I[2, 1, (invadeT + 1) %% sample] <- 5
  
  # Recalculate rates of each event after seeding.
  p <- transRates(p, (invadeT + 1) %% sample)

  # Continue simulation
  p <- runSim(p, start = invadeT + 1, end = 'end')

  # Was the invasion succesful?
  invasion <- findDisDistr(p, 2)[1] > 0

  # Save summary stats
  d <- data.frame(transmission = NA)

  d$transmission <- p$parameters['transmission']
  d$dispersal <- p$parameters['dispersal']
  d$nExtantDis <- sum(findDisDistr(p, 2) > 0)
  d$nPathogens <- p$parameters['nPathogens']
  d$meanK <- sum(p$adjacency != 0 )/p$parameters['nColonies']
  d$maxDistance <- p$parameters['maxDistance']
  d$nEvents <- p$parameters['events']
  d$colonySize <- p$parameters['meanColonySize']
  d$colonyNumber <- p$parameters['nColonies']
  d$pop <- p$parameters['meanColonySize'] * p$parameters['nColonies']
  d$area <- p$parameters['space']^2
  d$dens <- d$pop / d$area


  message(paste0("finished ", x, ". Invasion: ", invasion ))
  message(paste('trans:', d$transmission, 'nColonies:', d$colonyNumber, 
    'colonySize:', d$colonySize, 'dens:', d$dens, 'pop:', d$pop))

  if(saveData){ 
    file <- paste0('data/Chapter4/DensSim_', formatC(x, width = 4, flag = '0'), '.RData')
    save(p, file = file)
  }

  rm(p)

  return(d)

}







  #################################
  # Population sim definitions    #
  #################################


# Define our simulation function.
fullSim <- function(x){

  # Set seed (this is set within each parallel simulation to prevent reusing random numbers).
  simSeed <- paste0(seed, x)
  set.seed(simSeed)

  # Make the population.
  p <- makePop(space = side[x], 
               transmission = tran[x], 
               meanColonySize = colonySize, 
               nColonies = 20, 
               model = 'SIR', 
               events = nEvent, 
               nPathogens = 2, 
               recovery = 0.5,  
               sample = sample, 
               dispersal = 0.01, 
               birth = 0.05, 
               death = 0.05,
               crossImmunity = 0.1, 
               infectDeath = 0,
               maxDistance = 100)

  p$I[1, , 1] <- colonySize - 20

  # Seed endemic pathogen.
  p$I[3, , 1] <- 20
  
  # Recalculate rates of each event after seeding.
  p <- transRates(p, 1)

  # Burn in simulation
  p <- runSim(p, end = invadeT)

  # Seed invading pathogen.
  p$I[2, 1, (invadeT + 1) %% sample] <- 5
  
  # Recalculate rates of each event after seeding.
  p <- transRates(p, (invadeT + 1) %% sample)

  # Continue simulation
  p <- runSim(p, start = invadeT + 1, end = 'end')

  # Was the invasion succesful?
  invasion <- findDisDistr(p, 2)[1] > 0

  # Save summary stats
  d <- data.frame(transmission = NA)


  d$transmission <- p$parameters['transmission']
  d$dispersal <- p$parameters['dispersal']
  d$nExtantDis <- sum(findDisDistr(p, 2) > 0)
  d$nPathogens <- p$parameters['nPathogens']
  d$meanK <- sum(p$adjacency != 0 )/p$parameters['nColonies']
  d$maxDistance <- p$parameters['maxDistance']
  d$nEvents <- p$parameters['events']
  d$colonySize <- p$parameters['meanColonySize']
  d$colonyNumber <- p$parameters['nColonies']
  d$pop <- p$parameters['meanColonySize'] * p$parameters['nColonies']
  d$area <- p$parameters['space']^2
  d$dens <- d$pop / d$area


  message(paste0("finished ", x, ". Invasion: ", invasion ))
  message(paste('trans:', d$transmission, 'nColonies:', d$colonyNumber, 
    'colonySize:', d$colonySize, 'dens:', d$dens, 'pop:', d$pop))
  
  if(saveData){ 
    file <- paste0('data/Chapter4/PopSim_', formatC(x, width = 4, flag = '0'), '.RData')
    save(p, file = file)
  }

  rm(p)

  return(d)

}
