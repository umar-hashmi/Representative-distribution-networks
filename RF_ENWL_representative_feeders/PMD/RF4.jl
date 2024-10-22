using Pkg
Pkg.add("PowerModelsDistribution")
Pkg.add("Ipopt")

using PowerModelsDistribution
using Ipopt

# parse the OpenDSS file from `OpenDSS/RFx` where x is the feeder number
    data = PowerModelsDistribution.parse_file("..//OpenDSS//RF4//Master.dss") 

# read and modify the data

    ## example: read the line type of first line
        linecode_l1 = data["line"]["line1"]["linecode"]
        data["linecode"][linecode_l1] 
            ## from the dictionary you can explore the line matrices
        data["linecode"][linecode_l1]["rs"]


    ## example: increase all loading by 10% 
        for (lo, load) in data["load"]
            load["pd_nom"] *=  1.1
        end

# run an optimal power flow study (unablanced three phase ACP Formulation)
    result = PowerModelsDistribution.solve_mc_opf(data,ACRUPowerModel, Ipopt.Optimizer)

# read results for each element
display(result["solution"]["bus"])
display(result["solution"]["line"])
display(result["solution"]["load"])
display(result["solution"]["transformer"])
