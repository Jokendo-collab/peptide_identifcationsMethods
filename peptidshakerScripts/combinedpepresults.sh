#!/bin/bash
#SBATCH --account=cbio
#SBATCH --partition=ada
#SBATCH --nodes=1 --ntasks=40
#SBATCH --time=170:00:00
#SBATCH --job-name="combinedPeptideShaker"
#SBATCH --mail-user=javanokendo@gmail.com
#SBATCH --mail-type=END,FAIL

#set the global paths for the executable jar file and the output folders
peptideShaker=/scratch/oknjav001/bal_mzML_raw_files/searchGUI/peptideShaker/PeptideShaker-1.16.44/PeptideShaker-1.16.44.jar
spectrumfiles=/scratch/oknjav001/bal_mzML_raw_files/searchGUI/mgfSearchGUI
identificationfiles=/scratch/oknjav001/bal_mzML_raw_files/searchGUI/GUIResults/firstAnalysis/combinedSearchGUIresults
paramfile=/scratch/oknjav001/bal_mzML_raw_files/searchGUI/peptideShaker/parameterFile/searchGUIParamaterFile.par
results=/scratch/oknjav001/bal_mzML_raw_files/searchGUI/GUIResults/firstAnalysis/combinedSearchGUIresults/combined_results.cpsx

# 1. X!tandem analysis results
java -cp ${peptideShaker} eu.isas.peptideshaker.cmd.PeptideShakerCLI -experiment cometProteinID -sample combinedData -replicate 27 -identification_files $identificationfiles -spectrum_files $spectrumfiles -id_params $paramfile -out $results

