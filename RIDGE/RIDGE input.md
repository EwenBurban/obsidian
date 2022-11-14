## list of input files
.
├── popfile.csv
├── rawdata/
│   ├── chr1.vcf
│   ├── .
│   ├── .
│   └── chrX.vcf
├── recombination_map.txt
└── config.yaml

### $popfile.csv$
A two column file containing the list of samples attributed to each population. 
the header of the file is the value of the parameters $nameA$ and $nameB$. The file must follow the file format ".csv". Below an exemple of a popfile.csv for 4 individuals :
| nameA | nameB |
|---|---|
| A1 | B1|
| A2 | B2|

### rawdata
Is a folder containing raw vcf.  To optimize calculation time, rawdata might be splitted in subfiles containing for each files, data of one single chromosomes. 

### $recombination\_map.txt$
A file containing the recombination rate for genomic windows. The format is the following : 
|chr|start|end|rec.rate|
|----|----|---|----|
|number of the chromosome| start position in bp | end position in bp | recombination rate |
The recombination rate is in morgan per base. 

### $config.yaml$
A config file filled by the user. The parameter are the following : 
- $\mu$ :  mutation rate per base
- $window\_size$ : size of loci (in bp)
- $ligth\_mode$ : activate ligth mode, which is faster and less accurate than default mode (TRUE or FALSE)
- $timeStamp$ : path to data
- $nameA,nameB$ :  name of populations used in popfile.csv ( A is the first population in popfile)
- $Tsplit\_min,Tsplit\_max$ : bounds of Tsplit values (in generation)
- $N\_min,N\_max$ : bounds of effective size 
- $M\_min,M\_max$ : bounds of migration rate (N.m)
