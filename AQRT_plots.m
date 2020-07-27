%% Data

cities = ["bologna", "florence", "rome", "turin"];

for i = 1:length(cities)
    filename = cities(i) + "_airRT.csv"; % filename for data
    data_table = readtable(filename);
    RT = data_table.mean'; % create row vector of NPI data
    AQ = data_table.pm25'; % create row vector of AQ data
    AQ = str2double(AQ);
    
    figure(1)
    subplot(2, 2, i)
    plot(AQ, RT, '.', 'markersize', 15)
    title(cities(i))
    xlabel("PM_{2.5} (\mu g/cm^2)")
    ylabel("R_t")
end