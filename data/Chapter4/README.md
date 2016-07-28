Chapter 4: A mechanistic model to compare the importance of interrelated population measures: host population size, density and colony size
===================================================================================================================================================================

The four csv files in this directory contain the data needed for Chapter 4.
As with Chapter 2, the raw simulation data was not saved (it was pretty large). 
Only a summary was recorded.
However, the full, raw data, or this summary can be recreated by running [Chapter4.Rtex](../../Chapter4.Rtex).

[PopSims.csv](PopSims.csv) contains the results for the simulations where population size is kept constant while density is altered by changing area.

[DensSims.csv](DensSims.csv) contains the results for the simulations where population size is altered by changing colony size and population density is kept constant by altering area to match the changing population size.


[Dens2Sims.csv](Dens2Sims.csv) contains the results for the simulations where population size is altered by changing the number of colonies and population density is kept constant by altering area to match the changing population size.




All these files contain columns:
* transmission - the transmission rate (beta)
* dispersal - the dispersal rate (delta)
* nExtantDis - the number of disease extant at the end of the simulation
* nPathogens - The number of pathogens put into the simulations (always 2)
* meanK - the mean degree of the metapopulation network
* maxDistance - The threshold distance within which two colonies are joined in the metapopulation network (always 100 in these simulations)
* nEvents - the total number of events in the simulation (8e5)
* colonySize - the starting number of individuals in each colony
* colonyNumber - the number of colonies in the metapopulation
* pop - the total population size
* area - the spatial area for each simulation
* dens - population per area.

