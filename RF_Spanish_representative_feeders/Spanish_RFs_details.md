

The selected spanish RFs are the following:
|              |                          | **RF1** | **RF2** | **RF3** | **RF4** | **RF5** | **RF6** |
|--------------|--------------------------|---------|---------|---------|---------|---------|---------|
|              | **Feeder ID**            | 160     | 111     | 43      | 32      | 80      | 73      |
| **Feature 1**  | Number of nodes          | 103     | 114     | 49      | 38      | 260     | 8       |
| **Feature 2**  | Number of lines          | 102     | 113     | 48      | 37      | 259     | 7       |
| **Feature 3**  | Graph diameter           | 45      | 58      | 31      | 16      | 169     | 7       |
| **Feature 4**  | Max degree of graph      | 4       | 5       | 4       | 5       | 4       | 2       |
| **Feature 5**  | Nodes with degree 1      | 0.2427  | 0.0965  | 0.1224  | 0.3421  | 0.1269  | 0.25    |
| **Feature 6**  | Nodes with degree 2      | 0.5825  | 0.8421  | 0.8163  | 0.4737  | 0.7577  | 0.75    |
| **Feature 7**  | Nodes with degree 3      | 0.12621 | 0.05263 | 0.0408  | 0.10526 | 0.1115  | 0       |
| **Feature 8**  | Nodes with degree 4      | 0.048544| 0       | 0.0204  | 0.05263 | 0.0039  | 0       |
| **Feature 9**  | Nodes with degree 5      | 0       | 0.00877 | 0       | 0.02632 | 0       | 0       |
| **Feature 10** | Nodes with degree 6      | 0       | 0       | 0       | 0       | 0       | 0       |
| **Feature 11** | Feeder resistance        | 0.6616  | 0.1746  | 0.0554  | 0.7839  | 0.3712  | 0.0057  |
| **Feature 12** | Feeder reactance         | 0.0911  | 0.0242  | 0.0177  | 0.0883  | 0.0721  | 0.00247 |
| **Feature 13** | R over X                 | 7.260   | 7.228   | 3.140   | 8.878   | 5.1484  | 2.318   |
| **Feature 14** | Number of line codes     | 13      | 11      | 6       | 9       | 12      | 4       |
| **Feature 15** | Number of loads          | 35      | 8       | 38      | 18      | 29      | 18      |
| **Feature 16** | Transformer rating       | 250     | 630     | 630     | 630     | 630     | 630     |
| **Feature 17** | Number of 1-φ loads      | 31      | 8       | 36      | 16      | 26      | 16      |
| **Feature 18** | Number of 3-φ loads      | 4       | 0       | 2       | 2       | 3       | 2       |
| **Feature 19** | Ratio of 1-φ consumers   | 0.8857  | 1       | 0.9474  | 0.8889  | 0.8966  | 0.8889  |
| **Feature 20** | Impedance                | 0.6678  | 0.1763  | 0.0582  | 0.7889  | 0.3781  | 0.00623 |
| **Feature 21** | Average path impedance   | 0.00655 | 0.00156 | 0.00121 | 0.02132 | 0.00146 | 0.00089 |
| **Feature 22** | Feeder length (m)        | 1028.85 | 288.003 | 219.497 | 974.94  | 876.924 | 31.963  |
| **Feature 23** | Area (m²)                | 48461.3 | 2192.3  | 2982.5  | 68499   | 22993.5 | 58.05   |
| **Feature 24** | GraphDia/ # nodes        | 0.437   | 0.509   | 0.633   | 0.421   | 0.65    | 0.875   |
| **Feature 25** | Length/Consumer          | 29.4    | 36.0    | 5.78    | 54.16   | 30.24   | 1.78    |
| **Feature 26** | Yearly kWh/customer      | 2123.2  | 1641.6  | 1773.9  | 1775.9  | 1922.3  | 1568.0  |
| **Feature 27** | Yearly kVAr/customer     | 196.5   | 166.6   | 175.4   | 185.6   | 176.53  | 167.60  |
| **Feature 28** | Area per consumer        | 1384.6  | 274.0   | 78.5    | 3805.5  | 792.88  | 3.22    |
| **Feature 29** | Average degree           | 1.957   | 1.976   | 1.98    | 1.94    | 1.96    | 1.83    |

# Power Models Distribution Example

This guide will help you set up and run the provided Julia code for power models distribution. Follow the steps below to get started.

## Prerequisites

1. Install [Julia](https://julialang.org/downloads/) on your system.
2. Make sure you have an internet connection to download necessary packages.

## Instructions

### Step 1: Install Required Packages

1. Open Julia by typing `julia` in your terminal or launching it from your applications menu.
2. Add the required packages by running the following commands:

    ```julia
    using Pkg
    Pkg.add(PackageSpec(name="PowerModelsDistribution", version="0.15.2"))
    Pkg.add("Ipopt")
    ```

### Step 2: Load the Packages

1. Load the installed packages by running:

    ```julia
    using PowerModelsDistribution
    using Ipopt
    ```

### Step 3: Include Helper Functions

1. Make sure the `Spanish_RFs_helperFcns.jl` file is in your current directory.
2. Include the helper functions by running:

    ```julia
    include("Spanish_RFs_helperFcns.jl")
    ```

### Step 4: Parse the Network File

1. Parse the network file by running:

    ```julia
    eng = PowerModelsDistribution.parse_file("OpenDSS//Master.dss")
    transform_loops!(eng)
    remove_all_bounds!(eng)
    add_feeders_cktbks!(eng)
    eng["settings"]["base_frequency"] = 50
    eng["settings"]["sbase_default"] = 630000
    ```

### Step 5: Choose the Feeder ID

1. Choose the Feeder ID based on the RF you want to use. For example, for RF 1 (Feeder 160), run:

    ```julia
    RF1 = isolate_feeder(eng, 160)
    ```

    Available options:
    - RF 1 - Feeder 160
    - RF 2 - Feeder 111
    - RF 3 - Feeder 43
    - RF 4 - Feeder 32
    - RF 5 - Feeder 80
    - RF 6 - Feeder 73

### Step 6: Run a Power Flow Analysis

1. Remove the Spanish transformer and transform the data model:

    ```julia
    rm_spanish_transformer!(RF1)
    math = transform_data_model(RF1, kron_reduce=false, phase_project=false)
    ```

2. Compute the power flow:

    ```julia
    pf_res = PowerModelsDistribution.compute_mc_pf(math; explicit_neutral=true, max_iter=20, multinetwork=true)
    ```

### Step 7: Explore Results

1. Explore the results by running the following commands to view specific values:

    ```julia
    pf_res["solution"]["bus"]["3"]["vm"]
    pf_res["solution"]["bus"]["3"]["va"]
    pf_res["solution"]["branch"]["1"]["cr"]
    pf_res["solution"]["load"]
    ```

That's it! You've successfully run the Julia code for power models distribution. You can further explore and analyze the results as needed.
