# pbp_connectagen

A wrapper for the PBP-prediction from [Pathogenwatch](https://pathogen.watch/) service.

The code is based on the reference code from the repository [SPN-Resistance_Sanger](https://github.com/BenJamesMetcalf/SPN-Resistance_Sanger) from BenJamesMetcalf on GitHub.
All original algorithmic PBP identification is not my work. This is only a wrapper to easily get prediction results on a local setting.

The machine learning model is described in [Li et al.(2016)](https://pubmed.ncbi.nlm.nih.gov/27302760/), as also written in the [wiki page](https://cgps.gitbook.io/pathogenwatch/technical-descriptions/antimicrobial-resistance-prediction/spn-pbp-amr) of the [Pathogenwatch](https://pathogen.watch/) service.

## Getting Started

First clone the repository using the command

```bash
$ git clone git@github.com:EspressoTonic/pbp_connectagen.git
```

To use the program, simple use

```bash
$ bash cnpbp.sh -s <Path/To/Sample/Contig/File> -n <Sample> -o <Directory/Path/To/Result/File>
```

**WARNING: The program temporarily creates and deletes all intermediate files saved in ```<$outdir>/workdir```. Be careful not to have the directory ```workdir``` in the ```$outdir``` before running the algorithm**

The result file will be saved at ```<$outdir>/<$Sample>_final_result.tsv```.

An example output looks like this:

```text
>PBP_Category   Type
1A      15
2B      11
2X      16
>Agent  Predicted_MIC   Inferred_phenotype(non/meningitis)
Amoxicilin      =8      R
Ceftriaxone     =1      S\I
Cefotaxime      =2      I\R
Cefuroxime      >2      R
Meropenem       =1      R
Penicililn      =4      I\R
```
Under the ```PBP_CATEGORY``` and ```Type``` column, the identified PBP type according to [Pathogenwatch](https://pathogen.watch/) developers is shown. 

Under the ```Agent```, ``` Predicted_NIC``` and ```Inferred_phenotype``` column, the predicted MICs are shown. 

Refer to the following table for result description

| Inferred phenotype | Description  |
|--------------------|--------------|
| R                  | Resistant    |
| S                  | Sensitive    |
| I                  | Intermediate |