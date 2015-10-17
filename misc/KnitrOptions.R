

.libPaths(c('~/R/x86_64-pc-linux-gnu-library/', .libPaths()))

# Default figure width
propOfTextwidth = 0.8

opts_chunk$set(
  echo = FALSE, 
  error = FALSE,
  cache = TRUE, 
  dev = 'cairo_pdf', 
  warning = FALSE,
  results = 'hide',
  message = FALSE,
  fig.width = 6.45 * propOfTextwidth,
  fig.height = 6.45 * propOfTextwidth * 0.5,
  fig.align = 'center',
  fig.pos = 't',
  #fig.showtext = TRUE, # Embeds fonts.
  out.width = paste0(propOfTextwidth,'\\textwidth'),
  dev.args=list(bg="transparent"),
  size = 'footnotesize'
  )
options(digits=2)




# Try and get knitr to plot numbers nicely without manually tuning each number

# Write a function for pvalues
p <- function(x, eps = 1e-3){

      if(x > 0.95){
          return("1.00")
        } else if(x > eps){
          if(round(x, 2) == round(x, 1)){
            return(sprintf("%.2f", x)) 
          } else {
            return(x)
          }

        } else  {
          return(10^(ceiling(log10(x))))
        }
      }

p <- function(x) return(x)


options('scipen' = -1)



# syntax highlighting.
# This is only used for echo = TRUE which won't be in the final thesis at all.

#knit_theme$set("camo")




  
