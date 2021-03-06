% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/arog_function.R
\name{arog}
\alias{arog}
\title{ARoG function}
\usage{
arog(y, x, lbd.min = 0.1, lbd.mult = 4, ln = 4, k, ssd.ini = 0.5,
  term = 10^{     -6 }, maxiter = 1000)
}
\arguments{
\item{y}{GWAS association measure vector}

\item{x}{annotation matrix (no of SNPs * no of annotations)}

\item{lbd.min}{smallest tuning parameter}

\item{lbd.mult}{multiplication factor for largest tuning parameter Defaults to 1.}

\item{ln}{numbers of tuning parameters searched Defaults to 10.}

\item{k}{number of clusters}

\item{ssd.ini}{initial values for residual standard deviations}

\item{term}{termination criterion Defaults to 10^{-6}}

\item{maxiter}{maximal number of EM-iterations Defaults to 1000.}
}
\value{
a list object containing the following components:
\tabular{ll}{
opt.ind.lbd.bic \tab the optimal tuning parameter index, value and corresponding BIC \cr
fmrlasso \tab a list of ARoG (I) results \cr
fmrlasso$k \tab no of components \cr
fmrlasso$prob \tab component probabilities \cr
fmrlasso$coef \tab ARoG (I) regression coefficient matrix \cr
fmrlasso$ssd \tab ARoG(I) component sample standard deviations \cr
fmrlasso$plik \tab value of penalized negative log-likelihood \cr
fmrlasso$bic \tab bic value \cr
fmrlasso$ex \tab posterior probabilities of SNPs to components (no of SNPs * no of components) \cr
fmrlasso$cluster \tab component assignments of SNPs \cr
fmrlasso$niter \tab no of EM algorithm iteratioins \cr
fmrlasso$warnings \tab check if there is any warning or not \cr
fmrlassopath \tab a list of object containing ARoG (I) results on a of tuning parameters. Subobjects for each tuning parameter value are created and they are the same as those of fmrlasso. \cr
fmrlasso.rlasso \tab a list of ARoG (II) results \cr
fmrlasso.rlasso$coef \tab ARoG (I) regression coefficient matrix \cr
fmrlasso.rlasso$ssd \tab ARoG(I) component sample standard deviations \cr
}
}
\description{
This function allows you to fit ARoG (I) and ARoG (II)
}
\examples{
\dontrun{
n <- 100
p <- 50
x <- matrix(rnorm(n*p),n,p)
beta <- cbind(c(0,rep(3,5),rep(0,p-5)),c(0,rep(-1,5),rep(0,p-5)))
prob <- c(0.5,0.5)
ssd <- c(0.5,0.5)
y <- sim(x=x,ssd=ssd,beta=beta,prob=prob)
arogResults<-arog(y, x, lbd.min=1, lbd.mult=4, ln=10, k=2)
}
}
\author{
Sunyoung Shin\email{shin@stat.wisc.edu}
}
\keyword{arog}

