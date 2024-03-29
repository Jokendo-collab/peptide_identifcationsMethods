# Comparison of different search engines for the identification of proteins in complex clinical samples
#### Javan Okendo

#### 1. Department of Integrative Biomedical Sciences, Chemical and Systems Biology, University of Cape Town, South Africa
#### 2. Department of Integrative Biomedical Sciences, Computational Biology and Bioinformatics, University of Cape Town, South Africa
---
### Abstract
Search engines forms a crucial and a very important step in the analysis of shotgun proteomics data. These algorithms  attemps to identify peptide sequences from the parent molecular ion which produce them and match them to the theoretical databases. There are different flavours of search engines, both open source and commercial and they both use different scoring functions for specrum identification. The peptide identifications from these set of search engines differ significantly, with individual search engines giving a different set of correcly identified peptides and proteins. This has made it difficult to standardize the proteomics data analysis workflows and the combination of results from different search engines is gaining momentum in the proteomics community. Here we compared different search engines peptide identification rates that are currently being used in the community and we concluded that sequest outperfoms the other search engines but maxquant still remain the most preferred search engine because it is having a simple GUI making it easy to use. 

### Background  
* Unbiased comparisons between search programs to determine which performs best are challenging. Currently there is no standard database search engine that is accepted universally within the proteomics community. The HUPO-PSI has made some recommendations which are today used as standards in the proteomics comminity. The standards includes the use of mzML as a standard file format for the spectral data and many if not all search engines have been udated to take mzML file formats for the database search. This gains are timely but more work is still needed to be done in the standardization of the proteomics data processing and and downstream analysis. 
* Some search parameters should be matched and others can invalidate comparisons if they are matched. This has resulted in consistency making the comparison of different database search engines a great challenge.
* Consistent data processing is essential. This will enable ease of comparison of different results from different studies of core facilities

