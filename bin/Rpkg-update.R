#!/usr/bin/env Rscript

## Script to automate (re)installation of individual packages, that do not
## have sufficiently recent versions on CRAN, or packages which are not
## present at all on CRAN  for some reason.

### 'is.installed()' helper function:
## Check, if mypkg is installed, use: is.installed(mypkg) output: TRUE/FALSE
is.installed  <- function(mypkg) is.element(mypkg, installed.packages()[,1])

### colorout
## Package colorout is not on CRAN, we have to install it manually.
## Home: http://www.lepem.ufc.br/jaa/colorout.html
colorout.install  <- function() {
    if (is.installed("colorout") == FALSE) {

        print("Package 'colorout' not present on system, installing...")
        download.file("http://www.lepem.ufc.br/jaa/colorout_1.0-1.tar.gz", destfile = "/tmp/colorout_1.0-1.tar.gz")
        install.packages("/tmp/colorout_1.0-1.tar.gz", type = "source", repos = NULL)
        print("Package colorout installed in $R_LIBS_USER path")
        # colorout is now installed, we don't need tarball anymore
        system("rm /tmp/colorout_1.0-1.tar.gz")
    }
}

### VimCom
## Home: https://github.com/jalvesaq/VimCom
## Update to current development version of VimCom package to match
## the installed development version of Vim-R-plugin.
vimcom.reinstall  <- function() {
    if (is.installed("vimcom")) {

        print("VimCom installed, removing old version...")
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

    print("Cleaning build directory...")
    system("cd /tmp && rm -fr VimCom && rm vimcom_*.tar.gz")
    print("Package VimCom installed in $R_LIBS_USER path")

    print(" --------------------------                             ")
    print(" From now, all new launched R sessions use the latest   ")
    print(" development version of Vimcom package.                 ") 
    print(" Please, re-run 'vimcom.reinstall()' before/after every ")
    print(" update of devel version of Vim-R-plugin.               ")
}

colorout.install()
vimcom.reinstall()
