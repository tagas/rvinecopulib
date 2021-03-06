% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/bicop.R
\name{bicop}
\alias{bicop}
\alias{bicop_dist}
\alias{bicop_dist}
\title{Bivariate copula models}
\usage{
bicop(data, family_set = "all", par_method = "mle",
  nonpar_method = "quadratic", mult = 1, selcrit = "bic", psi0 = 0.9,
  presel = TRUE, keep_data = TRUE, cores = 1)

bicop_dist(family = "indep", rotation = 0, parameters = numeric(0))
}
\arguments{
\item{data}{a matrix or data.frame (copula data should have approximately
uniform margins).}

\item{family_set}{a character vector of families; see \emph{Details} for
additional options.}

\item{par_method}{the estimation method for parametric models, either \code{"mle"}
for maximum likelihood or \code{"itau"} for inversion of Kendall's tau (only
available for one-parameter families and \code{"t"}.}

\item{nonpar_method}{the estimation method for nonparametric models, either
\code{"constant"} for the standard transformation estimator, or
\code{"linear"}/\code{"quadratic"} for the local-likelihood approximations of order
one/two.}

\item{mult}{multiplier for the smoothing parameters of nonparametric
families. Values larger than 1 make the estimate more smooth, values less
than 1 less smooth.}

\item{selcrit}{criterion for family selection, either \code{"loglik"}, \code{"aic"},
\code{"bic"}, \code{"mbic"}. For \code{vinecop()} there is the additional option \code{"mbicv"}.}

\item{psi0}{see \code{\link[=mBICV]{mBICV()}}.}

\item{presel}{whether the family set should be thinned out according to
symmetry characteristics of the data.}

\item{keep_data}{whether the data should be stored (necessary for computing
fit statistics and using \code{\link[=fitted]{fitted()}}).}

\item{cores}{number of cores to use; if more than 1, estimation for multiple
families is done in parallel.}

\item{family}{the copula family, a string containing the family name (see
\emph{Details} for all possible families).}

\item{rotation}{the rotation of the copula, one of \code{0}, \code{90}, \code{180}, \code{270}.}

\item{parameters}{a vector or matrix of copula parameters.}
}
\value{
Objects inheriting from \code{bicop_dist} for \code{bicop_dist()}, and
\code{bicop} and \code{bicop_dist} for \code{bicop()}.
}
\description{
Bivariate copula models
}
\details{
The implemented families are:\cr

\code{"indep"} = Independence copula.\cr
\code{"gaussian"} = Gaussian copula.\cr
\code{"t"} = Student t copula.\cr
\code{"clayton"} = Clayton copula.\cr
\code{"gumbel"} = Gumbel copula.\cr
\code{"frank"} = Frank copula.\cr
\code{"joe"} = Joe copula.\cr
\code{"bb1"} = BB1 copula.\cr
\code{"bb6"} = BB6 copula.\cr
\code{"bb7"} = BB7 copula.\cr
\code{"bb8"} = BB8 copula.\cr
\code{"tll"} = transformation kernel local likelihood, only for \code{bicop()}.\cr

In addition, the following convenience definitions can be used (and combined)
with \code{bicop}:\cr

\code{"all"} =  all families.\cr
\code{"parametric"} =  parametric families.\cr
\code{"nonparametric"} =  nonparametric families.\cr
\code{"archimedean"} =  archimedean families.\cr
\code{"elliptical"} =  elliptical families.\cr
\code{"bbs"} =  BB families.\cr
\code{"oneparametric"} =  one parameter families.\cr
\code{"twoparametric"} =  two parameter families.\cr
\code{"itau"} =  one parameter families and Student t copula.\cr
Partial matching is activated. For example, \code{"gauss"} is equivalent to
\code{"gaussian"}, or you can write  \code{"nonpar"} instead of \code{"nonparametric"}.
}
\examples{
## bicop_dist objects
bicop_dist("gaussian", 0, 0.5)
str(bicop_dist("gauss", 0, 0.5))
bicop <- bicop_dist("clayton", 90, 3)

## bicop objects
u <- rbicop(500, "gauss", 0, 0.5)
fit1 <- bicop(u, "par")
fit1

}
