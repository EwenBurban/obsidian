Tags : #Test 
# Introduction
RIDGE use the scikit-allel to compute summary statistics. In contrary, DiLS use custom function from C.Roux. 
In this note, I show ==to finish==

# Test design
 1. Simulate a simple and predictible dataset and produce summary statistics
 2. Compare between theorical expectation and the results
 3. Compare DiLS results to RIDGE results
## 1. Simulate dataset 
I simulated the dataset using the simplest model (SI_1N, see [[demographic models to work with ABC]]) and the following parameter : 
|param|value|coalescent value|
|-----|-----|----|
|Tsplit| 10000 |0.0294|
|Na| 85000|1|
|N1| 85000|1|
|N2| 85000|1|
| $\mu$| 3e-8 | |
| $\frac{\rho}{\theta}$ | 5 ||
|locus length | 1000 bp|
## 2. Simulation results vs Theorical expectation
- $\theta_{exp} = 4 * Ne* \mu$   so $E(\theta) = 4 * 85000* 3e-8 = 0.0102$ 
- $E(Fst)  = 1 - e^{-t / 2*Ne}$  so $E(Fst) = 0.057$
- Tajima’s D = 0 because there is no change in population size and all loci are neutral
- 
### Dataset results
The dataset value are average value over 1000 loci and each locus contain in 
average ~ 500 snp, so the mean is over 5e5 SNP. 
| param | average dataset value | theorical expectation |
| -----------|------------------------|------------------------------------|
| pi pop A |        0.01018                | 0.0102|
| pi pop B |        0.0102                        | 0.0102
| $\theta_W$ pop A |        0.01013                | 0.0102|
| $\theta_W$ pop B |        0.01035                        | 0.0102
| Fst |      0.056                | 0.057 |
| Taj D pop A | - 0.00188               | 0 |
| Taj D pop B |          -4e-4      | 0|


In conclusion, for pi, Fst, $\theta_W$ and Tajima’s D  the simulated dataset is very close from the expected values.

## 3. DiLS estimation vs RIDGE estimation
### Data
1 loci of 4 samples and 8 SNP
Theorical calculus done by hand
### Method
run DiLS and RIDGE script to calculate the values
### Evaluation
Compare the difference of result between all three method for : $\pi$, $\theta$ ,TajD, Fst, Dxy, Da, jsfs summary stats (ss,sf,sxa,sxb)
