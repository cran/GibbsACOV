\name{GibbsACOV-package}
\alias{GibbsACOV-package}
\alias{GibbsACOV}
\docType{package}
\title{
Gibbs Sampler for One-Way Mixed-Effects ANOVA and ANCOVA Models
}
\description{
Gibbs sampler for one-way linear mixed-effects models (ANOVA, ANCOVA) with homoscedasticity of errors and uniform priors.
}
\details{
\tabular{ll}{
Package: \tab GibbsACOV\cr
Type: \tab Package\cr
Version: \tab 1.0\cr
Date: \tab 2013-05-02\cr
License: \tab GPL (>= 2)\cr
}
~~ An overview of how to use the package, including the most important functions ~~
}
\author{
Emily Goren and Quan Zhang

Maintainer: Emily Goren <emily.goren@gmail.com>
}
\keyword{ GibbsACOV }
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