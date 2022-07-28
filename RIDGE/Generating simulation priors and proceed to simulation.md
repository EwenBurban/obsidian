Tags : #Redaction
To generate the first priors, the user defines upper and lower bounds for the population size prior ($N_{min}$ & $N_{max}$) in the config), for the Tsplit prior ($Tsplit_{min}$ & $Tsplit_{max}$) and for the migration rate prior ($M_{min}$ & $M_{max}$). 

**First**, an N of reference ($N_{ref}$) is calculated as follows :
						$N_{ref}= N_{max}/2$ 
and the bounds are rescaled as follows to be in coalescent unit: 
						$N = N / N_{ref}$

						$T = T / (4 * N_{ref})$
						
$M_{min}$ and $M_{max}$ are given in $N*m$ unity, so there is no need to rescale it. 
**In seconds**, priors are uniformly sample between the bounds (see **Fig1 **) .

![[prior_distrib.pdf]]

**Fig 1**: *Example of prior distribution for Tsplit and Na, blue and red line represent priors bounds (respectively min and max).*

Priors are generated at two levels : global level and locus level. At global level, the demography is randomly chose by uniform draft in priors and at the locus, heterogeneity of migration rate and Ne is applied (see Fig Y) .

Heterogeneity at locus scale is generated through a beta law for N distribution.

At global scale random values of beta parameter (a,b) are drowned from an uniform distribution bounded between \[0.1 ; 15\].  From those global parameters, a random value is generated from the random beta law and rescale by the mean of the random beta law :

$N_i= N * \frac{\beta(a,b)}{a/(a+b)}$

With $N$ a value of population size at global scale, and $N_i$ the value of population size for locus number $i$. For migration, the process is more complex. As $N$ heterogeneity, migration heterogeneity is generated with a beta law, with the addition of barriers. 
  

$M_i = M * \frac{\beta(a,b)}{a/(a+b)} *B(1,1-p)$

With $M$ the global migration rate,  $M_i$ the migration rate at the locus $i$, $a$ and $b$ the parameter of the beta law (defined at global scale) and $p$ the proportion of barrier in the dataset. A barrier is a locus for which the migration rate is equal to 0. By this process the distribution of the migration rate in a heterogeneous dataset for M look like a bimodal distribution with one mode at M = 0 and one mode at $M = M * \frac{a}{a+b}$

![[migration_heterogeneity.jpg]]
**Fig 2** : *Distribution of migration values across 1000 loci in a model of migration heterogeneity with $M$ = 10, $a = b = 15$ ,$p=0.10$.*

Once the demography is defined for each locus, simulations are run and the result of simulation is produced. Simulations are run by a coalescent simulator named **scrm** (P.R Staab et all. 2015), which is an optimized version of ms (RR Hudson. 2002) who allow low computation time under high recombination rate.

![[priorgen.jpg]]

**Fig 3**: *Sheme of how priors are generated for scenario of Isolation-Migration with heterogeneity of Ne and migration at locus level. First global demography is randomly drafted following an uniform distribution. Second, if the model have heterogeneity at locus scale, beta law is applied on locus specific demography using previously drafted beta shape. Beta shape is different for M and N parameters, but it’s the same for Na, N1 and N2*