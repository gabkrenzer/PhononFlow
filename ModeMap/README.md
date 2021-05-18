# ModeMap Workflow
## Purpose
This workflow is designed to help you get started, or improve your workflow using ModeMap to analyse potential energy surfaces of phonon modes.

## Requirements
- You must have calculated a converged FORCE_SETS from phonopy previously, see [phonopy](../phonopy) for help.
- You must have `ModeMap.py`, `ExtractTotalEnergies.py`, `ModeMap_PostProcess.py`, and `ModeMap_PolynomialFit.py` in your main directory, see [ModeMap](https://github.com/JMSkelton/ModeMap).

## Usage 
### Mind Map
A typical workflow looks like this:

*Note: for the `--q-range` argument I meant start end **step**, not start end stop*

![](diagramme_modemap.png)
### Scripts
Using the scripts it gives a five step worklow - each step is highlighted on the mind map:
1. `structures.sh` runs `ModeMap.py` for all the MODEs of interest and untar MODEMAP.tar.gz, which contains all the MPOSCARs. 
2. `singlepoint_norun.sh` and `singlepoint_run.sh` distributes all MPOSCARs into single directories with INCAR, KPOINTS, POTCAR, and job script files. I recommend starting with `singlepoint_norun.sh` and then test that calculations are well converged on equilibrium and extreme structures before using `run.sh`, which is specifically designed to run single point calculations for all structures apart from the equilibrium and extreme ones.
3. `energies.sh` runs `ExtractTotalEnergies.py` for all MODEs and cleans irrelevant files from all sub-directories. 
4. `postprocess.sh` runs `ModeMap_PostProcess.py` for all MODEs and creates the directory Results, which stores the potential energy surface for each mode.
5. `fitting.sh` runs `ModeMap_PolyFit.py` for all MODEs.

### Additional Tips
The relationship between Q and displacement depends on the atomic mass. Therefore, keep in mind that a small value for Q might push light atoms very far and give something unphysical, where it would be fine for heavier atoms. 

## INCAR & KPOINTS
For reference, I have also attached typical annotated INCAR and KPOINTS files used for a single point calculation. The most important aspect of the INCAR is `NSW = 0` to avoid relaxing the structure, and `LREAL = .FALSE.` for accurate forces.

## Further Study of Imaginary Modes
- Phonopy can be used to further investigate the bottom well structure of a soft mode, by looking at its symmetry for instance. Simply use the corresponding MPOSCAR. This can shed light on a potential displacive phase transition.
- [ISODISTORT](https://stokes.byu.edu/iso/isodistort.php) can be used to link the top and bottm well structures. You need to convert the corresponding MPOSCARs to .cif files that contain the symmetry elements for each structure. ISODISTORT is a great tool in general to explore the connection between structures.

## Additional Resources
- [Bilbao Crystallographic Server](https://www.cryst.ehu.es/cryst/get_kvec.html) to find k-point coordinates of a given space group. Make sure to use the CDML coefficients, not the ITA coordinates.
- [VESTA](http://jp-minerals.org/vesta/en/) to investigate MPOSCARs and verify that structures make sense and that we have not pushed too far.
- For more on displacive phase transitions, see Martin T. Dove's [Theory of Displacive Phase Transitions in Minerals](https://www.researchgate.net/publication/279592973_Theory_of_Displacive_Phase_Transitions_in_Minerals) (1997).
