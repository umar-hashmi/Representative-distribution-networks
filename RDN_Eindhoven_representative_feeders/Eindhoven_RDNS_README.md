# REPRESENTATIVE DISTRIBUTION FEEDERS FROM THE Eindhoven DATA SET

The original  Eindhoven dataset is part of the Eindhoven [network](https://ieeexplore.ieee.org/document/9584691)

In this repository four selected Eindhoven representative networks are as below:

| **Feature**               | **RDN1** | **RDN2** | **RDN3** | **RDN4** |
|---------------------------|----------|----------|----------|----------|
| **Feeder**                | 2572     | 2577     | 2555     | 2562     |
|---------------------------|----------|----------|----------|----------|
| **Feature 1: Nodes**      | 57       | 202      | 14       | 289      |
| **Feature 2: Branches**   | 60       | 238      | 14       | 426      |
| **Feature 3: # of loads** | 40       | 161      | 9        | 239      |
| **Feature 4: # of Line codes** | 4    | 4        | 2        | 4        |
| **Feature 5: Transformer kVA** | 630 | 630      | 250      | 630      |
| **Feature 6: Length**     | 1.834    | 5.347    | 0.673    | 6.837    |
| **Feature 7: Resistance** | 0.799    | 2.323    | 0.374    | 2.925    |
| **Feature 8: Reactance**  | 0.149    | 0.436    | 0.055    | 0.557    |
| **Feature 9: R/X**        | 5.352    | 5.330    | 6.751    | 5.254    |
| **Feature 10: P MWh**     | 408.968  | 603.69   | 93.64    | 733.4    |
| **Feature 11: Q MVAr**    | 200.605  | 218.64   | 41.03    | 269.2    |
| **Feature 12: Power factor** | 0.898 | 0.940    | 0.916    | 0.939    |
| **Feature 13: Graph diameter** | 29 | 39       | 10       | 65       |
| **Feature 14: Max degree** | 5       | 8        | 5        | 5        |
| **Feature 15: Average degree** | 1.965 | 1.990    | 1.857    | 1.993    |
| **Feature 16: Degree 1**  | 0.246    | 0.198    | 0.357    | 0.131    |
| **Feature 17: Degree 2**  | 0.579    | 0.658    | 0.571    | 0.761    |
| **Feature 18: Degree 3**  | 0.158    | 0.129    | 0        | 0.093    |
| **Feature 19: Degree 4**  | 0        | 0        | 0        | 0.010    |
| **Feature 20: Degree 5**  | 0.0175   | 0.010    | 0.071    | 0.003    |
| **Feature 21: Degree 6**  | 0        | 0        | 0        | 0        |
| **Feature 22: Area (sq. m.)** | 67679 | 118004   | 11158    | 130640   |
| **Feature 23: Area per consumer** | 1692 | 733      | 1240     | 547      |
| **Feature 24: Residential load share** | 0.85 | 0.963    | 0.556    | 0.925    |
| **Cluster weight**        | 0.5833   | 0.1667   | 0.1667   | 0.0833   |


## Folder Structure
- `OpenDSS`: The representative feeders are available for power flow analysis using `OpenDSS`
- `PMD`: The representative feeders are available for power flow analysis using `PowerModelsDistribution.jl`
  
## Instructions for using `PowerModelsDistribution.jl` to load and analyze the feeders:  

1. install Julia (https://julialang.org/) on your system.
2. install IJulia  and Jupyter notebook by running the following commands in Julia console:
```julia
using Pkg
Pkg.add("IJulia")
```
3. You can use the Jupyter Notebook `rep_eindhoven_pmd.ipynb` as a guide to the steps needed to load and analyze the networks.
