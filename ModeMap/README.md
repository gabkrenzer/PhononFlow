# ModeMap Workflow

## Requirements
- You must have calculated FORCE_SETS from phonopy previously, see [phonopy](../phonopy) for help.
- You must have `ModeMap.py`, `ExtractTotalEnergies.py`, `ModeMap_PostProcess.py`, and `ModeMap_PolynomialFit.py` in your main directory, see [ModeMap](https://github.com/JMSkelton/ModeMap).

## Usage 
A typical workflow looks like this:
PICTURE

## Scripts
Using the scripts it gives a five step worklow:
1. `structures.sh` runs `ModeMap.py` for all the MODEs of interest and untar MODEMAP.tar.gz, which contains all the MPOSCARs.
2. `singlepoint_norun.sh` and `singlepoint_run.sh` distributes all MPOSCARs into single directories with INCAR, KPOINTS, POTCAR, and job script files. I recommend starting with `singlepoint_norun.sh` and then test that calculations are well converged before using `singlepoint_run.sh`.
3. `energies.sh` runs `ExtractTotalEnergies.py` for all MODEs and clean irrelevant files from all sub-directories. 
4. `postprocess.sh` runs `ModeMap_PostProcess.py` for all MODEs and creates the directory Results, which stores the potential energy surface for each mode.
5. `fitting.sh` runs `ModeMap_PolyFit.py` for all MODEs.

## INCAR & KPOINTS
For reference, I have also attached typical INCAR and KPOINTS files used for a single point calculation. The most important aspect of the INCAR is `NSW = 0` to avoid relaxing the structure.
