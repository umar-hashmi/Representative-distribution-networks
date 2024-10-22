using Pkg
Pkg.add(PackageSpec(name="PowerModelsDistribution", version="0.15.2"))
Pkg.add("Ipopt")
using PowerModelsDistribution
PMD = PowerModelsDistribution
using Ipopt
include("Spanish_RFs_helperFcns.jl")

RF2 = PowerModelsDistribution.parse_file("..//RFs_OpenDSS//RF2.dss")
transform_loops!(RF2)
remove_all_bounds!(RF2)
add_feeders_cktbks!(RF2)
RF2["settings"]["base_frequency"] = 50
RF2["settings"]["sbase_default"] = 630000
rm_spanish_transformer!(RF2)
for (l,line) in RF2["line"]
    if line["t_bus"] == "source" || line["f_bus"] == "source"
       delete!(RF2["line"], l)
    end
end


# perform power flow analysis
math = transform_data_model(RF2, kron_reduce=false, phase_project=false)
pf_res = PMD.compute_mc_pf(math; explicit_neutral=true, max_iter=20, multinetwork = true)

# Explore results
pf_res["solution"]["bus"]["1"]["vm"]
pf_res["solution"]["bus"]["1"]["va"]
pf_res["solution"]["branch"]["1"]["cr"]
pf_res["solution"]["load"]





