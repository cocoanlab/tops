# Tonic pain signature (ToPS)


Citation: Jae-Joong Lee, Hong Ji Kim, Marta Ceko, Bo-yong Park, Soo Ahn Lee, Hyunjin Park, Mathieu Roy, Seong-Gi Kim, Tor D. Wager\*, Choong-Wan Woo\*, A neuroimaging biomarker for sustained experimental and clinical pain, In press, _Nature Medicine_ (the manuscript is not available yet)


## Background

We recently developed a neuroimaging signature for sustained experimental pain, which showed its generalizability to clinical pain. 

A few important study findings:

- The Tonic Pain Signature (named ToPS for the purpose of reuse) was highly predictive of dynamic changes in pain ratings across three independent datasets (within-individual prediction r = 0.47-0.64). Based on Studies 1-3 _n_ = 109.
- The ToPS correctly discriminated tonic pain from other non-painful aversive conditions, including bitter taste and aversive odor (76-85% accuracy), providing evidence for its specificity. Based on Studies 2-3, _n_ = 90.
- The ToPS predicted overall pain severity in two different clinical pain conditions, i.e., subacute and chronic back pain (r = 0.56-0.57 depending on the task types) and accurately discriminated chronic back pain patients from healthy controls (71-73% accuracy). Based on Studies 4-5, _n_ = 192.
- When we compared predictive brain connectivity patterns across tonic, clinical, and phasic pain (Study 6, _n_ = 33), tonic experimental and clinical pain models were similar, particularly in somatomotor, frontoparietal, and dorsal attention networks. 

This study reveals a unique functional architecture for sustained, ongoing pain, and provides a brain-based biomarker predictive of tonic pain intensity. This biomarker has the potential to be used in clinical settings to characterize pain experience-related brain activity in patients and treatment response. 

<br>

## Downloads

This page is for sharing the data, codes, supplemental materials, and the model with researchers and laboratories around the world. We support the open science and thus would love to help other researchers and laboratories to apply and test our model on their datasets.

1) **ToPS**: The model will be shared via a Material Transfer Agreement only for the scientific research purpose. We're currently working on making the Material Transfer Agreement form, which will be make available soon (upon publication)

2) **Codes and Data**: The tutorial codes are available at the following github [repository](https://github.com/cocoanlab/tops), and the data are available at the following [figshare](https://figshare.com/articles/dataset/data_zip/13082519) page

3) **ToPS atlas**: We generated a functional connectivity atlas book using the ToPS model weights, which will be available upon publication.

<br>

## Dependencies

1. Please download the compressed zip file ('data.zip') that contains all the associated data ([link](https://figshare.com/articles/dataset/data_zip/13082519)), and un-zip the file into the 'tops' folder (path: /tops/data).

2. For running 'example_participant_script.m', [FSL](https://fsl.fmrib.ox.ac.uk/fsl/fslwiki) must be installed.

3. For running 'example_participant_script.m' and 'whole_participant_script.m', you should first download the 'ToPS_weight.mat' file (please send a request mail as described above to get this file) and locate the file in the 'model' folder (path: /tops/model/ToPS_weight.mat).

<br>

## Questions?

If you have any questions, please email [Wani](mailto:choongwan.woo@gmail.com)

<br>

## Funding information

This work has been supported by 

Choong-Wan Woo

- IBS-R015-D1 (Institute for Basic Science)
- 2019R1C1C1004512 (National Research Foundation of Korea)
- 18-BR-03 (Ministry of Science and ICT, Korea)
- 2019-0-01367-BabyMind (Ministry of Science and ICT, Korea)

Tor D. Wager

- R01DA035484 (NIDA)
- R01MH076136 (NIMH)

Jae-Joong Lee

- 2018H1A2A1059844 (National Research Foundation of Korea)
