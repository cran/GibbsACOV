\name{acovamcmc}
\alias{acovamcmc}
\title{Gibbs sampler for one-way mixed-effects ANOVA and ANCOVA models.}
\usage{
  acovamcmc(Y, trt, X, nochn, numIter, initval, credint = 0.95, Rthresh = 1.1)
}
\arguments{
  \item{Y}{Vector of reponses of n subjects}

  \item{trt}{Vector of categorical factor levels for n subjects}

  \item{X}{Design matrix with dimension (n x p) where p is the number of continuous predictors (for ANOVA, p = 1 to include grand mean)}

  \item{nochn}{Number of chains to test convergence of the Gibbs sampler}

  \item{numIter}{Number of iterations in the Gibbs sampler}

  \item{initval}{Matrix of initial values for Gibbs sampler with dimension (nochn, (p + nlevels(trt) + 2))}

  \item{credint}{Coverage probability for parameter credible intervals}

  \item{Rthresh}{Gelman-Rubin diagnostic for test of convergence}
}
\value{
  S3 \code{acovamcmc} object; a list consisting of
  \item{beta}{values of regression coefficients for each
  iteration} \item{sig2a}{values of mixed-effect variance
  for each iteration} \item{sig2e}{values of error variance
  for each iteration} \item{Credible_Interval}{lower bound,
  point estimate, and upper bound for parameters}
  \item{Credible_Interval_Coverage}{coverage percentage for
  credible intervals} \item{Convergence_Diag}{status of
  Gibbs sampler convergence using threshold set for Gelman
  and Rubin's diagnostic}
  \item{Gelman_Rubin_Threshold}{threshold set for Gelman
  and Rubin's diagnostic} \item{Iterations}{number of
  iterations of Gibbs sampler} \item{Run_Time}{total
  elapsed seconds}
}
\description{
  Gibbs sampler for one-way mixed-effects ANOVA and ANCOVA models using flat priors.
}
\examples{
\dontrun{
# ANCOVA with 2 continuous predictors and 5 factor levels
  data(corn)
  init1 <- c(rep(0,7), 1, 1)
  init2 <- c(rnorm(7), rgamma(2,2,1))
  init3 <- c(rnorm(7), rgamma(2,2,1))
  init4 <- c(rnorm(7), rgamma(2,2,1))
  initval <- rbind(init1, init2, init3, init4)
  acovamcmc(corn$yield, corn$variety, cbind((corn$nitrogen)^2, corn$nitrogen), 4, 10000 , initval)
# ANOVA with grand mean parameterization and 12 factor levels
  data(csection)
  init1 <- c(rep(0,13), 1, 1)
  init2 <- c(rnorm(13), rgamma(2,2,1))
  init3 <- c(rnorm(13), rgamma(2,2,1))
  init4 <- c(rnorm(13), rgamma(2,2,1))
  initval <- rbind(init1, init2, init3, init4)
  Y = log(csection$rate / (1-csection$rate))
  acovamcmc(Y, factor(csection$hospital), matrix(1,length(csection$hospital),1), 4, 10000, initval)
}
}
\references{
  Gelman, A and Rubin, DB (1992) Inference from iterative simulation using multiple sequences, Statistical Science, 7, 457-511.
}

