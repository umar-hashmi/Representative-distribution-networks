# REPRESENTATIVE DISTRIBUTION FEEDERS FROM THE ENWL DATA SET

The original ENWL dataset is part of the ENWL - Low Voltage Network Solutions project [website](https://www.enwl.co.uk/future-energy/innovation/smaller-projects/low-carbon-networks-fund/low-voltage-network-solutions/).

In this repository four selected ENWL representative feeders are as below:

- RF1: network 2 feeder 5  in the original ENWL dataset
- RF2: network 5 feeder 4 in the original ENWL dataset
- RF3:  network 2 feeder 1 in the original ENWL dataset
- RF4:  network 5 feeder 1 in the original ENWL dataset

|  Feature id         | Selected feeders        | RF1    | RF2    | RF3    | RF4    |
|---------------------|-------------------------|--------|--------|--------|--------|
|                     | case id                 | 9      | 25     | 5      | 22     |
|                     | network id              | 2      | 5      | 2      | 5      |
|                     | feeder id               | 5      | 4      | 1      | 1      |
| 1                   | # of nodes              | 308    | 457    | 2286   | 130    |
| 2                   | # of edges              | 307    | 456    | 2285   | 129    |
| 3                   | diameter of graph       | 116    | 132    | 179    | 69     |
| 4                   | eigenmax A              | 2.6    | 2.7    | 3.0    | 2.3    |
| 5                   | eigenmax L              | 5.8    | 6.5    | 7.7    | 4.9    |
| 6                   | Maximum degree          | 4      | 5      | 6      | 3      |
| 7                   | # of line Codes         | 8      | 10     | 26     | 5      |
| 8                   | feeder length (km)      | 0.735  | 1.013  | 5.206  | 0.164  |
| 9                   | feeder resistance (ohm) | 0.376  | 0.907  | 4.617  | 0.219  |
| 10                  | feeder reactance (ohm)  | 0.055  | 0.081  | 0.416  | 0.014  |
| 11                  | R/X                     | 12.286 | 12.971 | 10.479 | 14.100 |
| 12                  | Degree 1 (%)            | 14.29  | 18.60  | 23.49  | 7.69   |
| 13                  | Degree 2 (%)            | 73.70  | 66.96  | 59.71  | 86.15  |
| 14                  | Degree 3 (%)            | 10.39  | 11.16  | 11.64  | 6.15   |
| 15                  | Degree 4 (%)            | 1.62   | 2.84   | 3.76   | 0      |
| 16                  | Degree 5 (%)            | 0      | 0.44   | 1.36   | 0      |
| 17                  | Degree 6 (%)            | 0      | 0      | 0.04   | 0      |
| 18                  | Impedance (ohm)         | 0.38   | 0.91   | 4.64   | 0.22   |
| 19                  | Number of Loads         | 23     | 30     | 175    | 4      |
| 20                  | Mean path length (m)    | 2.39   | 2.22   | 2.28   | 1.27   |
| 21                  | Mean length per consumer| 32.0   | 33.8   | 29.7   | 40.9   |
| 22                  | Area m2                 | 14434.7| 10291.7| 67695.6| 1280.1 |
| 23                  | Area per consumer       | 627.6  | 343.1  | 386.8  | 320.0  |
| 24                  | Mean Degree             | 1.99   | 2.00   | 2.00   | 2.00   |


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
3. You can use the Jupyter Notebook `rep_enwl_pmd.ipynb` as a guide to the steps needed to load and analyze the networks.
