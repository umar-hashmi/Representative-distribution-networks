using Pkg
Pkg.add(PackageSpec(name="PowerModelsDistribution", version="0.15.2"))
Pkg.add("Ipopt")
using PowerModelsDistribution
PMD = PowerModelsDistribution
using Ipopt

RDN4 = PowerModelsDistribution.parse_file("..//OpenDSS//RDN4_2562.dss")
transform_loops!(RDN4)
remove_all_bounds!(RDN4)

RDN4["settings"] # change vbase & sbase as per problem requirements

# perform power flow analysis 
math = transform_data_model(RDN4, kron_reduce=false, phase_project=false)
pf_res = PMD.compute_mc_pf(math; explicit_neutral=true, max_iter=20, multinetwork = true)

# Explore results
pf_res["solution"]["bus"]["1"]["vm"]
pf_res["solution"]["bus"]["1"]["va"]
pf_res["solution"]["branch"]["1"]["cr"]
pf_res["solution"]["load"]





