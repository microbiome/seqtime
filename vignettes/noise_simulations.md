---
title: "Noise simulation examples"
date: "2018-01-10"
output: 
  rmarkdown::html_vignette:
    toc: true
vignette: >
  %\VignetteIndexEntry{seqtime examples: noise simulation}
  %\VignetteEngine{knitr::rmarkdown}
  %\VignetteEncoding{UTF-8}
  \usepackage[utf8]{inputenc}
---

Simulating noise types (following [this](http://stackoverflow.com/questions/8697567/how-to-simulate-pink-noise-in-r))





```r
library(tuneR)

# White noise
w <- tuneR::noise(kind = c("white"))

# Brown noise is integrated white noise
# (ie. random walk)
# Use same time series length as in the other series
b <- cumsum(rnorm(length(w@left)))

# Pink noise
p <- tuneR::noise(kind = c("pink"))

# Visualize
par(mfrow=c(3,1))
plot(w,main="white noise")
plot(b,main="brown noise")
plot(p,main="pink noise")
```

![plot of chunk noise_simu](figure_noise_simulations/noise_simu-1.png)

Estimating Hurst exponent for the noises


```r
library(pracma)
Hwhite <- hurstexp(w@left, d = 128)
```

```
## Simple R/S Hurst estimation:         0.5275683 
## Corrected R over S Hurst exponent:   0.5214487 
## Empirical Hurst exponent:            0.4889119 
## Corrected empirical Hurst exponent:  0.4739127 
## Theoretical Hurst exponent:          0.5155387
```

```r
Hbrown <- hurstexp(b, d = 128)
```

```
## Simple R/S Hurst estimation:         0.9226298 
## Corrected R over S Hurst exponent:   1.011261 
## Empirical Hurst exponent:            0.9984143 
## Corrected empirical Hurst exponent:  0.9943425 
## Theoretical Hurst exponent:          0.5155387
```

```r
Hpink <- hurstexp(p@left, d = 128)
```

```
## Simple R/S Hurst estimation:         0.8138709 
## Corrected R over S Hurst exponent:   0.9094859 
## Empirical Hurst exponent:            0.9307558 
## Corrected empirical Hurst exponent:  0.9245416 
## Theoretical Hurst exponent:          0.5155387
```



