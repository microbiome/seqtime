% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/limitsQuality.R
\name{limitsQuality}
\alias{limitsQuality}
\title{Quality scores and plot for estimated interaction matrices}
\usage{
limitsQuality(oriTS, A, A.ori = matrix(), type = "ricker",
  autocorOnly = FALSE, all = FALSE, m.vector = c(), e.vector = c(),
  spec.subset = NA, norm = FALSE, plot = FALSE, predict.stepwise = TRUE,
  sim = "r", noSchur = FALSE, ignoreExplosion = FALSE, sigma = -1,
  explosion.bound = 10^8)
}
\arguments{
\item{oriTS}{the original time series, with taxa as rows and time points as columns}

\item{A}{the estimated interaction matrix}

\item{A.ori}{the original interaction matrix (optional)}

\item{type}{the model used to predict time series from the interaction matrix, ricker or soc (for soc, predict.stepwise is set to FALSE and noSchur to TRUE)}

\item{autocorOnly}{only compute step-wise autocorrelations (in this case, A is optional)}

\item{all}{compute auto- and cross-correlations for all species, adding one at each step, in the order of their mean abundance}

\item{m.vector}{the immigration rates for soc (optional, if not provided set to the proportions in the first sample)}

\item{e.vector}{the extinction rates for soc (optional, if not provided sampled from the uniform distribution)}

\item{spec.subset}{either a vector of species indices to keep or a number to indicate how many top-abundant (sum across samples) species should be kept, applied to the matrices and time series}

\item{norm}{normalize the original time series by dividing each sample by its sum (carried out before filtering species)}

\item{plot}{plot the number of species versus the mean correlation of predicted and observed time series and the mean auto-correlation}

\item{predict.stepwise}{if TRUE, the predicted time series is computed step by step, else computed with a call to Ricker}

\item{sim}{similarity measure to compare predicted and observed time series, either Pearson (r, default) or Kullback-Leibler dissimilarity (kld)}

\item{noSchur}{do not remove positive eigenvalues}

\item{ignoreExplosion}{ignore the occurrence of an explosion (for step-wise prediction only)}

\item{sigma}{noise factor in Ricker}

\item{explosion.bound}{the explosion boundary in Ricker}
}
\value{
a list with the taxon numbers considered (taxonnum), the mean correlation of observed and predicted time series (meancrosscor), the slope of the former (slope), the value range in the estimated matrix (AestR), the mean correlation between predicted and original matrix (corAAest) and the mean autocorrelations up to lag 5 (meanautocor1 to meanautocor5)
}
\description{
To avoid explosions, the estimated interaction matrix is modified such
that all its eigen values are negative using the Schur decomposition. The predicted time series is
obtained step-wise, by computing the current abundances from the
original abundances of the preceding time point and the given
estimated interaction matrix with (by default noise-free) Ricker. Carrying capacities are
estimated as mean abundances. If the original interaction matrix is provided,
the mean correlation between estimated and original interaction matrix is computed.
Thus, two main quality scores are considered: the mean correlation between predicted and
observed time series and, if provided, the mean correlation between the original and the
estimated interaction matrix.
}
\examples{
N=20
A=generateA(N,c=0.1)
ts=ricker(N=N,A=A)
ts=normalize(ts)
Aest=limits(ts,verbose=TRUE)
out=limitsQuality(ts,A=Aest,A.ori=A, plot=TRUE)
}
