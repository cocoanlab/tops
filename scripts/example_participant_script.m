% A neuroimaging biomarker for sustained experimental and clinical pain
% Chapter 1. Applying ToPS onto an example participant's fMRI data

%% Step 1. Extract mean ROI timeseries from fully preprocessed fMRI data using 279-region Brainnetome atlas.

basedir = '/Users/jaejoonglee/github/cocoanlab/tops'; % Check this path!
addpath(genpath(fullfile(basedir, 'functions')));

fmri_imgs{1} = fullfile(basedir, 'data/example_participant/fMRI/example_preprocessed_fMRI_task-REST.nii.gz');
fmri_imgs{2} = fullfile(basedir, 'data/example_participant/fMRI/example_preprocessed_fMRI_task-CAPS.nii.gz');
n_run = numel(fmri_imgs);
atlas_img = fullfile(basedir, 'data/atlas/Fan_et_al_atlas_r279_MNI_3mm.nii');
fsl_env_cmd = 'FSLDIR=/usr/local/fsl; . ${FSLDIR}/etc/fslconf/fsl.sh; PATH=${FSLDIR}/bin:${PATH};';
roi_meants{1} = fullfile(basedir, 'data/example_participant/ROI/example_ROI_mean_timeseries_task-REST.mat');
roi_meants{2} = fullfile(basedir, 'data/example_participant/ROI/example_ROI_mean_timeseries_task-CAPS.mat');

for img_i = 1:n_run
    fsl_cmd = sprintf('fslmeants -v -i %s --label=%s -o %s', fmri_imgs{img_i}, atlas_img, roi_meants{img_i});
    fprintf('Running FSL command: [ %s ]\n', fsl_cmd);
    system([fsl_env_cmd ' ' fsl_cmd]);
end

for img_i = 1:n_run
    roi_meants_dat{img_i} = load(roi_meants{img_i}, '-ASCII');
end

%% Step 2. Calculate dynamic functional connectivity using Dynamic Conditional Correlation (DCC) method.

for img_i = 1:n_run
    fprintf('Working on DCC: Image %d ...\n', img_i);
    dfc_dat{img_i} = DCC_jj(roi_meants_dat{img_i}, 'simple', 'whiten');
end

n_bin = 5;
dfc_binned{1} = fullfile(basedir, 'data/example_participant/FC/example_dFC_binned_task-REST.mat');
dfc_binned{2} = fullfile(basedir, 'data/example_participant/FC/example_dFC_binned_task-CAPS.mat');

for img_i = 1:n_run
    dfc_binned_dat = zeros(size(dfc_dat{img_i},1), n_bin);
    for div_i = 1:n_bin
        div_range = ceil(size(dfc_dat{img_i},2) / n_bin * (div_i-1) + 1) : ceil(size(dfc_dat{img_i},2) / n_bin * div_i);
        dfc_binned_dat(:,div_i) = mean(dfc_dat{img_i}(:,div_range), 2);
    end
    save(dfc_binned{img_i}, 'dfc_binned_dat');
end

%% Step 3. Apply ToPS onto the DCC data and compare the calculated ToPS scores and actual pain ratings.

load(fullfile(basedir, 'model/ToPS_weight.mat'), 'ToPS_w');
for img_i = 1:n_run
    load(dfc_binned{img_i}, 'dfc_binned_dat');
    tops_score{img_i} = sum(dfc_binned_dat .* ToPS_w, 'omitnan')';
end

pain_rating{1} = fullfile(basedir, 'data/example_participant/pain_rating/example_pain_rating_task-REST.mat');
pain_rating{2} = fullfile(basedir, 'data/example_participant/pain_rating/example_pain_rating_task-CAPS.mat');
for img_i = 1:n_run
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
