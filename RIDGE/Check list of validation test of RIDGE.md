## input part
- [x] command line for filtering SNP
- [x] ShapeIT use of non-GT data
- [50%] ShapeIT performances on samples of size N_ind=40  [ShapeIT performances](RIDGE/ShapeIT%20performances.md)
	- [x] test on raw human dataset
	- [ ] direct test on a sample of 40 individuals
	- [ ] Optimisation of the parameter 
		- [ ] Ne
		- [ ] recombination map
- [50%] Valid the ABC summary statistics [Validate the new summary statistics method](RIDGE/Validate%20the%20new%20summary%20statistics%20method.md)
## Core part
- [ ] place of SFS in model inference
- [ ] place of lda option in abcrf function
- [ ] model weigh strategies with tree votes [model weigh strategies with tree votes (random forest)](RIDGE/model%20weigh%20strategies%20with%20tree%20votes%20(random%20forest).md)
	- [x] average error for model votes 
	- [ ] rerun previous test with the new methods and new models
- [x] correct simulation behavior
- [ ] posterior correct estimation (gamma distribution strategie) [Test performance estimation posterior](RIDGE/Test%20performance%20estimation%20posterior.md)
- [ ] Vote stategie to detect barrier
- [ ] pertinence of the number of simulation to infer models + models parameters [Number of dataset per model](RIDGE/Number%20of%20dataset%20per%20model.md)
- [ ] pertinence of the number of loci in a simulated multilocus dataset
- [x] [Effect  of the number of round on BI](RIDGE/Effect%20%20of%20the%20number%20of%20round%20on%20BI.md)
## Gwscan part
- [ ] 