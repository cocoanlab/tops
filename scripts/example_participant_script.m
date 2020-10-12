basedir = '/Users/jaejoonglee/github/cocoanlab/tops';

addpath(genpath(fullfile(basedir, 'functions')));

n_run = 2;
n_bin = 5;
atlas_img = fullfile(basedir, 'data/atlas/Fan_et_al_atlas_r279_MNI_3mm.nii');
fmri_imgs{1} = fullfile(basedir, 'data/example_participant/fMRI/example_preprocessed_fMRI_task-REST.nii.gz');
fmri_imgs{2} = fullfile(basedir, 'data/example_participant/fMRI/example_preprocessed_fMRI_task-CAPS.nii.gz');
roi_meants{1} = fullfile(basedir, 'data/example_participant/ROI/example_ROI_mean_timeseries_task-REST.mat');
roi_meants{2} = fullfile(basedir, 'data/example_participant/ROI/example_ROI_mean_timeseries_task-CAPS.mat');
dfc_binned{1} = fullfile(basedir, 'data/example_participant/FC/example_dFC_binned_task-REST.mat');
dfc_binned{2} = fullfile(basedir, 'data/example_participant/FC/example_dFC_binned_task-CAPS.mat');
pain_rating{1} = fullfile(basedir, 'data/example_participant/pain_rating/example_pain_rating_task-REST.mat');
pain_rating{2} = fullfile(basedir, 'data/example_participant/pain_rating/example_pain_rating_task-CAPS.mat');
load(fullfile(basedir, 'model/ToPS_weight.mat'), 'ToPS_w');
fsl_env_cmd = 'FSLDIR=/usr/local/fsl; . ${FSLDIR}/etc/fslconf/fsl.sh; PATH=${FSLDIR}/bin:${PATH};';

for img_i = 1:n_run
    fsl_cmd = sprintf('fslmeants -i %s --label=%s -o %s', fmri_imgs{img_i}, atlas_img, roi_meants{img_i});
    system([fsl_env_cmd ';' fsl_cmd]);
    roi_meants_dat = load(roi_meants{img_i}, '-ASCII');
    dfc_dat = DCC_jj(roi_meants_dat, 'simple', 'whiten'); % Intel Xeon E5, 3GHz, single core : roughly 1 hour per image
    dfc_binned_dat = zeros(size(dfc_dat,1), n_bin);
    for div_i = 1:n_bin
        div_range = ceil(size(dfc_dat,2) / n_bin * (div_i-1) + 1) : ceil(size(dfc_dat,2) / n_bin * div_i);
        dfc_binned_dat(:,div_i) = mean(dfc_dat(:,div_range), 2);
    end
    save(dfc_binned{img_i}, 'dfc_binned_dat');
    tops_score{img_i} = sum(dfc_binned_dat .* ToPS_w, 'omitnan')';
    load(pain_rating{img_i}, 'pain_rating_dat')
    pain_rating_all{img_i} = pain_rating_dat;
end

figure;
yyaxis left;
plot(cat(1, pain_rating_all{:}), '-o', 'linewidth', 1.5);
ylabel('pain rating');
yyaxis right;
plot(cat(1, tops_score{:}), '-o', 'linewidth', 1.5);
ylabel('ToPS score');
xlabel('time bin');
set(gca, 'tickdir', 'out', 'fontsize', 14);
set(gcf, 'color', 'w');

