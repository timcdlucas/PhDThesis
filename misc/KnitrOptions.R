

.libPaths(c('~/R/x86_64-pc-linux-gnu-library/', .libPaths()))

propOfTextwidth = 0.8

opts_chunk$set(
  echo = FALSE, 
  cache = 2, 
  dev = 'cairo_pdf', 
  warning = FALSE,
  results = 'hide',
  message = FALSE,
  fig.width = 6.45 * propOfTextwidth,
  fig.height = 6.45 * propOfTextwidth * 0.8,
  fig.align = 'center',
  fig.pos = 't',
  #fig.showtext = TRUE, # Embeds fonts.
  out.width = paste0(propOfTextwidth,'\\textwidth')
  )
options(digits=2)

#inline_hook <- function (x) {
#  if (is.numeric(x)) {
#    # ifelse does a vectorized comparison
#    # If integer, print without decimal; otherwise print two places
#    res <- ifelse(x == round(x),
#      sprintf("%d", x),
#      sprintf("%.2f", x)
#    )
#    paste(res, collapse = ", ")
#  }
#}
#knit_hooks$set(inline = inline_hook)




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

#p <- function(x) return(x)


options('scipen' = -1)

  
