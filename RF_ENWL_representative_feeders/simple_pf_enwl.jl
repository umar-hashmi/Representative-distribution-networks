using Pkg
Pkg.add("PowerModelsDistribution")
Pkg.add("Ipopt")

using PowerModelsDistribution
using Ipopt

# load the JSON file from `PMD.jl/RFx.json` where x is the feeder number
data = PowerModelsDistribution.parse_json("PMD//RF1.json")

# run a power flow analysis
result = PowerModelsDistribution.run_ac_opf(data, Ipopt.Optimizer)

# read a text fille
