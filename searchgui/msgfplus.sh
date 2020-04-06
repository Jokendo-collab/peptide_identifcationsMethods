#!/bin/bash
#SBATCH --account=cbio
#SBATCH --partition=ada
#SBATCH --nodes=1 --ntasks=40
#SBATCH --time=170:00:00
#SBATCH --job-name="msgfsearchGUI"
#SBATCH --mail-user=oknjav001@myuct.ac.za
#SBATCH --mail-type=END,FAIL

#Set global aths to varios executables and the outputdirs
searchGUI=/scratch/oknjav001/bal_mzML_raw_files/searchGUI/SearchGUI-3.3.17/SearchGUI-3.3.17.jar
param=/scratch/oknjav001/bal_mzML_raw_files/searchGUI/SearchGUI-3.3.17/searchGUIAnalysis/msgfparams.par
results=/scratch/oknjav001/bal_mzML_raw_files/searchGUI/msgfresults
mgf=/scratch/oknjav001/bal_mzML_raw_files/searchGUI/mgfSearchGUI

tempdir=/scratch/oknjav001/bal_mzML_raw_files/searchGUI/msgfresults/tempdir

#Optional advanced parameters
xtandem_folder=/scratch/oknjav001/bal_mzML_raw_files/searchGUI/SearchGUI-3.3.17/resources/XTandem/linux/linux_64bit
myrimatch_folder=/scratch/oknjav001/bal_mzML_raw_files/searchGUI/SearchGUI-3.3.17/resources/MyriMatch/linux/linux_64bit
ms_amanda_folder=/scratch/oknjav001/bal_mzML_raw_files/searchGUI/SearchGUI-3.3.17/resources/ms_Amanda/linux
msgf_folder=/scratch/oknjav001/bal_mzML_raw_files/searchGUI/SearchGUI-3.3.17/resources/ms-gf+
omssa_folder=/scratch/oknjav001/bal_mzML_raw_files/searchGUI/SearchGUI-3.3.17/resources/OMSSA/linux
comet_folder=/scratch/oknjav001/bal_mzML_raw_files/searchGUI/SearchGUI-3.3.17/resources/Comet/linux
tide_folder=/scratch/oknjav001/bal_mzML_raw_files/searchGUI/SearchGUI-3.3.17/resources/Tide/linux/linux_64bit
novor_folder=/scratch/oknjav001/bal_mzML_raw_files/searchGUI/SearchGUI-3.3.17/resources/Novor 
directag_folder=/scratch/oknjav001/bal_mzML_raw_files/searchGUI/SearchGUI-3.3.17/resources/DirecTag/linux/linux_64bit
makeblastdb_folder=/scratch/oknjav001/bal_mzML_raw_files/searchGUI/SearchGUI-3.3.17/resources/makeblastdb/linux/linux_64bit
logfiles=/scratch/oknjav001/bal_mzML_raw_files/searchGUI/msgfresults/logfile

#Execute the searchGUI program
java -cp ${searchGUI} eu.isas.searchgui.cmd.SearchCLI --spectrum_files ${mgf} -output_folder ${results} -id_params ${param} -xtandem 0 -myrimatch 0 -ms_amanda 1 -msgf 1 -omssa 0 -comet 0 -tide 0 -andromeda 0 -novor 0 -directag 0 -xtandem_folder $xtandem_folder -myrimatch_folder $myrimatch_folder -ms_amanda_folder $ms_amanda_folder -msgf_folder $msgf_folder -omssa_folder $omssa_folder -comet_folder $comet_folder -tide_folder $tide_folder -novor_folder $novor_folder -directag_folder $directag_folder -makeblastdb_folder $makeblastdb_folder -output_option 2 -output_date 1 -temp_folder $tempdir -log $logfiles

