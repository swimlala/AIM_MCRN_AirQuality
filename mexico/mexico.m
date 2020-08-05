mexico_table = readtable("big_mexico.csv");
%make a table of only positives so we can go faster
positives_table = mexico_table(mexico_table.RESULTADO == 1,:); %RESULTADO = 1 means positive, 2 is negative, 3 is waiting on result

%number of cities in each state
num_cities = [11, 5, 9, 11, 38, 10, 124, 67, 17, 39, 46, 81, 84, 125, 125, 113, 35, 20, 51, 570, 217, 18, 11, 58, 18, 72, 17, 43, 60, 212, 106, 58];
i = 1;
result = [];
for state = 1:32
    %make a table every time we look at a new state so we can go faster
    state_table = positives_table(str2double(positives_table.ENTIDAD_RES) == state, :);
    for city = [1:num_cities(state),999] %city = 999 means "patient didnt disclose city
        rows = str2double(state_table.MUNICIPIO_RES) == city;
        result(i) = sum(rows);
        i =i+1;
        %remove annoying missing cities from the table
        if (state == 3 && ( city == 4 || city == 5 || city == 6 || city == 7)) || (state == 7 && city == 95) || (state == 9 && city == 1)
            i = i-1;
        end
    end
end
result = result';
