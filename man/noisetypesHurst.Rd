% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/noisetypesHurst.R
\name{noisetypesHurst}
\alias{noisetypesHurst}
\title{Plot noise types versus their range of Hurst exponents}
\usage{
noisetypesHurst(x, noisetypes, header = "")
}
\arguments{
\item{x}{a matrix}

\item{noisetypes}{the noisetypes of the matrix}

\item{header}{header string
N=50
M=500
metapop=generateAbundances(N=M, mode=5, probabs=TRUE)
ts=simHubbell(N=N, M=M,I=1500,d=N, m.vector=metapop, tskip=50, tend=500)
noisetypes=identifyNoisetypes(ts)
noisetypesHurst(ts,noisetypes,header="Hurst exponent stratified by noise type")}
}
\description{
Given a matrix and the output of noise type classification, compute the
Hurst exponent of each matrix row and draw a box plot that plots for each
noise type the range of Hurst exponents. Hurst exponents are computed with
function HurstK in package FGN.
}
