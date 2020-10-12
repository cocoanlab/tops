for i = 1:48
    Study3.dfc_10bin_dat.REST{i} = conndat.study{3}.subject{i}.condition{1}.chunk_10bin.dat_dcc;
    Study3.dfc_10bin_dat.CAPS{i} = conndat.study{3}.subject{i}.condition{2}.chunk_10bin.dat_dcc;
    Study3.dfc_10bin_dat.QUIN{i} = conndat.study{3}.subject{i}.condition{3}.chunk_10bin.dat_dcc;
    Study3.dfc_10bin_dat.ODOR{i} = conndat.study{3}.subject{i}.condition{4}.chunk_10bin.dat_dcc;
    Study3.pain_10bin_dat.REST{i} = conndat.study{3}.subject{i}.condition{1}.chunk_10bin.y_avoid;
    Study3.pain_10bin_dat.CAPS{i} = conndat.study{3}.subject{i}.condition{2}.chunk_10bin.y_avoid;
    Study3.pain_10bin_dat.QUIN{i} = conndat.study{3}.subject{i}.condition{3}.chunk_10bin.y_avoid;
    Study3.pain_10bin_dat.ODOR{i} = conndat.study{3}.subject{i}.condition{4}.chunk_10bin.y_avoid;
    
    Study3.dfc_5bin_dat.REST{i} = conndat.study{3}.subject{i}.condition{1}.chunk_5bin.dat_dcc;
    Study3.dfc_5bin_dat.CAPS{i} = conndat.study{3}.subject{i}.condition{2}.chunk_5bin.dat_dcc;
    Study3.dfc_5bin_dat.QUIN{i} = conndat.study{3}.subject{i}.condition{3}.chunk_5bin.dat_dcc;
    Study3.dfc_5bin_dat.ODOR{i} = conndat.study{3}.subject{i}.condition{4}.chunk_5bin.dat_dcc;
    Study3.pain_5bin_dat.REST{i} = conndat.study{3}.subject{i}.condition{1}.chunk_5bin.y_avoid;
    Study3.pain_5bin_dat.CAPS{i} = conndat.study{3}.subject{i}.condition{2}.chunk_5bin.y_avoid;
    Study3.pain_5bin_dat.QUIN{i} = conndat.study{3}.subject{i}.condition{3}.chunk_5bin.y_avoid;
    Study3.pain_5bin_dat.ODOR{i} = conndat.study{3}.subject{i}.condition{4}.chunk_5bin.y_avoid;
    
    Study3.dfc_avg_dat.REST{i} = conndat.study{3}.subject{i}.condition{1}.averaged.dat_dcc;
    Study3.dfc_avg_dat.CAPS{i} = conndat.study{3}.subject{i}.condition{2}.averaged.dat_dcc;
    Study3.dfc_avg_dat.QUIN{i} = conndat.study{3}.subject{i}.condition{3}.averaged.dat_dcc;
    Study3.dfc_avg_dat.ODOR{i} = conndat.study{3}.subject{i}.condition{4}.averaged.dat_dcc;
    Study3.pain_avg_dat.REST{i} = conndat.study{3}.subject{i}.condition{1}.averaged.dat_dcc;
    Study3.pain_avg_dat.CAPS{i} = conndat.study{3}.subject{i}.condition{2}.averaged.dat_dcc;
    Study3.pain_avg_dat.QUIN{i} = conndat.study{3}.subject{i}.condition{3}.averaged.dat_dcc;
    Study3.pain_avg_dat.ODOR{i} = conndat.study{3}.subject{i}.condition{4}.averaged.dat_dcc;
end

j = 0;
for i = find(conndat.study{4}.wh_exist(1:70,1))'
    j = j+1;
    Study4.dfc_avg_dat.SBP_SP{j} = conndat.study{4}.subject{i}.condition{1}.averaged.dat_dcc_nan;
    Study4.pain_avg_dat.SBP_SP{j} = conndat.study{4}.subject{i}.condition{1}.averaged.y_vas_nan;
end
j = 0;
for i = find(conndat.study{4}.wh_exist(1:70,2))'
    j = j+1;
    Study4.dfc_avg_dat.SBP_REST{j} = conndat.study{4}.subject{i}.condition{2}.averaged.dat_dcc_nan;
    Study4.pain_avg_dat.SBP_REST{j} = conndat.study{4}.subject{i}.condition{2}.averaged.y_vas_nan;
end

j = 0;
for i = find(conndat.study{4}.wh_exist(97:121,1))'
    j = j+1;
    Study4.dfc_avg_dat.CBP_SP{j} = conndat.study{4}.subject{i+96}.condition{1}.averaged.dat_dcc_nan;
    Study4.pain_avg_dat.CBP_SP{j} = conndat.study{4}.subject{i+96}.condition{1}.averaged.y_vas_nan;
end
j = 0;
for i = find(conndat.study{4}.wh_exist(97:121,2))'
    j = j+1;
    Study4.dfc_avg_dat.CBP_REST{j} = conndat.study{4}.subject{i+96}.condition{2}.averaged.dat_dcc_nan;
    Study4.pain_avg_dat.CBP_REST{j} = conndat.study{4}.subject{i+96}.condition{2}.averaged.y_vas_nan;
end


j = 0;
for i = find(conndat.study{5}.indicator == 2)'
    j = j+1;
    Study5.dfc_avg_dat.JP_CBP{j} = conndat.study{5}.subject{i}.condition{1}.averaged.dat_dcc;
end
j = 0;
for i = find(conndat.study{5}.indicator == 0)'
    j = j+1;
    Study5.dfc_avg_dat.JP_HC{j} = conndat.study{5}.subject{i}.condition{1}.averaged.dat_dcc;
end

j = 0;
for i = find(conndat.study{6}.indicator == 2)'
    j = j+1;
    Study5.dfc_avg_dat.UK_CBP{j} = conndat.study{6}.subject{i}.condition{1}.averaged.dat_dcc;
end
j = 0;
for i = find(conndat.study{6}.indicator == 0)'
    j = j+1;
    Study5.dfc_avg_dat.UK_HC{j} = conndat.study{6}.subject{i}.condition{1}.averaged.dat_dcc;
end