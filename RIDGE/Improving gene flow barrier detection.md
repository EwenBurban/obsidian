Tag : #Idea #Method 
Date: 12-08-2022

# Actual state
RIDGE consider two class of loci : 
 - barrier locus = $N.m =0$
 - non barrier locus = $N.m > 0$
 In facts, early barrier loci experienced reduced $m_e$ rate but not $m_e = 0$
 Moreover, non barrier class is to wide and include cases where $N.m$ is very close from barrier loci migratiion rate (i.e $N.m = 0.01$), create increased errors rate in class prediction by random forest
![](RIDGE/fig/roc_ppd-1.png)
![](RIDGE/fig/post_prob.pdf)
## Solution for the problem
1. add soft-barrier class see [soft barrier project](RIDGE/soft%20barrier%20project.md) 
2. adaptable thresholds
3. switch into regression 
# Soft barrier and thresholds

 