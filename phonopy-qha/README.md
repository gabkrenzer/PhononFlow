# Phonopy-qha Workflow

## Purpose
This workflow is designed to help you get started, or improve your workflow using phonopy-qha, the quasi-harmonic version of phonopy. Phonopy-qha takes into account volume expansion effects due to temperature by calculating thermal properties at different volumes from phonopy harmonic calculations. From this, more accurate temperature-dependent properties can be calculated versus temperature: volume, thermal expansion coefficient, bulk modulus, heat capacity, Gr\"uneisen parameter, phonon dispersion...

To illustrate this a little bit more, I have attached graphical representations of quantities obtained using phonopy and the quasi-harmonic approximation for Li3N. On the left, the free energy, _F(V, T)_, is approximated as the sum of the electronic internal energy, _Uel(V)_, and the phonon Helmholtz free energy, _F_ph(V, T)_. _U_el(V)_ is obtained from first principles electronic structure calculations at different volumes, _V_ , and _Fph(V, T)_ is obtained from first principles lattice dynamics calculations at different _V_ and temperatures, _T_. _F(V, T)_ is plotted against volume for different temperatures from 0K to 690K in six steps of 100K and a final one of 90 K. The line connects
the lowest energy points at each temperature. This way, we are able to find the equilibrium volume at each temperature, which is shown on the right.
![](QHA.pdf)

## Requirements
You must have previously performed convergence tests on your parameters and a geometry optimisation on your structure. You should also be confident in using the [phonopy workflow](https://github.com/gabkrenzer/PhononFlow/tree/master/phonopy). 

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
