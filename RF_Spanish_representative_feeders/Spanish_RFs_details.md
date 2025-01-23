# The Spanish representative feeders from the Spanish data set 

These representative feeders are selected from the Spanish data set. The original Spanish dataset is part of the Spanish [dataset](https://data.mendeley.com/datasets/685vgp64sm/1)

|                                                   | **RF1** | **RF2** | **RF3** | **RF4** | **RF5** | **RF6** |
|---------------------------------------------------|---------|---------|---------|---------|---------|---------|
| **Feeder ID**                                     | 160     | 111     | 49      | 32      | 80      | 83      |
|---------------------------------------------------|---------|---------|---------|---------|---------|---------|
| **1. # nodes**                                    | 103     | 114     | 48      | 38      | 260     | 19      |
| **2. # line**                                     | 102     | 113     | 47      | 37      | 259     | 18      |
| **3. Graph diameter**                             | 45      | 58      | 28      | 16      | 169     | 17      |
| **4. Max degree**                                 | 4       | 5       | 3       | 5       | 4       | 3       |
| **5. Degree 1 nodes**                             | 0.2427  | 0.0965  | 0.1458  | 0.3421  | 0.1269  | 0.1579  |
| **6. Degree 2 nodes**                             | 0.5825  | 0.8421  | 0.75    | 0.4737  | 0.7577  | 0.7895  |
| **7. Degree 3 nodes**                             | 0.1262  | 0.0526  | 0.1042  | 0.1053  | 0.1115  | 0.0526  |
| **8. Degree 4 nodes**                             | 0.0485  | 0       | 0       | 0.0526  | 0.0038  | 0       |
| **9. Degree 5 nodes**                             | 0       | 0.0088  | 0       | 0.0263  | 0       | 0       |
| **10. Degree 6 nodes**                            | 0       | 0       | 0       | 0       | 0       | 0       |
| **11. feeder resistance**                         | 0.6615  | 0.1746  | 0.0567  | 0.7839  | 0.3712  | 0.0192  |
| **12. feeder reactance**                          | 0.0911  | 0.0242  | 0.0202  | 0.0883  | 0.0721  | 0.0072  |
| **13. R over X**                                  | 7.26    | 7.23    | 2.81    | 8.88    | 5.15    | 2.68    |
| **14. # line codes**                              | 13      | 11      | 6       | 9       | 12      | 4       |
| **15. # load**                                    | 35      | 8       | 91      | 18      | 29      | 51      |
| **16. Transformer kVA**                           | 250     | 630     | 630     | 630     | 630     | 630     |
| **17. # 1-ϕ loads**                               | 31      | 8       | 76      | 16      | 26      | 46      |
| **18. # 3-ϕ loads**                               | 4       | 0       | 15      | 2       | 3       | 5       |
| **19. 1-ϕ load share**                            | 0.886   | 1       | 0.835   | 0.889   | 0.897   | 0.902   |
| **20. Impedance**                                 | 0.6678  | 0.1763  | 0.0602  | 0.7889  | 0.3781  | 0.0205  |
| **21. mean impedance**                            | 0.0065  | 0.0016  | 0.0013  | 0.0213  | 0.0015  | 0.0011  |
| **22. feeder length m**                           | 1029    | 288.0   | 270.3   | 974.9   | 876.9   | 97.1    |
| **23. Area in m²**                                | 48461   | 2192    | 5280    | 68499   | 22994   | 874.7   |
| **24. GraphDia/nodes**                            | 0.44    | 0.51    | 0.58    | 0.42    | 0.65    | 0.89    |
| **25. Length/load**                               | 29.4    | 36.0    | 3.0     | 54.2    | 30.2    | 1.9     |
| **26. Yearly kWh/load**                           | 2123    | 1641.6  | 2036.0  | 1775.9  | 1922.3  | 1835.7  |
| **27. Yearly kVAr/load**                          | 196.5   | 166.6   | 219.2   | 185.6   | 176.5   | 187.0   |
| **28. Area per load**                             | 1385    | 274.0   | 58.0    | 3805.5  | 792.9   | 17.2    |
| **29. Average degree**                            | 1.96    | 1.98    | 1.91    | 1.94    | 1.96    | 1.98    |
| **Cluster weight**                                | 0.0551  | 0.0787  | 0.6299  | 0.0079  | 0.0236  | 0.2047  |


## Folder Structure
- `Plots`: The network layout plot of representative feeders is available in the `Plots` folder.
- `OpenDSS`: The representative feeders are available for power flow analysis using `OpenDSS`
- `PMD`: The representative feeders are available for power flow analysis using `PowerModelsDistribution.jl`
  
## Instructions for using `PowerModelsDistribution.jl` to load and analyze the feeders:  

1. install Julia (https://julialang.org/) on your system.
2. install IJulia  and Jupyter notebook by running the following commands in Julia console:
```julia
using Pkg
Pkg.add("IJulia")
```
3. You can use the Jupyter Notebook `rep_spanish_pmd.ipynb` as a guide to the steps needed to load and analyze the networks.
