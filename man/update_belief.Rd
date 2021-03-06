% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/update_belief.R
\name{update_belief}
\alias{update_belief}
\title{Belief Update}
\usage{
update_belief(
  model,
  belief = NULL,
  action = NULL,
  observation = NULL,
  episode = 1,
  digits = 7,
  drop = TRUE
)
}
\arguments{
\item{model}{a POMDP model.}

\item{belief}{the current belief state.
Defaults to the start belief state specified in
the model or "uniform".}

\item{action}{the taken action.}

\item{observation}{the received observation.}

\item{episode}{Use transition and observation matrices for the given episode
for time-dependent POMDPs (see \code{\link{POMDP}}).}

\item{digits}{round decimals.}

\item{drop}{logical; drop the result to a vector if only a single belief
state is returned.}
}
\description{
Update the belief given a taken action and observation.
}
\details{
Update the belief state \eqn{b} (\code{belief}) with an action \eqn{a} and observation \eqn{o}. The new
belief state \eqn{b'} is:

\deqn{b'(s') = \eta O(o | s',a) \sum_{s \in S} T(s' | s,a) b(s)}

where \eqn{\eta = 1/ \sum_{s' \in S}[ O(o | s',a) \sum_{s \in S} T(s' | s,a) b(s)]} normalizes the new belief state so the probabilities add up to one.
}
\examples{

data(Tiger)

update_belief(c(.5,.5), model = Tiger)
update_belief(c(.5,.5), action = "listen", observation = "tiger-left", model = Tiger)
update_belief(c(.15,.85), action = "listen", observation = "tiger-right", model = Tiger)

}
\seealso{
\code{\link[=POMDP]{POMDP()}}, \code{\link[=simulate_POMDP]{simulate_POMDP()}}
}
\author{
Michael Hahsler
}
