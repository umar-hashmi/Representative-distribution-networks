clear 
close all
clc

% network_name = 'C:\Users\uhashmi\OneDrive - KU Leuven\Task_0.2_IMPROcap_Files\Redistribution_RF_Sari\Selected_RRN_Repo\selected_reconfigurable_networks\reconfigurable_outlier_case_5.m';
% network_name = 'C:\Users\uhashmi\OneDrive - KU Leuven\InduFlex_market_participation\Matpower_case\threeBus_LV_industrial.m';
network_name = 'C:\Users\uhashmi\OneDrive - KU Leuven\Task_0.2_IMPROcap_Files\Redistribution_RF_Sari\Selected_RRN_Repo\selected_reconfigurable_networks\reconfigurable_case_3.m';

define_constants;
mpc = loadcase(network_name);
result_dg= runpf(mpc);
Voltage_post(:,1) = result_dg.bus(:,8);


figure;
plot(Voltage_post)

%%
