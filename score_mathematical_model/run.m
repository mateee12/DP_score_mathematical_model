% activity_data = containers.Map;
% activity_data('rpe_indexes') = [1, 4, 2];
% activity_data('rpe_values') = [30, 20, 40];
% activity_data('hr_average') = [100, 150, 130];
% activity_data('rr_average') = [80, 100, 70];
% activity_data('hr_max') = 220;
% activity_data('rr_max') = 140;

load('hr_rpe_table');
load('rr_rpe_table');
load('activity_data');

rpe_indexes = randi([1 10],1,500);
rate_ratios = randi([30 100],1,500);
partial_scores = zeros(1,500);
diffs = zeros(1,500);
for i = 1:500
    diff = OI(hr_rpe_table, rpe_indexes(i)) - RI(hr_rpe_table, rate_ratios(i));
    diffs(i) = diff + rand;
    part_score = 80 + 10 * diff;
    if part_score > 100
        part_score = 100;
    end
    partial_scores(i) = part_score;
end

scatter3(rpe_indexes,diffs,partial_scores, 'MarkerFaceColor',[0 .75 .75]);

total_score()


