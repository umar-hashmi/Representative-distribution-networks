using Pkg
Pkg.add(PackageSpec(name="PowerModelsDistribution", version="0.15.2"))
Pkg.add("Ipopt")
using PowerModelsDistribution
PMD = PowerModelsDistribution
using Ipopt

RDN3 = PowerModelsDistribution.parse_file("..//OpenDSS//RDN3_2555.dss")
transform_loops!(RDN3)
remove_all_bounds!(RDN3)

RDN3["settings"] # change vbase & sbase as per problem requirements 

# perform power flow analysis 
math = transform_data_model(RDN3, kron_reduce=false, phase_project=false)
pf_res = PMD.compute_mc_pf(math; explicit_neutral=true, max_iter=20, multinetwork = true)

# Explore results
pf_res["solution"]["bus"]["1"]["vm"]
pf_res["solution"]["bus"]["1"]["va"]
pf_res["solution"]["branch"]["1"]["cr"]
pf_res["solution"]["load"]





