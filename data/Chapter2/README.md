Data for Chapter 2
===================

Understanding how population structure affects pathogen richness in a mechanistic model of bat populations
-----------------------------------------------------------------------------------------------------------

The data in this folder are all outputs from simulations. 
Running the simulations in [Chapter2.Rtex](Chapter2.Rtex) will reproduce these files.


Main study
-----------

[DispSims.csv](data/Chapter2/DispSims.csv) and [extraMidBeta.csv](data/Chapter2/extraMidBeta.csv) are the results for the dispersal simulations.

[TopoSims.csv](data/Chapter2/TopoSims.csv) contains the results for the network topology simulations.

[unstructuredSims.csv](data/Chapter2/unstructuredSims.csv) contains the results for the unstructured simulations (i.e. one colony with population size 30,000).

[noDispSims.csv](data/Chapter2/noDispSims.csv) contains the results for the zero dispersal simulations which are then also used for the completely unconnected metapopulaiton network as well.

These files are all flat csv files, with missing data indicated by 'NA'. 
They contain a column of row names, which in this case are just integers 1 - number of rows.


All these files contain columns:
* transmission - the transmission rate (beta)
* dispersal - the dispersal rate (delta)
* nExtantDis - the number of disease extant at the end of the simulation
* singleInf - the number of individuals infected with one pathogen
* doubleInf - the number of individuals infected with two pathogens
* nColonies - the number of colonies in the metapopulation
* meanK - the mean degree of the metapopulation network
* maxDistance - The threshold distance within which two colonies are joined in the metapopulation network (always 100 in these simulations)
* nEvents - the total number of events in the simulation (8e5)

[extraMidBeta.csv](data/Chapter2/extraMidBeta.csv) and [noDispSims.csv](data/Chapter2/noDispSims.csv) additionally contains columns relating to the absolute length of time the simulation covers (simulation time, not computational time).

* extinctionTime - at what time did the invading pathogen go extinct (NA if it didn't go extinct).
* totalTime - total length of time simulated
* survivalTime - how long did the invading pathogen survive (NA if it didn't go extinct).
* pathInv - the time that the second pathogen was seeded into the simulation. Pathogen 2 is seeded after a certain number events, not a strict amount of time, after the beginning of the simulation.




Appendices
------------

[Appen1.RData](data/Chapter2/Appen1.RData), [Appen22.RData](data/Chapter2/Appen22.RData), [Appen24.RData](data/Chapter2/Appen24.RData) and [Appen25.RData](data/Chapter2/Appen25.RData) contain the full simulation objects for the four example simulations plotted in the appendix. 
The objects are named either p1 or p2.
They are a large list containing all the information used to define the simulations and the full output of the simulations (see [help files](https://github.com/timcdlucas/MetapopEpi/blob/master/man/makePop.Rd) in the [MetapopEpi](https://github.com/timcdlucas/metapopEpi) package for more details).
See [Appendix2.Rtex](Appendix2.Rtex) for code for generating and analysing the data.




Length of simulations 
---------------------

The files in [DispSims](data/Chapter2/DispSims) and [TopoSims](data/Chapter2/TopoSims) are generated and analysed in [Appendix2.Rtex](Appendix2.Rtex) and are used to check whether using a fixed number of events rather than a fixed simulation time introduced bias (see methods in [Chapter2.Rtex](Chapter2.Rtex)).
They are all `.RData` files containing a single simulation object as described above.






