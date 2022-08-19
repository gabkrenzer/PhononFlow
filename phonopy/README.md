# Phonopy Workflow
## Purpose
This workflow is designed to help you get started, or improve your workflow using phonopy to calculate a number of exciting properties. This workflow uses a finite difference approach. I have ignored the Density Functional Perturbation Theory approach but more details can be found here: https://phonopy.github.io/phonopy/vasp-dfpt.html.

## Requirements
You must have previously performed convergence tests on your parameters and a geometry optimisation on your structure. 

## Usage 
### Mind Map
A typical workflow looks like this:

![](diagramme_phonopy.png)

Please go to https://phonopy.github.io/phonopy/vasp.html for more support.

### Scripts
There are only one script needed for this workflow since most of it can be run from the command line:
- `fd.sh` distributes all POSCAR-XXX into single XXX directories with INCAR, KPOINTS, POTCAR, and job script files. I would recommend testing convergence on one structure first and then proceed with all the other ones.

## INCAR & KPOINTS
For reference, typical annotated INCAR and KPOINTS files used for a single point calculation are attached. The most important aspects of the INCAR are `IBRION = -1` to avoid relaxing the structure, and `LREAL = .FALSE.` for accurate forces.

## BORN effective charges
Born effective charges describe the electrical polarization induced by the displacement of individual atomic sublattices. They can have a significant impact on phonon properties, such as LO/TO splitting. They can be calculated using the `INCAR_born` file together with standard input files. Converging Born effective charges typically requires a denser k-point mesh. Typically, a two times increase in all direction is good enough, but good practice involves checking Born effective charges convergence with respect to k-point sampling.  

Once the calculation is finished, run `phonopy-vasp-born` in your working directory and copy and paste the obtained Born effective charges and dielectric constants into a `BORN` file. Non-analytical term corrections are then calculated in the post-processing (band structure calculation, etc...). 

## Additional Resources
- [SUMO](https://github.com/ajjackson/sumo) to plot phonon dispersions and density of states.
- [ASCII-Phonons](https://github.com/ajjackson/ascii-phonons) for animations.
- A comprehensive list of all phonopy setting tags: https://phonopy.github.io/phonopy/setting-tags.html.
- A comprehensive list of all phonopy command line options: https://phonopy.github.io/phonopy/command-options.html.
