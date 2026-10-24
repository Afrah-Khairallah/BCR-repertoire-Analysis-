# Bulk BCR repertoire analysis

Code for processing and analysing bulk B cell receptor repertoire sequencing from 34 FRESH cohort participants. The data comprise 272 libraries: IgG, IgM, Igκ and Igλ, each in two technical replicates.

| | |
|---|---|
| Raw reads | NCBI SRA, BioProject [PRJNA1550093](https://www.ncbi.nlm.nih.gov/bioproject/PRJNA1550093) |
| Annotated AIRR rearrangements | Zenodo, [10.5281/zenodo.23597516](https://doi.org/10.5281/zenodo.23597516) |
| This code | Zenodo, [10.5281/zenodo.23596884](https://doi.org/10.5281/zenodo.23596884) |

## Contents

- `preprocessing/`: pRESTO, IgBLAST and Change-O pipeline (raw reads → AIRR tables)
- `analysis/`: gene usage, SHM, CDR3, clonal analysis and statistics

## Software

pRESTO 0.7.1 · IgBLAST 1.19.0 · IMGT 2023-02-24 · Change-O 1.3.0 · SHazaM 1.3.2 · Alakazam 1.4.3 · TIgGER 1.1.3 · R 4.6.1

## License

MIT
