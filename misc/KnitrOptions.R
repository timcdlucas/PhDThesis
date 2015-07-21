

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



