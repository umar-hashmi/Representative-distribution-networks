using Pkg
Pkg.add(PackageSpec(name="PowerModelsDistribution", version="0.15.2"))
Pkg.add("Ipopt")
using PowerModelsDistribution
PMD = PowerModelsDistribution
using Ipopt
include("Spanish_RFs_helperFcns.jl")

RF3 = PowerModelsDistribution.parse_file("..//RFs_OpenDSS//RF3.dss")
transform_loops!(RF3)
remove_all_bounds!(RF3)
add_feeders_cktbks!(RF3)
RF3["settings"]["base_frequency"] = 50
RF3["settings"]["sbase_default"] = 630000
rm_spanish_transformer!(RF3)
for (l,line) in RF3["line"]
    if line["t_bus"] == "source" || line["f_bus"] == "source"
       delete!(RF3["line"], l)
    end
end


# perform power flow analysis
math = transform_data_model(RF3, kron_reduce=false, phase_project=false)
pf_res = PMD.compute_mc_pf(math; explicit_neutral=true, max_iter=20, multinetwork = true)

# Explore results
pf_res["solution"]["bus"]["1"]["vm"]
pf_res["solution"]["bus"]["1"]["va"]
pf_res["solution"]["branch"]["1"]["cr"]
pf_res["solution"]["load"]





