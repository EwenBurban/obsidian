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



## output position 
- barrier probability : locus_param_estimation/IM_2M_2N
