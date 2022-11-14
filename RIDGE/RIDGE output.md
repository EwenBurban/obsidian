Tag: #Redaction 
# RIDGE outputs
.
├── modelComp
├── estimation_param_1
├── estimation_param_5
├── models_filters.txt
├── models_weight.txt
├── popfile.csv
├── ABCstat_global.txt
├── ABCstat_locus.txt
├── locus_datafile
├── locus_datafile_locussp
└── locus_posterior_mw.txt

## major output
RIDGE produce multiple output. The major results are in two files
1. $locus\_param\_estimation$ a directory containing one or multiple file indicating for each locus the probability to be a barrier locus
2. $roc\_table.txt$ : an estimation of the RIDGE performance on the observed dataset

I describe here the method to use this results. First look at roc_table file, this file 
describe for each threshold of $P_{barr}$ the false (FPR) and true positive rate (TPR). 
This data can be used to plot a ROC curve (already plot in roc.pdf), which allow the user
to evaluate the performance of RIDGE on the user dataset.
A Receiver operating characteristic curve (ROC curve), is a graphical plot that illustrate the discrimination
power of binary classifier (here the two class are barrier and non-barrier) as the threshold is varied.
ROC curve is interpreted
as follow : the greater the area under the curve is, the better the performance of the method are. 
A $AUC=0.5$ mean that the method classify randomly loci as barrier and non-barrier.
![](RIDGE/fig/Pasted%20image%2020220916125353.png)
Moreover, the $roc\_table.txt$ contain the number of loci with a $P_{barr}$ rate is
superior or equal to the threshold of $P_{barr}$. By calculating the  expected fraction of true barrier per threshlod as :
$\frac{TPR}{TPR + FPR}$ , the user can determine a pertinent  threshold above which loci are considered as gene
flow barrier. 
Once a pertinent threshold is choose, data in $locus\_param\_estimation$ can be used. This direction contain
the $P_{barr}$ value for each locus. The physical  position of each locus is formated as follow : 
"chromosome:start position - end position". 

## minor output
In this part i’ll explain output in the same order as they are generated. 
First, $ABCstat\_global.txt$ contain average summary statistics of the locus sample as described here : [Summary statistics use in ABC process](RIDGE/Summary%20statistics%20use%20in%20ABC%20process.md) . $ABCstat\_locus.txt$ contain summary statistics of each locus.  
### $locus\_datafile$ and $locus\_datafile\_locussp$
Thoose two files give generic information of each locus use in sample ( $\rho$ and $\theta$ values, which are determined from recombination map provided by the user and $\mu$ defined in $config.yaml$ file by the user). So $\theta = 4 * N_{ref}* \mu * L$ where $N_{ref}$ is the population size of reference define by user in $config.yaml$ and $L$ is the size of a locus (also defined by user), and $\rho=4 * N_{ref}* r * L$
where $r$ is the mean local recombination rate ($cM/Mb$) determined from the recombination map provided by user. Also for each locus is precised the number of samples for each population. 


### modelComp 
Is a directory containing the simulation using raw prior bound (defined in $config.yaml$ by the user) for each of the 14 models ( see [demographic models to work with ABC](RIDGE/demographic%20models%20to%20work%20with%20ABC.md)).

### $models\_filter.txt$
Is a table containing only one row and multiple collumn. Each column correspond to one of the 14 models and for each models is attributed a weights. In this particular file, weights doens’t matter, because they come from untrained data generated with very large priors. The only information that matter is the  list of models. This models explain 95% of the data and they will 
be used for the next parameter estimations. See [Models Weights and Posteriors estimation](RIDGE/Models%20Weights%20and%20Posteriors%20estimation.md) for more information on how weight are determined and models filtered.

### estimation_parameter_{number of the round}
Is a directory, {num of the round} is the number of the estimaiton round, going from two to five depending on the value of $light\_mode$ parameter (if $True$ the number of round will stop to 2, else if $False$ the number of estimation will stop to 5. In every directory (exept estimation_parameter_1) there is : 
- simulations based on previous estimation round posterior (4000 if $light\_mode=True$, else 8000 datasets) for each filtered models
- posterior estimaiton for each filtered models

### $models\_weight.txt$
Same as $models\_filter.txt$ but here the weight are considered in the rest of the pipeline. It give to the user a good overview on which is the best model to explain his dataset and the level of heterogeneity in his dataset.

### $locus\_posteriors\_mw.txt$
Is a file containing 1000 set of posteriors from different models that where merge following the method explain here : [Posteriors averaging](RIDGE/Posteriors%20averaging.md)
The user can use this data to know the demography infered by RIDGE.

### locus_sim_param
This folder contain two directory. In thoose directory, the prior and the result of simulation at locus scale are stored. 


## output position 
- barrier probability : locus_param_estimation/IM_2M_2N
