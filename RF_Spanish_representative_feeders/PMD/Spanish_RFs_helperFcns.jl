
"""
    add_feeders_cktbks!(eng)

Add feeders and circuit breakers to the given `eng` dictionary.

# Arguments
- `eng`: A dictionary representing the engineering data.

# Description
This function iterates over the lines in the `eng` dictionary and adds the lines that match the pattern `feederd+` to the `Feeders` dictionary, and the lines that match the pattern `cktbkd+` to the `Cktbk` dictionary. Finally, it adds the `Cktbk` and `Feeders` dictionaries to the `eng` dictionary.

"""


function add_feeders_cktbks!(eng)
    Feeders = Dict{}()
    Cktbk = Dict{}()
    for (l, line) in eng["line"]
        if occursin(r"feeder\d+", l)
            Feeders[l] = line;
        end
    end
    for (cb, cktbk) in eng["line"]
        if occursin(r"cktbk\d+", cb)
            Cktbk[cb] = cktbk;
        end
    end
    eng["Cktbk"] = Cktbk;
    eng["Feeders"] = Feeders;
end




"""
    clean_irrelevant_data!(eng_feeder, transformer_id, feederno, flattened_member_lines)

This function cleans the irrelevant data from the `eng_feeder` dictionary based on the provided `transformer_id`, `feederno`, and `flattened_member_lines`.

## Arguments
- `eng_feeder`: A dictionary representing the feeder data.
- `transformer_id`: The ID of the transformer to keep in the `eng_feeder` dictionary.
- `feederno`: The feeder number to be used in the `eng_feeder` dictionary.
- `flattened_member_lines`: An array of line IDs to keep in the `eng_feeder` dictionary.



"""

function clean_irrelevant_data!(eng_feeder, transformer_id, feederno, flattened_member_lines)
    

    for (tr, transformer) in eng_feeder
        if tr != transformer_id
            delete!(eng_feeder["transformer"], tr)
        end 
    end

    for l in flattened_member_lines
        eng_feeder["line"][l]["Feeder"] = "feeder$feederno" 
    end


    # deleted unwanted lines
    for (l,lines) in eng_feeder["line"]

        if !in(l, flattened_member_lines)
            delete!(eng_feeder["line"], l)
        end
    end

    # delete unwanted buses
    keep_buses = []
    for (l,lines) in eng_feeder["line"]

        related_buses = [lines["f_bus"], lines["t_bus"]]
        for b in related_buses
            if !in(b, keep_buses)
                push!(keep_buses, b)
            end
        end

    end

    for (b,buses) in eng_feeder["bus"]
        if !in(b, keep_buses)
            delete!(eng_feeder["bus"], b)
        end
    end

    # delete unwanted loads
    for (lo, load) in eng_feeder["load"]
        if !in(load["bus"], keep_buses)
            delete!(eng_feeder["load"], lo)
        end
    end


    # delete unwanted transformers
    for (tr, transformer) in eng_feeder["transformer"]
        if tr != transformer_id[1]
            delete!(eng_feeder["transformer"], tr)
        end 
    end

    # delete unwanted linecodes
    keep_codes = []
    for (l,lines) in eng_feeder["line"]

        related_codes = [lines["linecode"]]
        for c in related_codes
            if !in(c, keep_codes)
                push!(keep_codes, c)
            end
        end

    end

    for (c,codes) in eng_feeder["linecode"]
        if !in(c, keep_codes)
            delete!(eng_feeder["linecode"], c)
        end
    end
    # delete unwanted Feeders
    for (f, feeder) in eng_feeder["Feeders"]
        if f != "feeder$feederno"
            delete!(eng_feeder["Feeders"], f)
        end
    end

    # delete unwanted CBs
    for (c, cktbk) in eng_feeder["Cktbk"]
        if c != "cktbk$feederno"
            delete!(eng_feeder["Cktbk"], c)
        end
    end


    # delete unwanted shunts

    for (sh, shunts) in eng_feeder["shunt"]
        if sh != "line_loop.grnd$feederno"
            delete!(eng_feeder["shunt"], sh)
        end
    end

    # delete unwanted loadshapes

    if haskey(eng_feeder, "time_series")
        keep_shapes = []
        
        for (lo, load) in eng_feeder["load"]
            related_shapes = [load["time_series"]["pd_nom"]]
            for s in related_shapes
                if !in(s, keep_shapes)
                    push!(keep_shapes, s)
                end
            end
        end
        
        for (sh, shape) in eng_feeder["time_series"]
            if !in(sh, keep_shapes)
                delete!(eng_feeder["time_series"], sh)
            end
        end
    end
        
    eng_feeder["name"] = "feeder$feederno"

end



