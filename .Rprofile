## Don't ask me for my CRAN mirror every time
options("repos" = c(CRAN = "http://cran.rstudio.com/"))

## Check, if mypkg is installed, use: is.installed(mypkg) output: TRUE/FALSE
is.installed  <- function(mypkg) is.element(mypkg, installed.packages()[,1])

## Update to current development version of VimCom package to match
## installed development version of Vim-R-plugin
vimcom.reinstall  <- function() {
    if (is.installed("vimcom")) {
        print("VimCom installed, unloading VimCom package...")
        detach("package:vimcom", unload=TRUE)

        print("Removing old version...")
        remove.packages("vimcom")
        print("Old VimCom package removed")
    }
    print("Preparing fresh VimCom package:")
    print("Cloning VimCom repository...")
    system("git clone git://github.com/jalvesaq/VimCom.git /tmp/VimCom")

    print("Building package...")
    system("cd /tmp && R CMD build VimCom")

    print("Installing builded package...")
    system("cd /tmp && R CMD INSTALL vimcom_*.tar.gz")

    print("Loading new VimCom into current environment...")
    options(vimcom.allnames = TRUE)
    library(vimcom)

    print("Cleaning build directory...")
    system("cd /tmp && rm -fr VimCom && rm vimcom_*.tar.gz")
    print("Done.")

    print(" --------------------------                             ")
    print(" From now, all new launched R sessions use the latest   ")
    print(" development version of Vimcom package.                 ") 
    print(" Please, re-run 'vimcom.reinstall()' before/after every ")
    print(" update of devel version of Vim-R-plugin.               ")
}

## Packages to autoload in REPL
   if(interactive()){
       library(colorout)  #nice coloured output in R console
       library(setwidth)
       options(vimcom.allnames = TRUE)
       library(vimcom)  #needed for interaction with vim-r-plugin
   }
