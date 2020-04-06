#!/bin/bash
#SBATCH --account=cbio
#SBATCH --partition=ada
#SBATCH --nodes=1 --ntasks=40
#SBATCH --time=170:00:00
#SBATCH --job-name="reportgenerator"
#SBATCH --mail-user=javanokendo@gmail.com
#SBATCH --mail-type=END,FAIL


# Path to the executable jar file
peptideShaker=/scratch/oknjav001/bal_mzML_raw_files/searchGUI/peptideShaker/PeptideShaker-1.16.44/PeptideShaker-1.16.44.jar

#Provide the paths to different projects
tideproject=/scratch/oknjav001/bal_mzML_raw_files/searchGUI/GUIResults/firstAnalysis/tideResults/cxpresults/tideresults.cpsx
myrimatchproject=/scratch/oknjav001/bal_mzML_raw_files/searchGUI/GUIResults/firstAnalysis/myrimatchResults/cxspResults/myrmarch.cpsx
cometproject=/scratch/oknjav001/bal_mzML_raw_files/searchGUI/GUIResults/firstAnalysis/cometResults/cxspResults/cometresults.cpsx
tandemproject=/scratch/oknjav001/bal_mzML_raw_files/searchGUI/GUIResults/firstAnalysis/tandemResults/cxpspeprideShakerresults/xtandempeptideshaker.cpsx

#Provide the paths to the output files

comet=/scratch/oknjav001/bal_mzML_raw_files/searchGUI/GUIResults/firstAnalysis/peptideShakeroutput/cometResults
myrimatch=/scratch/oknjav001/bal_mzML_raw_files/searchGUI/GUIResults/firstAnalysis/peptideShakeroutput/myrimatchResults
tandem=/scratch/oknjav001/bal_mzML_raw_files/searchGUI/GUIResults/firstAnalysis/peptideShakeroutput/tandemResults
tide=/scratch/oknjav001/bal_mzML_raw_files/searchGUI/GUIResults/firstAnalysis/peptideShakeroutput/tideResults

# Run the java executables ensuring the paths thi the projects and the output folders are well defined

echo "Report generation is starting"

java -cp $peptideShaker eu.isas.peptideshaker.cmd.ReportCLI -in $tideproject -out_reports $tide -reports "0,1,2,3,4,5,6,7,8,9,10,11"

# Myrimatch

java -cp $peptideShaker eu.isas.peptideshaker.cmd.ReportCLI -in $myrimatchproject -out_reports $myrimatch -reports "0,1,2,3,4,5,6,7,8,9,10,11"

# comet

java -cp $peptideShaker eu.isas.peptideshaker.cmd.ReportCLI -in $cometproject -out_reports $comet -reports "0,1,2,3,4,5,6,7,8,9,10,11"

# tandem
java -cp $peptideShaker eu.isas.peptideshaker.cmd.ReportCLI -in $tandemproject -out_reports $tandem -reports "0,1,2,3,4,5,6,7,8,9,10,11"

echo "The analysis is done, you may have a look at the respective output directories"
