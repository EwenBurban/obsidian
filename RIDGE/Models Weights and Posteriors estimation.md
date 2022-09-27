%TODO
#Redaction 
## Estimate models weights
To estimate the contribution of each models to explain observed data, RIDGE use randomforest alghorithm from acbrf package. 
Random forest is built on simulated dataset (named train dataset). Each dataset 
is labeled with the model type that were used to generate the dataset. Random forest are 
made of N random decisions trees, each tree vote for a model type. In the end, the alghorithm give the number of tree that vote for each type of model. 
RIDGE consider proportion of tree’s votes for each model as the models weigths. Because 
each model is separatly estimated, and model posteriors estimation is time consuming,
not all model are kept. Indeed, only the models that contribute to the first 95% of the information are kept the rest is removed
### Exemple
In this simple exemple, only 4 models are aviable. Each of them received a number of votes.
Only the models contributing to 95% of the cumulatives votes are kept (so SI_2N is removed from considered models). The final weigth is calculated on sum of votes of remaining models

| models | IM_2M_2N | SC_2M_2N | AM_1M_1N| SI_2N|
|---|----|----|----|---|
| votes % |65 | 20 | 10 |    5|
| cum sum % | 65 | 85 | 95 | 100 |
|final weigth % | 68.4 | 21 | 10.5 | NA |
## Posterior Estimation
posterior of observed dataset are estimated from simulated dataset using random forest for regression (function regAbcrf from abcrf package). Simulated dataset are resumed using summary statistics for ABC, and associated to their prior. The oserved datased is resume with the same ABC statistics (see [Summary statistics use in ABC process](RIDGE/Summary%20statistics%20use%20in%20ABC%20process.md)). For each parameter in the model used for simulation (see [demographic models to work with ABC](RIDGE/demographic%20models%20to%20work%20with%20ABC.md)), the prior of observed data is estimated using regression from random forest package (abcrf). The random forest a prediction for each tree that compose the random forest. The mean of all tree’s estimation is the random forest’s expetation. 
In RIDGE, due to model averaging, multiple posteriors are generated (NPosteriors = 1000) for the same parameter and the same observe dataset. In order to generate more than one expectation (posterior), RIDGE assume that the posteriors follow a uniform distribution centered on the expectation (from random forest) and with a standar error equal to the $sd=\sqrt{error.variance}$ . This uniform distribution is bounded to the priors bounds, to avoid outliers values. 

