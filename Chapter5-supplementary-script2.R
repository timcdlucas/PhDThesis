
# S4
# Supplementary R script from
# A generalised random encounter model for estimating animal density with remote sensor data
# Tim C.D. Lucas, Elizabeth A. Moorcroft, Robin Freeman, Marcus J. Rowcliffe, Kate E. Jones
#
# calcDensity is the main function to calculate density.
# It takes parameters z, alpha, theta, r, animalSpeed, t
# z - The number of camera/acoustic counts or captures.
# alpha - Call width in radians.
# theta - Sensor width in radians.
# r - Sensor range in metres.
# animalSpeed - Average animal speed in metres per second.
# t - Length of survey in sensor seconds i.e. number of sensors x survey duration.
#
# calcAbundance calculates abundance rather than density and requires an extra parameter
# area - In metres squared. The size of the region being examined.


# Internal function to calculate profile width as described in the text
calcProfileWidth <- function(alpha, theta, r){
        if(alpha > 2*pi | alpha < 0) 
		stop('alpha is out of bounds. alpha should be in interval 0<a<2*pi')
        if(theta > 2*pi | theta < 0) 
		stop('theta is out of bounds. theta should be in interval 0<a<2*pi')

	if(alpha > pi){
	        if(alpha < 4*pi - 2*theta){
		        p <- r*(theta - cos(alpha/2) + 1)/pi
                } else if(alpha <= 3*pi - theta){
                        p <- r*(theta - cos(alpha/2) + cos(alpha/2 + theta))/pi
                } else {
                        p <- r*(theta + 2*sin(theta/2))/pi
                }
        } else {
        	if(alpha < 4*pi - 2*theta){
                        p <- r*(theta*sin(alpha/2) - cos(alpha/2) + 1)/pi
 		} else {
                        p <- r*(theta*sin(alpha/2) - cos(alpha/2) + cos(alpha/2 + theta))/pi
                }
        }
        return(p)
}
# Calculate a population density. See above for units etc.
calcDensity <- function(z, alpha, theta, r, animalSpeed, t){
        # Check the parameters are suitable.
        if(z <= 0 | !is.numeric(z)) stop('Counts, z, must be a positive number.')
        if(animalSpeed <= 0 | !is.numeric(animalSpeed)) stop('animalSpeed must be a positive number.')
        if(t <= 0 | !is.numeric(t)) stop('Time, t, must be a positive number.')

        # Calculate profile width, then density.
        p <- calcProfileWidth(alpha, theta, r)
        D <- z/{animalSpeed*t*p}
        return(D)
}

# Calculate abundance rather than density.
calcAbundance <- function(z, alpha, theta, r, animalSpeed, t, area){
        if(area <= 0 | !is.numeric(area)) stop('Area must be a positive number')
        D <- calcDensity(z, alpha, theta, r, animalSpeed, t)
        A <- D*area
        return(A)
}
