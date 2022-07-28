#!/usr/bin/env Rscript
args = commandArgs(trailingOnly=T)
args = sapply(args,function(x){tmp = unlist(strsplit(x,split='='))
            y = vector()
            y[tmp[1]] = tmp[2]
            return(y)},USE.NAMES=F)
post_dir = args['post_dir']
prior_dir = args['prior_dir']
output_dir = args['output_dir']
library(ggpubr)
ld = list.dirs(post_dir,recursive=F)
# SI_1N
model = 'SI_1N'
pattern = 'SI_1N_'
ref_value = c('Tsplit' = 10000 ,'Na' = 85000, 'N1' = 85000 , 'N2' = 85000)
lf_posterior = file.path(grep(ld,pattern=pattern,value=T),'posterior_SI_1N_NULL.txt')
lf_data = do.call(rbind,lapply(lf_posterior,read.table,h=T))
lf_data$tag = 'post_nnet'

rf_posterior = file.path(grep(ld,pattern=pattern,value=T),'posterior_RandomForest_SI_1N.txt')
rf_data = do.call(rbind,lapply(rf_posterior,read.table,h=T))
rf_data$tag = 'post_abcrf'
lf_data = rbind(lf_data,rf_data)
prior_ld = list.dirs(prior_dir,recursive=F)
prior_lf = file.path(grep(prior_ld,pattern=model,value=T),'priorfile.txt')
prior_data = do.call(rbind,lapply(prior_lf,read.table,h=T))
prior_data$tag = 'prior'
print(head(prior_data))
print('prior done')

param_vec = c('Tsplit','Na','N1','N2')
all_data = rbind(prior_data[,-1],lf_data)
all_data$Tsplit = all_data$Tsplit * 4* 85000
all_data$Na = all_data$Na * 85000
all_data$N1 = all_data$N1 * 85000
all_data$N2 = all_data$N2 * 85000
plotlist = lapply(param_vec,function(x,...){
					 y= ggdensity(all_data,x,add='mean',color='tag',fill='tag') + geom_vline(xintercept=ref_value[x],color='black')
					 return(y)
			})
ggarrange(plotlist=plotlist,nrow=2,ncol=2) %>% ggexport(filename=file.path(output_dir,'SI_1N_posterior_estimation.jpg'),width=1400,height=1400,units='px')

### SI_2N 

model = 'SI_2N'
pattern = 'SI_2N_'


lf_posterior = file.path(grep(ld,pattern=pattern,value=T),'posterior_SI_2N_NULL.txt')
lf_data = do.call(rbind,lapply(lf_posterior,read.table,h=T))
lf_data$tag = 'post_nnet'

rf_posterior = file.path(grep(ld,pattern=pattern,value=T),'posterior_RandomForest_SI_2N.txt')
rf_data = do.call(rbind,lapply(rf_posterior,read.table,h=T))
rf_data$tag = 'post_abcrf'
lf_data = rbind(lf_data,rf_data)
prior_ld = list.dirs(prior_dir,recursive=F)
prior_lf = file.path(grep(prior_ld,pattern=model,value=T),'priorfile.txt')
prior_data = do.call(rbind,lapply(prior_lf,read.table,h=T))
prior_data$tag = 'prior'
print(head(prior_data))
print('prior done')

param_vec = c('Tsplit','Na','N1','N2')
all_data = rbind(prior_data[,-1],lf_data)
all_data$Tsplit = all_data$Tsplit * 4* 85000
all_data$Na = all_data$Na * 85000
all_data$N1 = all_data$N1 * 85000
all_data$N2 = all_data$N2 * 85000
plotlist = lapply(param_vec,function(x,...){
					 y= ggdensity(all_data,x,add='mean',color='tag',fill='tag') + geom_vline(xintercept=ref_value[x],color='black')
					 return(y)
			})
ggarrange(plotlist=plotlist,nrow=2,ncol=2) %>% ggexport(filename=file.path(output_dir,'SI_2N_posterior_estimation.jpg'),width=1400,height=1400,units='px')
