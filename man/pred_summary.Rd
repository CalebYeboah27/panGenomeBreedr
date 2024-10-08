% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/kasp_functions.R
\name{pred_summary}
\alias{pred_summary}
\title{Generate summary of predicition for positive controls in KASP genotype data,
if present}
\usage{
pred_summary(
  x,
  snp_id = "SNPID",
  Group_id = NULL,
  blank = "NTC",
  Group_unknown = "?",
  geno_call = "Call"
)
}
\arguments{
\item{x}{A list object of KASP genotype calls processed by the `kasp_color()`
function.}

\item{snp_id}{A character value indicating the column name for SNP IDs
in \code{x}.}

\item{Group_id}{A character value for the column ID indicating the predictions
of the positive controls in \code{x}.}

\item{blank}{A character value indicating `No Template Controls (NTC)`
genotype calls.}

\item{Group_unknown}{A character value representing unverified expected genotype status
for samples, if present. No genotype prediction can be made for such samples.}

\item{geno_call}{A character value indicating the column name for KASP genotype
calls in \code{x}.}
}
\value{
A list object with plates and prediction summary as components.
}
\description{
Generate summary of predicition for positive controls in KASP genotype data,
if present
}
\examples{
\donttest{
# example code
library(panGenomeBreedr)
dat1 <- panGenomeBreedr::beta_carotene
dat1 <- kasp_color(x = beta_carotene,
                   subset = 'plates',
                   sep = ':',
                   geno_call = 'Call',
                   uncallable = 'Uncallable',
                   unused = '?',
                   blank = 'NTC')

dat1 <- pred_summary(x = dat1,
                    snp_id = 'SNPID',
                    geno_call = 'Call',
                    Group_id = 'Group',
                    blank = 'NTC',
                    Group_unknown = '?')
dat1$summ
}

}
