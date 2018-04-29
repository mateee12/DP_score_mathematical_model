function [index] = OI(rpe_table, rpe_index)
    [h,~] = size(rpe_table);
    last = 0;

    for i = 1:h
        current = rpe_table(i, 1);
        
        if (last < rpe_index) && (rpe_index <= current)
            index = i;
            return;
        end
        
        last = current;
    end
end
