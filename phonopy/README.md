# Phonopy Workflow
## Purpose
This workflow is designed to help you get started, or improve your workflow using phonopy to calculate a number of exciting properties.

## Requirements
- You must have previously performed geometry optimisation on your structure. 

## Usage 
### Mind Map
A typical workflow looks like this:
PICTURE
### Scripts
There are only two scripts needed for this workflow since most of it can be run from the command line:
- fd.sh distributes all POSCAR-XXX into single XXX directories with INCAR, KPOINTS, POTCAR, and job script files. I would recommend testing convergence on one structure first and then proceed with all the other ones.
- clean_ph.sh simply clean irrelevant files from all sub-directories.

## INCAR & KPOINTS
For reference, I have also attached typical annotated INCAR and KPOINTS files used for a single point calculation. The most important aspect of the INCAR is `NSW = 0` to avoid relaxing the structure.

## Additional Resources