### Overview:  
- The MSconvert was used in the conversion of the .raw files to mzML file f
- Search parameter space systematically explored for [MSfragger](https://www.nature.com/articles/nmeth.4256), V.2.3, [MS-GF+](https://www.nature.com/articles/ncomms6277),[comet](https://www.ncbi.nlm.nih.gov/pubmed/23148064), [Tide_search](http://dx.doi.org/10.1021/pr101196n) which is an impementation of the SEQUEST database search engine. The comet and the tide search were implemented as a wrpper function from [crux](http://crux.ms/index.html). The widely used [Maxquant](https://www.ncbi.nlm.nih.gov/pubmed/27809316) was also used in this analysis.
- Biological datasets from Bronchoalveolar lavage fluid ATSjournals [Malika et al. (2019)](https://www.ncbi.nlm.nih.gov/pubmed/31860339) was used in this analysis.
- Target/decoy databases were used to set common FDR thresholds in each of the searches.
- Consistent processing eliminated biases.This was achieved by matching the following:
protein database (Human uniprot database), Enzymatic cleavages,Fixed and variable modifications ( Cystein was a fixed modification and Methyined was used and a variable modification)
Parent ion mass type and Parent ion mass tolerance
- The number of matches given identical sets of spectra and identical sets of theoretical peptides at a given peptide error rate could be determined for MSfragger, Maxquant, MS-GF+, Comet, Tide_search.

---
### Experimental design
We used data from from a Human Lung-oriented Approach to the Correlates of Risk in Tuberculosis- The TB-HART study(Human Lung Lung-Approach for Correlates of Risk in TB) for details see the publication by [Malika et al. (2019)](https://www.ncbi.nlm.nih.gov/pubmed/31860339) publication. We had a broad spectrum of TB patients which were divided into four different phenotypes (previous TB,recurrent TB, Latent TB and sterilizing immunizers) based on the clinical classification of TB patients. The bronchscopy was then done and the live BCG and purified protein derivatives (PPD) were instilled into the human lungs and after 72 hours the BALF was harvested and used to do proteomic, transcriptomic and immunology assays. We perfomed open search, and label free quantification comparisons using MSfragger,MS-GF+,Comet, Tide_search and Maxquant database search engines). For identification, we estimated the false-discovery rate (FDR) using the target-decoy based approach (ref).

![Experimental design](https://github.com/javanOkendo/peptide_identifcationsMethods/blob/master/studyDesign/Slide1.PNG)
>Malika *et al* 2019 
---
### Data processing workflow
Conversion to common file formats at beginning of pipeline ensured consistent data processing for all comparisons. All the MS/MS raw files from the Q-Exacurtive were converted to mzML using MSconvert, HUPO standard file format for the raw data files.
Human protein database consisting of the reviewed human protein only (downloaded 2020-03-12 from UniProt; 149672 protein entiries including decoy sequences and 115 common contaminans protein sequences) was used in the database search. For Msfragger [ref], the decoy sequences were generated and appended to the originally downloaded human uniprot database. MS-GF+ [ref] automatically generated index databases with the reverse sequences which was used in the search. Maxquant software only needs the target human protein sequences. Tide_search [ref] and comet [ref] also needs the human database with the decoys sequences and common contaminants. Semi-tryptic cleavage specificity was applied, along with variable methionine oxidation, variable protein N-terminal acetylation, and fixed carbamidomethyl cysteine modifications. The allowed peptide length and mass ranges were 7-50 residues and 500-5000 Da, respectively. These parameters were matched to ensure consitent data analysis. For MSFragger searches, peptide sequence identification was performed with version 2.3 and FragPipe version 12.1 with mass calibration and parameter optimization enabled. PeptideProphet and ProteinProphet in Philosopher (version 2.0.0) were used to filter all of peptide-spectrum matches (PSMs), peptides, and proteins to 1% PSM and 1% FDR. Maxquant version 1,6,10,43 was used in the analysis. The PSMs and peptides were filtered at 0,01 PSM FDR and the protein groups were filtred to 0,01 protein FDR and for this the default settings were used. The Comet [ref] and the Tide_search [ref] use percolator which was used in the inference of the proteins and Peptides wich gives the xcorr values the PSM FDR values of 0,01 was applied. MS-GF+ [ref], we also used the FDR of 0,01 was used to filter the identified proteins and peptides.

### Open search parameters
Precursor mass tolerance was set from -150 to +500 Da, and precursor true tolerance and fragment mass tolerance were set to 20 ppm. Mass calibration and parameter optimization were enabled. Two missed cleavages were allowed, and the number of enzymatic termini was set to two. Isotope error was set to 0. The minimum number of fragment peaks required to include a PSM in modelling was set to two, and the minimum number required to report the match was four. A minimum of 15 fragment peaks and the top 100 most intense peaks were used as initial settings.

---
### Results table
|Comet         | MSfragger     | Andromeda    | Myrimatch    | MS-GF+      | InsPect  |
|------------- | ------------- | ------------ | --------| ------------|----------|
|2002 px       | 1927 px       | 2047 Px      | 1913| 2416 px     |2709 Px   |
|19238 pep     | 18411 peptides| 18574      | 17741| 25040 pep   |14365 pep |

> Table 1: The database search results from different sequence search engines
---
**Parent ion mass tolerance and other search space parameters should be matched.**  We noted that some search engine parameters are operational but other parameters affect scoring functions significanctly. Remaining parameters determine the number of theoretical peptides (search space) scored during searches. Examples of these parameters include protein database used (must be for the same organism and the same version with the same number of protein entries), enzymatic cleavage, fixed and variable modifications, parent ion mass type and parent ion mass tolerance. These parameters should were matched between search engines to ensure unbiased comparisons. *Shown above are several parent ion mass tolerances (fragment ion tolerances were search engine default values). Parent ion mass tolerance optimum was independent of search program.

---
![Cluster Analysis results](https://github.com/javanOkendo/peptide_identifcationsMethods/blob/master/studyDesign/Slide2.PNG)
---
**SEQUEST outperformed Mascot and X!Tandem.**  Parent ion monoisotopic mass tolerance of 4.0 Da was used. X!Tandem uses monoisotopic parent ion masses. Mascot requires the same  parent ion and fragment ion mass types. Optimum fragment ion tolerances were used for each search engine. X!Tandem dynamic ranges of 250 (LCQ) or 500 (LTQ) and 75 peaks improved IDs over default settings by 2-3%. Automatic modifications and refinement searches were not used for X!Tandem. The last column indicates relative peptide identification performance where SEQUEST clearly outperformed the other search engines. Transformed scores were used: PeptideProphet-like function for SEQUEST, (Ion Score)-(Identity Score) for Mascot, and -Log(expectation score) for X!Tandem. Using XCorr, Ion Score, or Hypergeometric score reduced SEQUEST’s gain to 15% for LCQ and 10% for LTQ. Default settings for Mascot (1.2M Da, 0.6M Da) reduced IDs by 30%. X!Tandem defaults (-0.5/+3.0M, 0.4M) were 6% below optimum. A 2.5 Da average parent ion tolerance was the SEQUEST default.
> We need to understand how different search engines scores their data based on the available information from the respective publication papers.
---

### Summary:  
- SEQUEST outperformed Mascot and X!Tandem.
- Fragment ion tolerances should be optimized, not matched, for each search engine.
- Parameters controlling search space size should be matched for unbiased comparisons.
- Fragment ion mass type should always be monoisotopic.
- Default parameter settings were not optimum.

---
### References
1: Mohammed Y, Palmblad M. Visualizing and comparing results of different
peptide identification methods. Brief Bioinform. 2018 Mar 1;19(2):210-218. doi:
10.1093/bib/bbw115. PMID: 28011752.

2: Paulo JA. Practical and Efficient Searching in Proteomics: A Cross Engine
Comparison. Webmedcentral. 2013 Oct 1;4(10):WMCPLS0052. doi:
10.9754/journal.wplus.2013.0052. PMID: 25346847; PMCID: PMC4208621.

3: Matthiesen R. Algorithms for database-dependent search of MS/MS data. Methods
Mol Biol. 2013;1007:119-38. doi: 10.1007/978-1-62703-392-3_5. PMID: 23666724.

4: Shilov IV, Seymour SL, Patel AA, Loboda A, Tang WH, Keating SP, Hunter CL,
Nuwaysir LM, Schaeffer DA. The Paragon Algorithm, a next generation search
engine that uses sequence temperature values and feature probabilities to
identify peptides from tandem mass spectra. Mol Cell Proteomics. 2007
Sep;6(9):1638-55. doi: 10.1074/mcp.T600050-MCP200. Epub 2007 May 27. PMID:
17533153.

5: Chen Y, Kwon SW, Kim SC, Zhao Y. Integrated approach for manual evaluation of
peptides identified by searching protein sequence databases with tandem mass
spectra. J Proteome Res. 2005 May-Jun;4(3):998-1005. doi: 10.1021/pr049754t.
PMID: 15952748.

6: Novák J, Sachsenberg T, Hoksza D, Skopal T, Kohlbacher O. On comparison of
SimTandem with state-of-the-art peptide identification tools, efficiency of
precursor mass filter and dealing with variable modifications. J Integr
Bioinform. 2013 Nov 14;10(3):228. doi: 10.2390/biecoll-jib-2013-228. PMID:
24231142.

7: Wang J, Bourne PE, Bandeira N. Peptide identification by database search of
mixture tandem mass spectra. Mol Cell Proteomics. 2011 Dec;10(12):M111.010017.
doi: 10.1074/mcp.M111.010017. Epub 2011 Aug 23. PMID: 21862760; PMCID:
PMC3237077.

8: Raucci G, Gabrielli M, Novelli S, Picariello G, Collins SH. CHASE, a charge-
assisted sequencing algorithm for automated homology-based protein
identifications with matrix-assisted laser desorption/ionization time-of-flight
post-source decay fragmentation data. J Mass Spectrom. 2005 Apr;40(4):475-88.
doi: 10.1002/jms.817. PMID: 15712359.

9: Zhang X, Li Y, Shao W, Lam H. Understanding the improved sensitivity of
spectral library searching over sequence database searching in proteomics data
analysis. Proteomics. 2011 Mar;11(6):1075-85. doi: 10.1002/pmic.201000492. Epub
2011 Feb 7. PMID: 21298786.

10: Ye D, Fu Y, Sun RX, Wang HP, Yuan ZF, Chi H, He SM. Open MS/MS spectral
library search to identify unanticipated post-translational modifications and
increase spectral identification rate. Bioinformatics. 2010 Jun
15;26(12):i399-406. doi: 10.1093/bioinformatics/btq185. PMID: 20529934; PMCID:
PMC2881370.

Supported by National Research Foundation (NRF), Republic of South Africa

Author contact: javanokendo@gmail.com
