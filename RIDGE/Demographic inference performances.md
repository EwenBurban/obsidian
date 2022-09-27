re
Tag : #Test 
# Intro

# Method
For each model, 1000 random dataset ( under the model) have been predicted using 3000 random dataset (also simulated with the same model) to train train the random forest.
The expected result (expectation) and predicted error (Root squard Normalised Absolute mean error rate), were recorded for each dataset.
14 models have been evaluated ( see [demographic models to work with ABC](RIDGE/demographic%20models%20to%20work%20with%20ABC.md)) and the accuracy of RIDGE is evaluated for each 16 parameters. 
Prediction were obtain with random forest alghorithm (regAbcrf function from abcrf package)
Prior bound used : 

| param | lower bound | upper bound | 
|--------|--------------|--------------| 
| Tsplit | 0.00294 | 0.058|
| Na, N1, N2 | 0.1 | 2 | 
| shape_N_a , shape_N_b | 0.1 | 5 | 
Global param used : 

| param | values |
|---|---|
| $\theta$ | {20,50,100,150}|
| $\frac{\rho}{\theta}$| {5,50,100}

# Results

![](RIDGE/fig/DI_perf_test1.pdf)
For the vast majority of parameters, the infered value is really close from the true value, even if the error rate can be hight (i.e Tsplit parameter or M_current parameter)


T=

%TODO
- refaire DI sur 1 jeux de donnés simulé avec nsite_min = 1
- 
# Discussion
