% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/tsubsample.R
\name{tsubsample}
\alias{tsubsample}
\title{Subsample Time Series}
\usage{
tsubsample(x, target = NA, interval = NA)
}
\arguments{
\item{x}{a matrix}

\item{target}{target}

\item{interval}{interval}
}
\description{
Subsample a time series.
}
\details{
Subsample the given time series down to a target time point number using equal intervals or select the time points with the given interval. Assumes that time points are columns and time points are equidistant.
}
