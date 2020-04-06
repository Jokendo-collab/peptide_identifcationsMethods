#!/bin/bash
#SBATCH --account=cbio
#SBATCH --partition=ada
#SBATCH --nodes=1 --ntasks=40
#SBATCH --time=170:00:00
#SBATCH --job-name="peptideshaker"
#SBATCH --mail-user=javanokendo@gmail.com
#SBATCH --mail-type=END,FAIL

#set the global paths for the executable jar file and the output folders
peptideShaker=/scratch/oknjav001/bal_mzML_raw_files/searchGUI/peptideShaker/PeptideShaker-1.16.44/PeptideShaker-1.16.44.jar
spectrumfiles=/scratch/oknjav001/bal_mzML_raw_files/searchGUI/mgfSearchGUI
identificationfiles=/scratch/oknjav001/bal_mzML_raw_files/searchGUI/GUIResults/firstAnalysis/tandemResults
paramfile=/scratch/oknjav001/bal_mzML_raw_files/searchGUI/peptideShaker/parameterFile/searchGUIParamaterFile.par
results1=/scratch/oknjav001/bal_mzML_raw_files/searchGUI/GUIResults/firstAnalysis/tandemResults/cxpspeprideShakerresults/xtandempeptideshaker.cpsx

# 1. X!tandem analysis results
java -cp ${peptideShaker} eu.isas.peptideshaker.cmd.PeptideShakerCLI -experiment cometProteinID -sample balfluid -replicate 27 -identification_files $identificationfiles -spectrum_files $spectrumfiles -id_params $paramfile -out $results1


# 2. Tide results analysis
spectrumfiles=/scratch/oknjav001/bal_mzML_raw_files/searchGUI/mgfSearchGUI
tideresults=/scratch/oknjav001/bal_mzML_raw_files/searchGUI/GUIResults/firstAnalysis/tideResults
paramfile=/scratch/oknjav001/bal_mzML_raw_files/searchGUI/peptideShaker/parameterFile/searchGUIParamaterFile.par
results2=/scratch/oknjav001/bal_mzML_raw_files/searchGUI/GUIResults/firstAnalysis/tideResults/cxpresults/tideresults.cpsx

java -cp ${peptideShaker} eu.isas.peptideshaker.cmd.PeptideShakerCLI -experiment cometProteinID -sample balfluid -replicate 27 -identification_files $tideresults -spectrum_files $spectrumfiles -id_params $paramfile -out $results2

# 3. Myrimatch

spectrumfiles=/scratch/oknjav001/bal_mzML_raw_files/searchGUI/mgfSearchGUI
myrimatch=/scratch/oknjav001/bal_mzML_raw_files/searchGUI/GUIResults/firstAnalysis/myrimatchResults
paramfile=/scratch/oknjav001/bal_mzML_raw_files/searchGUI/peptideShaker/parameterFile/searchGUIParamaterFile.par
results3=/scratch/oknjav001/bal_mzML_raw_files/searchGUI/GUIResults/firstAnalysis/myrimatchResults/cxspResults/myrmarch.cpsx

java -cp ${peptideShaker} eu.isas.peptideshaker.cmd.PeptideShakerCLI -experiment cometProteinID -sample balfluid -replicate 27 -identification_files $myrimatch -spectrum_files $spectrumfiles -id_params $paramfile -out $results3

# 4. Comet 

spectrumfiles=/scratch/oknjav001/bal_mzML_raw_files/searchGUI/mgfSearchGUI
comet=/scratch/oknjav001/bal_mzML_raw_files/searchGUI/GUIResults/firstAnalysis/cometResults
paramfile=/scratch/oknjav001/bal_mzML_raw_files/searchGUI/peptideShaker/parameterFile/searchGUIParamaterFile.par
results4=/scratch/oknjav001/bal_mzML_raw_files/searchGUI/GUIResults/firstAnalysis/cometResults/cxspResults/cometresults.cpsx

java -cp ${peptideShaker} eu.isas.peptideshaker.cmd.PeptideShakerCLI -experiment cometProteinID -sample balfluid -replicate 27 -identification_files $myrimatch -spectrum_files $spectrumfiles -id_params $paramfile -out $results4























