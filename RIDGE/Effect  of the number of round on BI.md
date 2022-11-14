
#### Data : 
simulated dataset (IM_2M_2N)
#### Method : 
use close prior ==see below==
run RIDGE using 1; 2; 3; 4; 5 rounds of estimation
	» first use 1 round and estimate BI
	» use a second round and estimate BI
If first round is enough stop,
Else add a round.
#### Evaluation : 
True roc curve
#### status : 
- modelcomp : running
- round 2 , 3 et 4 done
- DONE
#### results
| round | AUC |
|---|---|
|2| 0.722 |
|3|0.74|
|4|0.774|
There is no real interest to use 5 round of prior optimisation
estimated roc curve overestimated the true performances.
