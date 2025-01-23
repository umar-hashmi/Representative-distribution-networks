# Identifying representative LV feeders, networks and reconfigurable test cases using European publicly available data sets	


## Abstract
Given the vast number of feeders and distribution network (DN) models, selecting representative sets is essential for evaluating algorithms, assessing policy impacts, and analyzing new infrastructure investments. This paper introduces a novel framework to identify representative feeders (RFs), distribution networks (RDNs), and reconfigurable networks (RRDNs). The framework employs a systematic methodology for feature extraction, outlier detection, normalization, feature selection, and clustering. Unlike previous studies, which primarily focus solely on cluster centers (i.e. the most representative feeder within a cluster), our approach also accounts for the least representative feeders within each cluster. It is crucial to identify these extreme test cases for a holistic evaluation. We propose a novel criterion for selecting the least RF for each cluster and also discuss alternative criteria. The choice of criterion may vary depending on the application’s purpose. We categorize the extracted features into graphical, electrical, geographical, and load-based attributes. The framework is applied to three publicly available datasets from the UK, Spain and the Netherlands, resulting in the identification of 4 RFs for the British dataset, 6 RFs for the Spanish dataset, and 4 RDNs for the Dutch dataset from Eindhoven. Additionally, we pioneered the identification of RRDNs for the Spanish dataset, analyzing graphical and electrical features such as the number of feeders, radial configurations, graph cycles, and reconfigurable switches, identifying 4 RRDNs. We provide a detailed repository with the identified RFs, RDNs, and RRDNs in multiple data formats compatible with widely employed open-source power flow solvers to facilitate reuse and reproducibility. The ultimate goal of the repository is to facilitate and benchmark smart grid research and development applied to European low-voltage DNs. Finally, this study summarizes and analyzes publicly available datasets for representative European DNs.

## Repository Content 

This repository contains the identified representative feeders, networks, and reconfigurable test cases from three publicly available datasets. The datasets are from the UK, Spain, and the Netherlands. The repository contains the model files ready for power flow analysis using MATPOWER, OpenDSS and PowerModelsDistribution.jl. The repository also includes detailed instructions and descriptions of the representative feeders, networks, and reconfigurable test cases.

## Repository Structure

### [RDN_Eindhoven_representative_feeders](RDN_Eindhoven_representative_feeders)
This folder contains the representative distribution networks (RDNs) from the Eindhoven dataset. It includes:
- `OpenDSS/`: Files for power flow analysis using OpenDSS.
- `PMD/`: Files for power flow analysis using PowerModelsDistribution.jl.
- `Eindhoven_RDNS_README.md`: Detailed instructions and descriptions of the Eindhoven representative networks.

### [RF_ENWL_representative_feeders](RF_ENWL_representative_feeders)
This folder contains the representative feeders (RFs) from the ENWL dataset. It includes:
- `OpenDSS/`: Files for power flow analysis using OpenDSS.
- `PMD/`: Files for power flow analysis using PowerModelsDistribution.jl.
- `Plots/`: Network layout plots of the representative feeders.
- `ENWL_RFS_README.md`: Detailed instructions and descriptions of the ENWL representative feeders.

### [RF_Spanish_representative_feeders](RF_Spanish_representative_feeders)
This folder contains the representative feeders (RFs) from the Spanish dataset. It includes:
- `OpenDSS/`: Files for power flow analysis using OpenDSS.
- `PMD/`: Files for power flow analysis using PowerModelsDistribution.jl.
- `Plots/`: Network layout plots of the representative feeders.
- `Spanish_RFs_README.md`: Detailed instructions and descriptions of the Spanish representative feeders.

### [Representative_Reconfigurable_Test_Networks](Representative_Reconfigurable_Test_Networks)
This folder contains the reconfigurable test networks (RRDNs) identified from the Spanish dataset. It includes:
- `selected_reconfigurable_networks/`: Files for the selected reconfigurable networks.
- `test_powerflow.jl`: Julia script for testing power flow using PowerModels.jl.
- `RRDN`: Detailed instructions and descriptions of the reconfigurable test networks.

## Summary Table

| Dataset       | Folder                                      | Number of Representative Feeders/Networks | README File                                      |
|---------------|---------------------------------------------|--------------------|--------------------------------------------------|
| Eindhoven     | [RDN_Eindhoven_representative_feeders](RDN_Eindhoven_representative_feeders) | 4                  | [Eindhoven_RDNS_README.md](RDN_Eindhoven_representative_feeders/Eindhoven_RDNS_README.md) |
| ENWL          | [RF_ENWL_representative_feeders](RF_ENWL_representative_feeders)             | 4                  | [ENWL_RFS_README.md](RF_ENWL_representative_feeders/ENWL_RFS_README.md)                   |
| Spanish       | [RF_Spanish_representative_feeders](RF_Spanish_representative_feeders)       | 6                  | [Spanish_RFs_README.md](RF_Spanish_representative_feeders/Spanish_RFs_README.md)          |
| Reconfigurable| [Representative_Reconfigurable_Test_Networks](Representative_Reconfigurable_Test_Networks) | 4                  | [RRDN_README](Representative_Reconfigurable_Test_Networks/RRDN_README.md)   |

## Model Availability Table

| Dataset       | OpenDSS | PowerModelsDistribution.jl | MATPOWER | Layout Plots |
|---------------|---------|----------------------------|----------|-------|
| Eindhoven     | Yes     | Yes                        | No       | No    |
| ENWL          | Yes     | Yes                        | No       | Yes   |
| Spanish       | Yes     | Yes                        | No       | Yes   |
| Reconfigurable| No      | Yes (PowerModels.jl)       | Yes      | No    |


Contributions to provide these representative feeders/networks into more formats are welcome and appreciated.


# Citation
If you use the data or code in this repository, please cite the following publication:

```
@article{hashmi2025identifying,
  title={Identifying representative LV feeders, networks and reconfigurable test cases using European publicly available data sets},
  author={ },
  journal={ },
  volume={ },
  pages={ },
  year={2025},
  publisher={ }
}
```
