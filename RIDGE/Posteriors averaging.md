Tag : #TODO #Redaction 

To generate an average demographic model, RIDGE sample posteriors demographic scenarios in different models posteriors and merge them together in a file containing Nposterior demographic scenario.
Because, the number of parameters is not the same between the 14 demographics model use in ABC simulation (see [demographic models to work with ABC](RIDGE/demographic%20models%20to%20work%20with%20ABC.md)), merging multiple posteriors set from different models in a demographicly correct way (i.e not filly missing parameter with NA values) need a method that i’ll describe below.

This table show the value of replacement if the parameter is missing for each of 4 type of demographic scenario. 

| missing parameter \ model of origin | SI | IM | SC | AM | 
| ---|---|---|---|---|
|Tsc | 0 | Tspilt | X | 0 |
|Tam | Tsplit | 0 | Tsplit | X |
|M_current | 0 | X | X | 0 | 
| M_ancestral | 0 | 0 | 0 | X |
|  shape_N_a | 1e4 | 1e4 | 1e4 | 1e4 |
| shape_N_b | 1e4 | 1e4 | 1e4 | 1e4 |
| shape_M_current_a| 1e4 | 1e4 | 1e4 | 1e4 |
| shape_M_current_b | 1e4 | 1e4 | 1e4 | 1e4 |
|shape_M_ancestral_a| 1e4 | 1e4 | 1e4 | 1e4 |
|shape_M_ancestral_b| 1e4 | 1e4 | 1e4 | 1e4 |
|Pbarrier_Mcurrent | U(0.5,0.5) | U(0.5,0.5) | U(0.5,0.5) | U(0.5,0.5) | 
|Pbarrier_Mancestral | U(0.5,0.5) | U(0.5,0.5) | U(0.5,0.5) | U(0.5,0.5) |

The value of beta parameters (a and b) is set to 1e4, in order to minimize the sd of the distribution, mimiquing a case where there is no heterogeneity (which is the case when beta parameters are missing)
When Pbarrier parameter is missing (so there is no heterogeneiity in migration), we assume that there is no information about the proportion of barrier. Rather than putting a 0 (which is an information), we choose to pick a random number between 0 and 1. In the end, replacing missing Pbarrier by a random number, just add noise and make a larger distribution which discribe well the uncertainity. 
