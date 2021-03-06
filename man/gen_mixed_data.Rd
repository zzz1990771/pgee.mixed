% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/simulate_data.R
\name{gen_mixed_data}
\alias{gen_mixed_data}
\title{Generate correlated bivariate mixed outcome data}
\usage{
gen_mixed_data(Beta.cont, Beta.bin, N, rho, intercept = TRUE, cov = "same",
  xcor = 0.25, sigma_yc = 1)
}
\arguments{
\item{Beta.cont}{Vector of true regression coefficients for the continuous
outcome.}

\item{Beta.bin}{Vector of true regression coefficients for the binary
outcome.}

\item{N}{Number of pairs of correlated outcomes.}

\item{rho}{Gaussian copula parameter.}

\item{intercept}{Assume an intercept (for both outcomes)? (default TRUE). If
TRUE, then the first coefficient in Beta.cont and Beta.bin are assumed to
correspond to intercepts.}

\item{cov}{Specify if the covariate matrices for the continuous outcome and
the binary outcome should share all covariates (set to "same"), share some
covariates (set to "shared"), or share no covariates (set to "separate").}

\item{xcor}{Correlation parameter for AR(1) correlation structure of
covariate design matrices (assumed same for both).}

\item{sigma_yc}{Marginal variance of continuous responses.}
}
\value{
A list of generated data
\item{yc}{Vector of continuous outcomes.}
\item{yb}{Vector of binary outcomes.}
\item{X}{Covariate matrix for the continuous outcomes.}
\item{Z}{Covariate matrix for the binary outcomes.}
}
\description{
\code{gen_mixed_data} returns randomly generated correlated bivariate mixed
outcomes, and covariate matrices to model them, based on design parameters
set in the function.
}
\details{
A Gaussian copula is used to generate the correlated outcomes. Marginally,
the continuous outcome follows a normal distribution with identity link to
covariates, while the binary outcome follows a Bernoulli distribution with
logit link to covariates. Covariates are generated from a zero-mean unit
variance multivariate normal distribution, with an AR(1) correlation
structure.
}
\examples{
# default settings
gen_mixed_data(rnorm(5), rnorm(5), 10, 0.5)
# separate covariate matrices, non-unit continuous variance
gen_mixed_data(rnorm(5), rnorm(5), 10, 0.5, cov = "separate", sigma_yc = 2)
}

