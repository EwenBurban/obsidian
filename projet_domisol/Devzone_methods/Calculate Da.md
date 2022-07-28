Tag: #Method 
## setup
```
mkdir Da_synonymous
cd Da_synonymous
```
## install vep
local
```
sudo singularity build vep.sif docker://ensemblorg/ensembl-vep:latest
```
on server
```
singularity build --remote vep.sif docker://ensemblorg/ensembl-vep:latest
```
## set up cache for your system (if possible)
go to : http://ftp.ebi.ac.uk/ensemblgenomes/pub/plants/current/variation/vep/
and find your species
`species_file={name of your species file in the link}`
```
mkdir vep_cache
cd vep_cache
curl -O http://ftp.ebi.ac.uk/ensemblgenomes/pub/plants/current/variation/vep/${species_file}
tar xvf ${species_file}
```

## setup2
```
vcf={path to your vcf file}
species={species name}
version={number of your cache version}
container={path to the container python.sif in RIDGE/container/}
binpath={path were vcf2abc is store : RIDGE/faker_module/}

popfile={path to popfile}
contig_data={path to contig data}
nameA={name of popA}
naneB={name of popB}
window_size=100000
```
__NB__ : the version of your cache is written on the file name that you got here : 
http://ftp.ebi.ac.uk/ensemblgenomes/pub/plants/current/variation/vep/
### setup
```
vcf={path to your vcf file}
species={species name}
version={number of your cache version}
```

## get synonymous position

### run vep
```
singularity exec vep.sif vep -i ${vcf} -o ${species}_vep.txt --cache --dir_cache vep_cache/ --cache_version ${version} --offline --species ${species}
```
### get the synonymous position and calculate Da
```{sh}
grep 'synonymous' ${species}_vep.txt > ${species}_synonymous_vep.txt
cut -f2 ${species}_synonymous_vep.txt > ${species}_synonymous_positions.txt
sed -i 's/:/\t/g' ${species}_synonymous_positions.txt
bgzip -c ${vcf} > ${vcf}.gz
bcftools index ${vcf}.gz
bcftools view -R ${species}_synonymous_positions.txt -o ${species}_synonymous.vcf ${vcf}.gz
singularity exec ${container} python3 ${binpath}/vcf2abc.py data=${species}_synonymous.vcf contig_file=${contig_data} popfile=${popfile} nameA=${nameA} nameB=${nameB} output_dir=. window_size=${window_size}

```
Da is contained in ABCstat_global.txt in the column netdivAB_avg

