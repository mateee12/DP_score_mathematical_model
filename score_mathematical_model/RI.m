function [index] = RI(rpe_table, rate_ratio)
    [h,~] = size(rpe_table);
    last = 0;

    for i = 1:h
        current = rpe_table(i, 2);
        
        if (last < rate_ratio) && (rate_ratio <= current)
            index = i;
            return;
        end
        
        last = current;
    end
end