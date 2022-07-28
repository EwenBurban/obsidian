Tags : #Redaction
RIDGE use an ABC approach to first determine an average demographic model and second detect gene flow barrier. The demographic models used in RIDGE are fairly simple (cf Fig A) : One ancestral population of effective size **Na**, give two daughter populations of size **N1** and **N2** at the time **Tsplit**, depending on the scenario there is or not migration **M**. From this, there are 4 different scenarios :
-   Strict Isolation (SI) : there is no migration between population
-   Isolation-Migration (IM) : there is migration between population
-   Ancestral Migration (AM) : there is migration until **Tam**
-   Secondary Contact (SC) : there is no migration until **Tsc**

Those scenarios are “global” scenarios that define the demography of all loci inside the genome. In the other hand, there is four “genomic” scenario:
-   Homogeneity of Ne and migration (1M_1N)
-   Heterogeneity of Ne and migration (2M_2N)
-   Homogeneity of migration and heterogeneity of Ne (1M_2N)
-   Heterogeneity of migration and homogeneity of Ne (2M_1N)

Because there is no migration in SI models, there are only two genomic scenarios under strict isolation : SI_1N and SI_2N. In the end, it has 14 different scenarios.

![[demographic_model.jpg]]
**Fig 1** : *Schematic representation of demographic models use in RIDGE*
