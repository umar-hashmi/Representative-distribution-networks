
"""1) Import packages """
begin
    import PowerModels
    using JuMP, Gurobi, Ipopt
end


"""2) Create optimizers """

begin
    ipopt = JuMP.optimizer_with_attributes(Ipopt.Optimizer, "tol"=>1e-6, "print_level"=>0)
    gap = 0.01 #1e-4 # 0.05
    gurobi = JuMP.optimizer_with_attributes(Gurobi.Optimizer, "Presolve" => 1, "MIPGap" => gap, "FeasibilityTol" => 1e-9)
end

"""3) Read in network data """

begin
    file = "selected_reconfigurable_networks/reconfigurable_outlier_case_5.m"
    network_data = PowerModels.parse_file(file)

    for (b, branch) in network_data["branch"] 
        # correct for 3->1-phase translation of current rating
        branch["c_rating_a"] = branch["c_rating_a"]*sqrt(3)
    end

    for (b, branch) in network_data["branch"] 
        # correct for 3->1-phase translation of current rating
        branch["br_status"] = branch["z_branch_start"]
    end
end

"""4) Get / set operational configuration """
""" Note: the config is written as the list of switches (in ascending order) that is left open. The switch-ids correspond to the ids of the branches they are on"""
""" Note: should provide some functionality to check whether a config is radial / to provide a random radial config"""

begin
    function get_current_config(network_data::Dict)
        config = Int[]

        for (b, branch) in network_data["branch"] 
            # println(branch["br_status"])
            if branch["br_status"]==0
                push!(config, parse(Int, b))
            end
        end
        sort!(config)
        # println(config)

        return config
    end

    function set_config!(network_data::Dict, config)
        # should first check if config is radial!
        for (b, branch) in network_data["branch"] 
            if (parse(Int, b) in config) # if branch is open
                @assert branch["is_switch"]==1 "Only switches can be opened"
            end
            branch["br_status"] = Int(!(parse(Int, b) in config))
        end
    end


    actual_config = get_current_config(network_data) # the default operational config (how the data was originally given)
    set_config!(network_data, default_config)
    optimized_config_minimal_losses = [202, 352, 353, 354] # radial configuration optimized through MISOCP for minimal losses
    set_config!(network_data, optimized_config_minimal_losses)
    get_current_config(network_data)
end

"""5) Run the powerflow """


resultACPF = PowerModels.solve_pf(network_data, PowerModels.ACPPowerModel, ipopt)


"""6) Evaluate results """


begin
    total_generation = sum([resultACPF["solution"]["gen"][key]["pg"] for (key,gen) in network_data["gen"]])
    total_demand = sum([load["pd"] for (key,load) in network_data["load"]])
    total_power_loss = (total_generation - total_demand)*1000 # in kW
    
    print("total power loss (kW): ", total_power_loss,'\n')
end

begin
    ###############################################
    # Output for case 5:

    # optimized_config_minimal_losses = [202, 352, 353, 354]
    # total power loss (kW): 1.6685465956181171

    # default_config = [352, 353, 354, 355] 
    # total power loss (kW): 1.9156504917044181
end