"""
isolate_feeder(eng, feederno)

Given a network data structure `eng` and a feeder number `feederno`, this function creates a deep copy of the `eng` structure and isolates the specified feeder.

# Arguments
- `eng`: A network data structure.
- `feederno`: The feeder number to isolate.

# Returns
- `eng_feeder`: A deep copy of the `eng` structure with the specified feeder isolated.

# Description
The function isolates the specified feeder by performing the following steps:
1. Creates a deep copy of the `eng` structure.
2. Sets the voltage source bus to the TrLVBus of the specified feeder.
3. Retrieves the transformer ID(s) associated with the TrLVBus.
4. Retrieves the feeder head bus and the circuit breaker buses of the specified feeder.
5. Constructs a list of member lines by traversing the network starting from the feeder head bus.
6. Filters out any empty member lines and flattens the list.
7. Appends the transformer ID(s), feeder number, and circuit breaker number to the list of member lines.
8. Removes irrelevant data from the `eng_feeder` structure based on the transformer ID(s), feeder number, and member lines.

"""
function isolate_feeder(eng, feederno)
    eng_feeder  = deepcopy(eng)


    TrLVBus = eng_feeder["Feeders"]["feeder$feederno"]["f_bus"]
    eng_feeder["voltage_source"]["source"]["bus"] = TrLVBus 


    transformer_id = [x for (x, xfmr) in pairs(eng_feeder["transformer"]) if xfmr["bus"][2] == TrLVBus]
    display("Network: $(transformer_id...), Feeder: $feederno")
    Feeder_head = eng_feeder["Feeders"]["feeder$feederno"]["t_bus"]
    Feeder_head = eng_feeder["Cktbk"]["cktbk$feederno"]["f_bus"]
    cb_2 = eng_feeder["Cktbk"]["cktbk$feederno"]["t_bus"]

    ################
    moving_LVBus = [Feeder_head]
    member_lines = []
    while length(moving_LVBus) > 0
        temp_lines = []
        while length(moving_LVBus) > 0
            member_line = [x for (x, line) in pairs(eng_feeder["line"]) if line["f_bus"] == moving_LVBus[end]]
            push!(member_lines, member_line)
            push!(temp_lines, member_line...)
            pop!(moving_LVBus)
        end
        moving_LVBus = [string(eng_feeder["line"][l]["t_bus"]) for l in temp_lines]
    end
    ##################


    flattened_member_lines = filter(x -> length(x) > 0, vcat(member_lines...))
    mv_id= string.([x for (x, line) in eng_feeder["line"] if line["t_bus"] == eng_feeder["transformer"][string.(transformer_id...)]["bus"][1]]...)
    push!(flattened_member_lines, mv_id) 
    push!(flattened_member_lines, "feeder$feederno")
    push!(flattened_member_lines, "cktbk$feederno")
    
 
    clean_irrelevant_data!(eng_feeder, transformer_id, feederno, flattened_member_lines)    
    return eng_feeder
end

"""
    rm_spanish_transformer!(data_eng)

Remove the Spanish transformer from the given `data_eng` dictionary.

# Arguments
- `data_eng`: A dictionary containing the network data.

# Description
This function removes the Spanish transformer from the `data_eng` dictionary. It updates the voltage source parameters, deletes the transformer, deletes the lines connected before the transformer, updates the bus settings, and resets the terminals and grounded status of the buses.

"""
function rm_spanish_transformer!(data_eng)
   
    if haskey(data_eng, "transformer")
        trans = first(data_eng["transformer"]).second

        old_slack = first(data_eng["transformer"]).second["bus"][1]
        new_slack = first(data_eng["transformer"]).second["bus"][2]
        #display("Old slack bus: $old_slack")
        #display("New slack bus: $new_slack")

        vprim_scale = trans["vm_nom"][2]/trans["vm_nom"][1]
        data_eng["voltage_source"]["source"]["vm"] *= vprim_scale
        data_eng["voltage_source"]["source"]["rs"] *= vprim_scale^2
        data_eng["voltage_source"]["source"]["xs"] *= vprim_scale^2
        data_eng["voltage_source"]["source"]["bus"] =   new_slack # the new slack bus

        delete!(data_eng, "transformer")
        
        #delete lines connected before transformer
        
        line_bf = string.([x for(x, line) in data_eng["line"] if line["f_bus"] == old_slack || line["t_bus"] == old_slack]...)
        delete!(data_eng["line"], line_bf)

        delete!(data_eng["bus"], old_slack)
        data_eng["settings"]["vbases_default"][new_slack] = data_eng["settings"]["vbases_default"]["source"]*vprim_scale
        #delete!(data_eng["settings"]["vbases_default"], "source")
        delete!(data_eng["settings"]["vbases_default"], "source")
        delete!(data_eng["bus"], "source")

        for (b, bus) in data_eng["bus"]
            if length(bus["terminals"]) > 4
                bus["terminals"] = [1, 2, 3, 4]
                bus["grounded"] = Int64[]
            end
        end

        for (sh, shunt) in data_eng["shunt"]
            #if shunt["bus"] == new_slack
                delete!(data_eng["shunt"], sh)
            #end
        end

    end
end


