Tag : #Method
# set up your variables
```{sh}
vcf=<your vcf file>
n_snp=<number of snp wanted>
```
# get your data ready (not mandatory)
```
bgzip -c ${vcf} > ${vcf}.gz
bcftools index ${vcf}.gz
```
# sample random locus
```{sh}
cut -f 1,2 ${vcf} > tmp_list.txt
sed -i {/#/d} tmp_list.txt
shuf -n ${n_snp} tmp_list.txt > bed_snp_list.txt
```
# output the random locus
```
bcftools -R bed_snp_list.txt -o randsub_${vcf} ${vcf}.gz
```
