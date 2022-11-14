## Data
Simulated data under SI,AM,IM,SC models using the following parameter values
- every model with migration and Ne heterogeneity
- Na=N1=N2=50000
- Beta parameter : a=b=5
- Pbarrier = 0
- Tested values : 
| param | values |
| ---|---|
|Tsplit | 1e3 ; 1e4|
| Mbasal| 1 ; 10  |
 - For AM and SC models : 
	 - Tam =0.7 * Tsplit
	 - Tsc=0.2 * Tsplit (changed 0.3 for 0.2 because 0.3 is the limit to consider a secondary contact)

![[abcrf_model_votes.pdf]]
![[abcrf_sd_votes.pdf]]
![[estimation_param_draft_plot 1.pdf]]
![[mw_vs_best_plot.pdf]]
![[migration_mw_vs_best_plot.pdf]]
## first results
- model votes : Retain only the 2N model without choosing one model 
- averageging seems to procduce acceptable results for Tsplit and Na parameter, less for N1 and N2 and really not good for migration parameter
- model averaging produce globaly similar result than the theorical best model (= the model used to simulate the dataset), but for migration, model averaging is obsiously better
- 