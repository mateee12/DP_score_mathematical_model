function [total_score] = total_score()
    global hr_rpe_table rr_rpe_table activity_data;
    load('hr_rpe_table');
    load('rr_rpe_table');
    load('activity_data');

    total_score = (S('heart_rate') + S('respiratory_rate')) / 2;
end

function [score] = S(unit)
    global hr_rpe_table rr_rpe_table activity_data;
    
    [~, APc] = size(activity_data('rpe_indexes'));
    APri = activity_data('rpe_indexes');
    APr = activity_data('rpe_values');
    Ar = sum(activity_data('rpe_values'));
    
    score = 0;
    for index = 1:APc
       score = score + (80 + 10 * (OI(T(unit), APri(index)) - RI(T(unit), (APSa(index, unit) * 100) / MR(unit)))) * (APr(index) / Ar); 
    end
end

function [table] = T(unit)
    global hr_rpe_table rr_rpe_table;
    
    if isequal(unit, 'heart_rate')
        table = hr_rpe_table;
    elseif isequal(unit, 'respiratory_rate')
        table = rr_rpe_table;
    end
end

function [av_rate] = APSa(index, unit)
    global activity_data;

    if isequal(unit, 'heart_rate')
        avs = activity_data('hr_average');
    elseif isequal(unit, 'respiratory_rate')
        avs = activity_data('rr_average');
    end
    
    av_rate = avs(index);
end

function [max_rate] = MR(unit)
    global activity_data;

    if isequal(unit, 'heart_rate')
        max_rate = activity_data('hr_max');
    elseif isequal(unit, 'respiratory_rate')
        max_rate = activity_data('rr_max');
    end
end



