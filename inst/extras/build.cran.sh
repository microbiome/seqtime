# For info on Travis R scripts, see
# http://jtleek.com/protocols/travis_bioc_devel/

# Roxygen tips:
# http://r-pkgs.had.co.nz/man.html

/usr/bin/R CMD BATCH document.R
/usr/bin/R CMD build ../../ --no-build-vignettes
#/usr/bin/R CMD build ../../
/usr/bin/R CMD check --as-cran seqtime_0.1.10002.tar.gz --no-build-vignettes
/usr/bin/R CMD INSTALL seqtime_0.1.10002.tar.gz
#/usr/bin/R CMD BATCH document.R

