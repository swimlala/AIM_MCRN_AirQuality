%% Data

cities = ["bologna", "florence", "rome", "turin", "brescia", "parma", "milan", "modena"];

% for i = 1:length(cities)
%     filename = cities(i) + "_airRT.csv"; % filename for data
%     data_table = readtable(filename);
%     data_table.Date(1)
%     RT = data_table.mean'; % create row vector of NPI data
%     AQ = data_table.pm25'; % create row vector of AQ data
%     AQ = str2double(AQ);
%     
%     figure(1)
%     subplot(2, 2, i)
%     plot(AQ, RT, '.', 'markersize', 15)
%     title(cities(i))
%     xlabel("PM_{2.5} (\mu g/cm^2)")
%     ylabel("R_t")
% end

for i = 1:length(cities)
    filename = cities(i) + "_airRT.csv"; % filename for data
    data_table = readtable(filename);
    %cut off mismatched day
    z = 1;
    while data_table.Date(z) ~= datetime(2020, 02, 24)
        z = z + 1;
    end
    AQ = data_table.pm25(z:z + 147)';
    RT = data_table.mean(z:z + 147)';


    AQ = str2double(AQ);
    
    AQ_mean = zeros(1, 21);
    RT_mean = zeros(1, 21);
    
    week = 1;
    for j = 1:21
        AQ_mean(j) = mean(AQ(week:week+6));
        RT_mean(j) = mean(RT(week:week+6));
        week = week + 7;
    end
    
    AQ_move = movmean(AQ, 7);
    RT_move = movmean(RT, 7);
    
%     figure(1)
%     hold on;
%     plot(AQ_mean, 'Marker', '.', 'Markersize', 15)
%     legend(cities)
%     xlabel("week")
%     ylabel("Mean PM_{2.5}")
%     
    figure(2)
    hold on;
    plot(RT_mean, 'Marker', '.', 'Markersize', 15)
    legend(cities)
    xlabel("week")
    ylabel("Weekly Mean R_{effective}")
%     
%     figure()
%     plot(AQ_mean, RT_mean, '.', 'Markersize', 15)

%     for x = 1:20
%         subplot(4, 5, x);
%         hold on;
%         if cities(i) == "modena"
%             plot(AQ_mean(x), RT_mean(x), '.k', 'Markersize', 15)
%         else
%             plot(AQ_mean(x), RT_mean(x), '.', 'Markersize', 15)
%         end
%         ylabel("Mean RT")
%         xlim([0, 140])
%         ylim([0, 2])
%         xlabel("Mean PM_{2.5}")
%         title(['Wk ', num2str(x)]);
%     end
%     legend(cities)

    
%     figure(4)
%     hold on;
%     plot(AQ_move(1), 'Marker', '.', 'Markersize', 15)
%     legend(cities)
%     ylabel("7-day Moving Average PM_{2.5}")
%     
%     figure(5)
%     hold on;
%     plot(RT_move, 'Marker', '.', 'Markersize', 15)
%     legend(cities)
%     ylabel("7-day Moving Average R_t")
%     
%     figure(6)
%     hold on;
%     plot(AQ_move, RT_move, '.', 'Markersize', 15)
%     legend(cities)
%     ylabel("7-day RT")
%     xlabel("7-day AQ")
end

% for i = 1:length(cities)
%     filename = cities(i) + "_airRT.csv"; % filename for data
%     data_table = readtable(filename);
%     cases = data_table.Daily';
%     
%     figure(5)
%     subplot(2, 2, i)
%     plot(cases, '.', 'markersize', 15)
%     title(cities(i))
% end