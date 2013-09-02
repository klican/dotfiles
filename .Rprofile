## Don't ask me for my CRAN mirror every time
options("repos" = c(CRAN = "http://cran.rstudio.com/"))

## Use vim as pager to see R docs when looking for help in R console
options(pager = "vim -c 'set ft=rdoc' -")

## Packages to autoload in REPL
   if(interactive()){
       library(colorout)  #nice coloured output in R console
       library(setwidth)
       options(vimcom.allnames = TRUE)
       library(vimcom)  #needed for interaction with vim-r-plugin
   }
