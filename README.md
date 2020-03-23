# Comparison of different search engines for the identification of proteins in complex clinical samples
#### Javan O. Okendo. Clemens Hermann, Nicola M. Mulder, Jonathan M. Blackburn

#### 1. Department of Integrative Biomedical Sciences, Chemical and Systems Biology, University of Cape Town, South Africa
#### 2. Department of Integrative Biomedical Sciences, Computational Biology and Bioinformatics, University of Cape Town, South Africa

---
### Background:  
* Unbiased comparisons between search programs to determine which performs best are challenging. Currently there is no standard database search engine that is accepted universally within the proteomics community. The HUPO-PSI has made some recommendations which are today used as standards in the proteomics comminity. The standards includes the use of mzML as a standard file format for the spectral data and many if not all search engines have been udated to take mzML file formats for the database search. This gains are timely but more work is still needed to be done in the standardization of the proteomics data processing and and downstream analysis. 
* Some search parameters should be matched and others can invalidate comparisons if they are matched. This has resulted in consistency making the comparison of different database search engines a great challenge.
* Consistent data processing is essential. This will enable ease of comparison of different results from different studies of core facilities

### Overview:  
- Search parameter space systematically explored for ([MSfragger](https://www.nature.com/articles/nmeth.4256), Ver. 2.3), ([MS-GF+](https://www.nature.com/articles/ncomms6277)),([comet](https://www.ncbi.nlm.nih.gov/pubmed/23148064)), ([Tide_search](http://dx.doi.org/10.1021/pr101196n)) which is an impementation of the SEQUEST database search engine. The comet and the tide search were implemented as a wrpper function from ([crux](http://crux.ms/index.html)). The widely used ([Maxquant](https://www.ncbi.nlm.nih.gov/pubmed/27809316, Ver. 1.6)) was also used in this analysis.
- Biological datasets from LCQ (3-day old human lens) and LTQ (yeast lysate [Käll, et al. (2007) Nat Methods 4:923-5](https://www.nature.com/articles/nmeth1113)) ion traps were used.
- Target/decoy databases were used to set common FDR thresholds in each of the 240+ searches.
Mascot and X!Tandem results files converted to formats compatible with a flexible processing pipeline [Wilmarth, et al. (2009) Ocul Biol Dis Infor 2:223-34](https://link.springer.com/article/10.1007/s12177-009-9042-6).
- Consistent processing eliminated biases.
- The number of matches given identical sets of spectra and identical sets of theoretical peptides at a given peptide error rate could be determined for SEQUEST, Mascot, and X!Tandem.

---

![workflow](images/Picture1.png)

**Data processing workflow.**  Conversion to common file formats at beginning of pipeline ensured consistent data processing for all comparisons.

---

![parent ion tolerances, lens-lcq](images/Picture2.png)
![parent ion tolerances, yeast-ltq](images/Picture3.png)

**Parent ion mass tolerance and other search space parameters should be matched.**  Some search engine parameters are operational. Other parameters affect scoring functions (see below). Remaining parameters determine the number of theoretical peptides (search space) scored during searches. Examples are protein database, enzymatic cleavage, fixed and variable modifications, parent ion mass type and parent ion mass tolerance. These parameters should be matched between search engines for unbiased comparisons. Shown above are several parent ion mass tolerances (fragment ion tolerances were search engine default values). Parent ion mass tolerance optimum was independent of search program.

---
![results table](images/Picture6.png)

**SEQUEST outperformed Mascot and X!Tandem.**  Parent ion monoisotopic mass tolerance of 4.0 Da was used. X!Tandem uses monoisotopic parent ion masses. Mascot requires the same  parent ion and fragment ion mass types. Optimum fragment ion tolerances were used for each search engine. X!Tandem dynamic ranges of 250 (LCQ) or 500 (LTQ) and 75 peaks improved IDs over default settings by 2-3%. Automatic modifications and refinement searches were not used for X!Tandem. The last column indicates relative peptide identification performance where SEQUEST clearly outperformed the other search engines. Transformed scores were used: PeptideProphet-like function for SEQUEST, (Ion Score)-(Identity Score) for Mascot, and -Log(expectation score) for X!Tandem. Using XCorr, Ion Score, or Hypergeometric score reduced SEQUEST’s gain to 15% for LCQ and 10% for LTQ. Default settings for Mascot (1.2M Da, 0.6M Da) reduced IDs by 30%. X!Tandem defaults (-0.5/+3.0M, 0.4M) were 6% below optimum. A 2.5 Da average parent ion tolerance was the SEQUEST default.

> SEQUEST supports different mass types for parent and fragment ion mass tolerances. A 4.0 Da monoisotopic parent ion tolerance is similar to a 2.5 Da average parent ion mass tolerance. The very wide parent ion mass tolerances that were optimal on these low resolution instruments would not be appropriate for newer high mass accuracy instruments.

---

### Summary:  
- SEQUEST outperformed Mascot and X!Tandem.
- Fragment ion tolerances should be optimized, not matched, for each search engine.
- Parameters controlling search space size should be matched for unbiased comparisons.
- Fragment ion mass type should always be monoisotopic.
- Default parameter settings were not optimum.

---

Supported by National Research Foundation (NRF)

Author contact: javanokendo [at] gmail.com




