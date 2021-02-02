# Phonopy-qha Workflow

## Purpose
This workflow is designed to help you get started, or improve your workflow using phonopy-qha, the quasi-harmonic version of phonopy. Phonopy-qha takes into account volume expansion effects due to temperature by performing phonopy harmonic calculations at different volumes. This way, you can calculate phonon properties at different non-zero temperatures.

## Requirements
You should already be confident in using the [phonopy workflow](https://github.com/gabkrenzer/PhononFlow/tree/master/phonopy). 

## Usage 
### Mind Map
A typical workflow looks like this:

![](diagramme_phonopy.png)

Please go to https://phonopy.github.io/phonopy/qha.html for more support.

### Scripts


## INCAR & KPOINTS
For reference, I have also attached typical annotated INCAR and KPOINTS files used for a single point calculation. The most important aspects of the INCAR are `IBRION = -1` to avoid relaxing the structure, and `LREAL = .FALSE.` for accurate forces.

## Additional Resources
- A comprehensive list of all phonopy setting tags: https://phonopy.github.io/phonopy/setting-tags.html.
- A comprehensive list of all phonopy command line options: https://phonopy.github.io/phonopy/command-options.html.
