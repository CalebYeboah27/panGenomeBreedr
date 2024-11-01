
<!-- README.md is generated from README.Rmd. Please edit that file -->

# panGenomeBreedr <img src="man/figures/logo.png" align="right" height="139" alt="" />

<!-- badges: start -->
<!-- badges: end -->

`panGenomeBreedr` (`panGB`) is conceptualized to be a unified, crop
agnostic platform for pangenome-enabled breeding that follows
standardized conventions for natural or casual variant analysis using
pangenomes, marker design, and marker QC hypothesis testing (Figure 1).
It seeks to simplify and enhance the use of pangenome resources in
cultivar development.

| <img src='man/figures/workflow.png' align="center" style="width: 800px;" /> |
|:--:|
| *Fig. 1. Imagined workflow for the `panGenomeBreedr` package for pangenome-enabled breeding. To develop trait-predictive, functional markers, the program takes manual inputs of candidate gene(s) and available pangenome resources for any crop. The program utilizes the input information to perform homology searches to identify orthologs/paralogs. The program, then, characterizes mutations within the input candidate gene to identify high-impact or putative causal variants (PCV). Identifying PCVs allows the program to design functional trait-predictive markers. The program implements the validation of designed markers in a hypothesis-driven manner. The program can equally design other types of markers such as precision-introgression markers and background markers.* |

In its current development version, `panGB` provides customizable
functions for **KASP marker design and validation** (Steps 2 and 3 in
Figure 1).

`panGB` will host a user-friendly shiny application to enable non-R
users to access its functionalities outside R.

LGC Genomics’ current visualization tool is platform-specific — the SNP
Viewer program runs only on Windows, thus preventing Mac and other
non-Windows platform customers from utilizing it. The SNP Viewer program
does not incorporate standardized conventions for visualizing the
prediction of positive controls to fully validate a marker. This makes
it difficult for users to validate markers conclusively using the
existing tool. `panGB` provides platform-independent functionalities to
users to perform hypothesis testing on KASP marker QC and validation.

Submit bug reports and feature suggestions, or track changes on the
[issues page](https://github.com/awkena/panGenomeBreedr/issues).

# Table of contents

- [Requirements](#requirements)
- [Recommended packages](#recommended-packages)
- [Installation](#installation)
- [Usage](#usage)
  - [Examples](#examples)
- [Troubleshooting](#troubleshooting)
- [Authors and contributors](#authors-and-contributors)
- [License](#license)
- [Support and Feedback](##support-and-feedback)

## Requirements

To run this package locally on a machine, the following R packages are
required:

- [ggplot2](https://ggplot2.tidyverse.org): Elegant Graphics for Data
  Analysis.

- [gridExtra](https://cran.r-project.org/web/packages/gridExtra/index.html):
  Miscellaneous Functions for “Grid” Graphics.

- [utils](https://www.rdocumentation.org/packages/utils/versions/3.6.2):
  The R Utils Package.

- [VariantAnnotation](https://bioconductor.org/packages/release/bioc/html/VariantAnnotation.html)

- [Biostrings](https://bioconductor.org/packages/release/bioc/html/Biostrings.html)

- [GenomicRanges](https://bioconductor.org/packages/release/bioc/html/GenomicRanges.html)

- [IRanges](https://bioconductor.org/packages/release/bioc/html/IRanges.html)

- [msa](https://bioconductor.org/packages/release/bioc/html/msa.html)

## Recommended packages

- [Rtools](https://cran.r-project.org/bin/windows/Rtools/rtools43/rtools.html):
  Needed for package development and installation from GitHub on Windows
  PCs.

- [rmarkdown](https://CRAN.R-project.org/package=rmarkdown): When
  installed, display of the project’s README.md will be rendered with R
  Markdown.

## Installation

First, ensure all existing packages are up to date.

You can install the development version of `panGenomeBreedr` from
[GitHub](https://github.com/awkena/panGenomeBreedr) with:

``` r
if (!require("pak")) install.packages("pak")

pak::pkg_install("awkena/panGenomeBreedr")
```

### Installing Bioconductor dependency packages

`panGB` depends on a list of Bioconductor packages that may not be
installed automatically alongside `panGB`. To manually install these
packages, use the code snippet below:

``` r
# Install and load required Bioconductor packages
if (!require("BiocManager", quietly = TRUE)) install.packages("BiocManager")

  BiocManager::install(c("VariantAnnotation",
                         "Biostrings",
                         "GenomicRanges",
                         "IRanges",
                         "msa"))
```

# Usage

Currently, `panGB` has functionality for KASP marker design based on
causal variants and QC visualizations for marker validation.

## Examples

Here, we provide examples on how to use `panGB` to design a KASP marker
based on a causal variant, as well as marker validation for any KASP
marker.

### KASP Marker Design

The `kasp_marker_design()` function provides a simplified approach to
designing a KASP marker based on identified causal variants.

The user needs two important input data to run the
`kasp_marker_design()`: the whole genome or specific chromosome sequence
of the focused crop and a vcf file containing variant calls from
putative causal variant analytical pipeline.

The vcf file must contain the Chromosome ID, Position, locus ID, REF and
ALT alleles, as well as the genotype data for samples, as shown below in
Table 1:

<table>
<caption>
Table 1: An example vcf file for marker design.
</caption>
<thead>
<tr>
<th style="text-align:left;">
CHROM
</th>
<th style="text-align:right;">
POS
</th>
<th style="text-align:left;">
ID
</th>
<th style="text-align:left;">
REF
</th>
<th style="text-align:left;">
ALT
</th>
<th style="text-align:left;">
IDMM
</th>
<th style="text-align:left;">
ISGC
</th>
<th style="text-align:left;">
ISGK
</th>
<th style="text-align:left;">
ISHC
</th>
<th style="text-align:left;">
ISHJ
</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align:left;">
Chr02
</td>
<td style="text-align:right;">
69197088
</td>
<td style="text-align:left;">
SNP_Chr02_69197088
</td>
<td style="text-align:left;">
G
</td>
<td style="text-align:left;">
A
</td>
<td style="text-align:left;">
0\|0
</td>
<td style="text-align:left;">
0\|0
</td>
<td style="text-align:left;">
0\|0
</td>
<td style="text-align:left;">
0\|0
</td>
<td style="text-align:left;">
0\|0
</td>
</tr>
<tr>
<td style="text-align:left;">
Chr02
</td>
<td style="text-align:right;">
69197120
</td>
<td style="text-align:left;">
SNP_Chr02_69197120
</td>
<td style="text-align:left;">
G
</td>
<td style="text-align:left;">
C
</td>
<td style="text-align:left;">
0\|0
</td>
<td style="text-align:left;">
0\|0
</td>
<td style="text-align:left;">
0\|0
</td>
<td style="text-align:left;">
0\|0
</td>
<td style="text-align:left;">
0\|0
</td>
</tr>
<tr>
<td style="text-align:left;">
Chr02
</td>
<td style="text-align:right;">
69197131
</td>
<td style="text-align:left;">
SNP_Chr02_69197131
</td>
<td style="text-align:left;">
G
</td>
<td style="text-align:left;">
T
</td>
<td style="text-align:left;">
0\|0
</td>
<td style="text-align:left;">
0\|0
</td>
<td style="text-align:left;">
0\|0
</td>
<td style="text-align:left;">
0\|0
</td>
<td style="text-align:left;">
0\|0
</td>
</tr>
<tr>
<td style="text-align:left;">
Chr02
</td>
<td style="text-align:right;">
69197209
</td>
<td style="text-align:left;">
SNP_Chr02_69197209
</td>
<td style="text-align:left;">
G
</td>
<td style="text-align:left;">
T
</td>
<td style="text-align:left;">
0\|0
</td>
<td style="text-align:left;">
0\|0
</td>
<td style="text-align:left;">
0\|0
</td>
<td style="text-align:left;">
0\|0
</td>
<td style="text-align:left;">
0\|0
</td>
</tr>
<tr>
<td style="text-align:left;">
Chr02
</td>
<td style="text-align:right;">
69197294
</td>
<td style="text-align:left;">
SNP_Chr02_69197294
</td>
<td style="text-align:left;">
G
</td>
<td style="text-align:left;">
A
</td>
<td style="text-align:left;">
0\|0
</td>
<td style="text-align:left;">
0\|0
</td>
<td style="text-align:left;">
0\|0
</td>
<td style="text-align:left;">
0\|0
</td>
<td style="text-align:left;">
0\|0
</td>
</tr>
</tbody>
</table>

``` r

# Example to design a KASP marker on a substitution variant
# Set path to alignment output folder 
library(panGenomeBreedr)
path <- tempdir() # (default directory for saving alignment outputs)

# Path to import sorghum genome sequence for Chromosome 2
path1 <- "https://raw.githubusercontent.com/awkena/panGB/main/Chr02.fa.gz"

# Path to import vcf file for variant calls on Chromosome 2
path2 <-  system.file("extdata", "Sobic.002G302700_SNP_snpeff.vcf",
                      package = "panGenomeBreedr",
                     mustWork = TRUE)

# KASP marker design for variant ID: SNP_Chr02_69200443 in vcf file
ma1 <- kasp_marker_design(vcf_file = path2,
                           genome_file = path1,
                           marker_ID = "SNP_Chr02_69200443",
                           chr = "Chr02",
                           plot_draw = TRUE,
                           plot_file = path,
                           vcf_geno_code = c('1|1', '0|1', '0|0', '.|.'),
                           region_name = "ma1",
                           maf = 0.05)
#> using Gonnet

# View marker alignment output from temp folder
path3 <- file.path(path, list.files(path = path, "alignment_"))
system(paste0('open "', path3, '"')) # Open PDF file from R

on.exit(unlink(path)) # Clear the temp directory on exit
```

In the `kasp_marker_design()` function call above, the user must specify
the path to the genome sequence and vcf files using the `genome_file`
and `vcf_file` arguments, respectively. The user must specify the ID for
the variant in the vcf file using the `marker_ID` argument.

To save memory and enhance the computational speed, the `chr` argument
can be specified to access only the chromosome sequence of the chosen
variant from the genome sequence.

The `vcf_geno_code` argument is used to specify the genotype coding in
the vcf file – either phased (1\|1) or unphased (1/1) coding.

The `plot_draw = TRUE` argument indicates the return of the alignment of
the 100 bp upstream and downstream sequences to the imported reference
genome as PDF file (Figure 2).

The `plot_file` argument specifies the path to the directory where the
alignment should be saved – default is a temporary directory.

| <img src='man/figures/alignment.png' align="center" style="width: 700px;" /> |
|:--:|
| *Fig. 2. Alignment of the 100 bp upstream and downstream sequences to the reference genome used for KASP marker design.* |

The required sequence for submission to Intertek for the designed KASp
marker is shown in Table 2.

<table>
<caption>
Table 2: Intertek required sequence for a KASP marker.
</caption>
<thead>
<tr>
<th style="text-align:left;">
SNP_Name
</th>
<th style="text-align:left;">
SNP
</th>
<th style="text-align:left;">
Marker_Name
</th>
<th style="text-align:left;">
Chromosome
</th>
<th style="text-align:right;">
Chromosome_Position
</th>
<th style="text-align:left;">
Sequence
</th>
<th style="text-align:left;">
ReferenceAllele
</th>
<th style="text-align:left;">
AlternativeAllele
</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align:left;">
SNP_Chr02_69200443
</td>
<td style="text-align:left;">
Substitution
</td>
<td style="text-align:left;">
ma1
</td>
<td style="text-align:left;">
Chr02
</td>
<td style="text-align:right;">
69200443
</td>
<td style="text-align:left;">
TAGTTTGATGTTTGCCTTACAATTTGATTTGATGGCAATACCTTTTCCATTTTATCAGCATCTACACCATTTTATATCTTTGGATTAGATTTTTTTTWAA\[A/T\]AAAAAAGTAATATGTTTGTTATGTGCTTTACTCAACAAGATCTACATTTTAAATTAGCTACTTTTTACCATCTTATTTGTTTGTTGTGTGTTTTATTCAA
</td>
<td style="text-align:left;">
A
</td>
<td style="text-align:left;">
T
</td>
</tr>
</tbody>
</table>

### KASP Marker Validation

The following example demonstrates how to use the customizable functions
in `panGB` to perform hypothesis testing of allelic discrimination for
KASP marker QC and validation.

`panGB` offers customizable functions for KASP marker validation through
hypothesis testing. These functions allow users to easily perform the
following tasks:  
- Import raw or polished KASP genotyping results files (.csv) into R.

- Process imported data and assign FAM and HEX fluorescence colors for
  multiple plates.

- Visualize marker QC using FAM and HEX fluorescence scores for each
  sample.

- Validate the effectiveness of trait-predictive or background markers
  using positive controls.

- Visualize plate design and randomization.

### Reading Raw KASP Full Results Files (.csv)

The `read_kasp_csv()` function allows users to import raw or polished
KASP genotyping full results file (.csv) into R. The function requires
the path of the raw file and the row tags for the different components
of data in the raw file as arguments.

For polished files, the user must extract the `Data` component of the
full results file and save it as a csv file before import.

By default, a typical unedited raw KASP data file uses the following row
tags for genotyping data: `Statistics`, `DNA`, `SNPs`, `Scaling`,
`Data`.

The raw file is imported as a list object in R. Thus, all components in
the imported data can be extracted using the row tag ID as shown in the
code snippet below:

``` r
# Import raw KASP genotyping file (.csv) using the read_kasp_csv() function
library(panGenomeBreedr)

# Set path to the directory where your data is located
# path1 <-  "inst/extdata/Genotyping_141.010_01.csv"
path1 <-  system.file("extdata", "Genotyping_141.010_01.csv",
                       package = "panGenomeBreedr",
                      mustWork = TRUE)

# Import raw data file
file1 <- read_kasp_csv(file = path1, 
                       row_tags = c("Statistics", "DNA", "SNPs", "Scaling", "Data"),
                       data_type = 'raw')

# Get KASP genotyping data for plotting
kasp_dat <- file1$Data
```

### Assigning colors and PCH symbols for KASP cluster plotting

The next step after importing data is to assign FAM and HEX fluorescence
colors to samples based on their observed genotype calls. This step is
accomplished using the `kasp_color()` function in `panGB` as shown in
the code snippet below:

``` r
# Assign KASP fluorescence colors using the kasp_color() function
library(panGenomeBreedr)
# Create a subet variable called plates: masterplate x snpid
  kasp_dat$plates <- paste0(kasp_dat$MasterPlate, '_',
                                 kasp_dat$SNPID)
dat1 <- kasp_color(x = kasp_dat,
                    subset = 'plates',
                    sep = ':',
                    geno_call = 'Call',
                    uncallable = 'Uncallable',
                    unused = '?',
                    blank = 'NTC',
                   assign_cols = c(FAM = "blue", HEX = "gold" , 
                                   het = "forestgreen"))
```

The `kasp_color()` function requires the KASP genotype call file as a
data frame and can do bulk processing if there are multiple master
plates. The default values for the arguments in the `kasp_color()`
function are based on KASP annotations.

The `kasp_color()` function calls the `kasp_pch()` function to
automatically add PCH plotting symbols that can equally be used to group
genotypic clusters on the plot.

When expected genotype calls are available for positive controls in KASP
genotyping samples, we recommend the use of the PCH symbols for grouping
observed genotypes instead of FAM and HEX colors.

The `kasp_color()` function expects that genotype calls are for diploid
state with alleles separated by a symbol. By default KASP data are
separated by `:` symbols.

The `kasp_color()` function returns a list object with the processed
data for each master plate as the components.

### Cluster plot

To test the hypothesis that the designed KASP marker can accurately
discriminate between homozygotes and heterozygotes (allelic
discrimination), a cluster plot needs to be generated.

The `kasp_qc_ggplot()` and `kasp_qc_ggplot2()`functions in `panGB` can
be used to make the cluster plots for each plate and KASP marker as
shown below:

``` r
# KASP QC plot for Plate 05
library(panGenomeBreedr)
kasp_qc_ggplot2(x = dat1[5],
                    pdf = FALSE,
                    Group_id = NULL,
                    scale = TRUE,
                    expand_axis = 0.6,
                    alpha = 0.9,
                    legend.pos.x = 0.6,
                    legend.pos.y = 0.75)
#> $`SE-24-1088_P01_d1_snpSB00804`
```

<div class="figure">

<img src="man/figures/README-plate_05_qc_1-1.png" alt="Fig. 3. Cluster plot for Plate 5 using FAM and HEX colors for grouping observed genotypes." width="100%" />
<p class="caption">
Fig. 3. Cluster plot for Plate 5 using FAM and HEX colors for grouping
observed genotypes.
</p>

</div>

``` r
# KASP QC plot for Plate 05
library(panGenomeBreedr)
 kasp_qc_ggplot2(x = dat1[5],
                  pdf = FALSE,
                  Group_id = 'Group',
                  Group_unknown = '?',
                  scale = TRUE,
                  pred_cols = c('Blank' = 'black', 'False' = 'firebrick3',
                              'True' = 'cornflowerblue', 'Unverified' = 'beige'),
                  expand_axis = 0.6,
                  alpha = 0.9,
                  legend.pos.x = 0.6,
                  legend.pos.y = 0.75)
#> $`SE-24-1088_P01_d1_snpSB00804`
```

<div class="figure">

<img src="man/figures/README-plate_05_qc_2-1.png" alt="Fig. 4. Cluster plot for Plate 5 with an overlay of predictions for positive controls." width="100%" />
<p class="caption">
Fig. 4. Cluster plot for Plate 5 with an overlay of predictions for
positive controls.
</p>

</div>

Color-blind-friendly color combinations are used to visualize verified
genotype predictions (Figure 3).

In Figure 4, the three genotype classes are grouped based on plot PCH
symbols using the FAM and HEX scores for observed genotype calls.

To simplify the verified prediction overlay for the expected genotypes
for positive controls, all possible outcomes are divided into three
categories (TRUE, FALSE, and UNVERIFIED) and color-coded to make it
easier to visualize verified predictions.

BLUE (color code for the TRUE category) means genotype prediction
matches the observed genotype call for the sample.

RED (color code for the FALSE category) means genotype prediction does
not match the observed genotype call for the sample.

BEIGE (color code for the UNVERIFIED category) means three things: an
expected genotype call could not be made before KASP genotyping, or an
observed genotype call could not be made to verify the prediction.

Users can set the `pdf = TRUE` argument to save plots as a PDF file in a
directory outside R. The `kasp_qc_ggplot()` and
`kasp_qc_ggplot2()`functions can generate cluster plots for multiple
plates simultaneously.

To visualize predictions for positive controls to validate KASP markers,
the column name containing expected genotype calls must be provided and
passed to the function using the `Group_id = 'Group'` argument as shown
in the code snippets above. If this information is not available, set
the argument `Group_id = NULL`.

### Summary of Prediction Verification in Plates

The `pred_summary()` function produces a summary of predicted genotypes
for positive controls in each reaction plate after verification (Table
3), as shown in the code snippet below:

``` r
# Get prediction summary for all plates
library(panGenomeBreedr)
my_sum <- pred_summary(x = dat1,
                       snp_id = 'SNPID',
                       Group_id = 'Group',
                       Group_unknown = '?',
                       geno_call = 'Call',
                       rate_out = TRUE)
```

<table>
<caption>
Table 3: Summary of verified prediction status for samples in plates
</caption>
<thead>
<tr>
<th style="text-align:left;">
plate
</th>
<th style="text-align:left;">
snp_id
</th>
<th style="text-align:right;">
false
</th>
<th style="text-align:right;">
true
</th>
<th style="text-align:right;">
unverified
</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align:left;">
SE-24-1088_P01_d1_snpSB00800
</td>
<td style="text-align:left;">
snpSB00800
</td>
<td style="text-align:right;">
0.04
</td>
<td style="text-align:right;">
0.06
</td>
<td style="text-align:right;">
0.90
</td>
</tr>
<tr>
<td style="text-align:left;">
SE-24-1088_P01_d2_snpSB00800
</td>
<td style="text-align:left;">
snpSB00800
</td>
<td style="text-align:right;">
0.02
</td>
<td style="text-align:right;">
0.06
</td>
<td style="text-align:right;">
0.92
</td>
</tr>
<tr>
<td style="text-align:left;">
SE-24-1088_P01_d1_snpSB00803
</td>
<td style="text-align:left;">
snpSB00803
</td>
<td style="text-align:right;">
0.00
</td>
<td style="text-align:right;">
0.34
</td>
<td style="text-align:right;">
0.66
</td>
</tr>
<tr>
<td style="text-align:left;">
SE-24-1088_P01_d2_snpSB00803
</td>
<td style="text-align:left;">
snpSB00803
</td>
<td style="text-align:right;">
0.00
</td>
<td style="text-align:right;">
0.34
</td>
<td style="text-align:right;">
0.66
</td>
</tr>
<tr>
<td style="text-align:left;">
SE-24-1088_P01_d1_snpSB00804
</td>
<td style="text-align:left;">
snpSB00804
</td>
<td style="text-align:right;">
0.01
</td>
<td style="text-align:right;">
0.33
</td>
<td style="text-align:right;">
0.66
</td>
</tr>
<tr>
<td style="text-align:left;">
SE-24-1088_P01_d2_snpSB00804
</td>
<td style="text-align:left;">
snpSB00804
</td>
<td style="text-align:right;">
0.01
</td>
<td style="text-align:right;">
0.33
</td>
<td style="text-align:right;">
0.66
</td>
</tr>
<tr>
<td style="text-align:left;">
SE-24-1088_P01_d1_snpSB00805
</td>
<td style="text-align:left;">
snpSB00805
</td>
<td style="text-align:right;">
0.15
</td>
<td style="text-align:right;">
0.19
</td>
<td style="text-align:right;">
0.66
</td>
</tr>
<tr>
<td style="text-align:left;">
SE-24-1088_P01_d2_snpSB00805
</td>
<td style="text-align:left;">
snpSB00805
</td>
<td style="text-align:right;">
0.15
</td>
<td style="text-align:right;">
0.19
</td>
<td style="text-align:right;">
0.66
</td>
</tr>
</tbody>
</table>

The output of the `pred_summary()` function can be visualized as bar
plots using the `pred_summary_plot()` function as shown in the code
snippet below:

``` r
# Get prediction summary for snp:snpSB00804
library(panGenomeBreedr)
my_sum <- my_sum$summ
my_sum <- my_sum[my_sum$snp_id == 'snpSB00804',]

 pred_summary_plot(x = my_sum,
                    pdf = FALSE,
                    pred_cols = c('false' = 'firebrick3', 'true' = 'cornflowerblue',
                                  'unverified' = 'beige'),
                    alpha = 1,
                    text_size = 12,
                    width = 6,
                    height = 6,
                    angle = 45)
#> $snpSB00804
```

<div class="figure">

<img src="man/figures/README-barplot-1.png" alt="Fig. 5. Match/Mismatch rate of predictions for snp: snpSB00804." width="100%" />
<p class="caption">
Fig. 5. Match/Mismatch rate of predictions for snp: snpSB00804.
</p>

</div>

### Plot Plate Design

Users can visualize the observed genotype calls in a plate design format
using the `plot_plate()` function as depicted in Figure 5, using the
code snippet below:

``` r
plot_plate(dat1[5], pdf = FALSE)
#> $`SE-24-1088_P01_d1_snpSB00804`
```

<div class="figure">

<img src="man/figures/README-plate_05_design-1.png" alt="Fig. 6. Observed genotype calls for samples in Plate 5 in a plate design format." width="100%" />
<p class="caption">
Fig. 6. Observed genotype calls for samples in Plate 5 in a plate design
format.
</p>

</div>

# Other Breeder-Centered Functionalities in panGB

`panGB` provides additional functionalities to test hypotheses on the
success of trait introgression pipelines and crosses.

Users can easily generate heatmaps that compare the genetic background
of parents to progenies to ascertain if a target locus was successfully
introgressed or check for the hybridity of F1s. These plots also allow
users to get a visual insight into the amount of parent germplasm
recovered in progenies.  
To produce these plots, one needs to have either polymorphic low or
mid-density marker data from service providers such as KASP, Agriplex
and DArTag.

## Working with Agriplex Mid-Density Marker Data

Agriplex data is structurally different from KASP or DArTag data in
terms of genotype call coding and formatting. Agriplex uses `' / '` as a
separator for genotype calls for heterozygotes, and uses single
nucleotides to represent homozygous SNP calls.

## Creating Heatmaps with `panGB`

To exemplify the steps for creating heatmap, we will use a mid-density
marker data for three groups of near-isogenic lines (NILs) and their
parents (Table 4). The NILs and their parents were genotyped using the
Agriplex platform. Each NIL group was genotyped using 2421 markers.

The imported data frame has the markers as columns and genotyped samples
as rows. It comes with some meta data about the samples. Marker names
are informative: chromosome number and position coordinates are embedded
in the marker names (`Eg. S1_778962: chr = 1, pos = 779862`).

``` r

# Set path to the directory where your data is located
path1 <-  system.file("extdata", "agriplex_dat.csv",
                       package = "panGenomeBreedr",
                      mustWork = TRUE)

# Import raw Agriplex data file
geno <- read.csv(file = path1, header = TRUE, colClasses = c("character")) # genotype calls

library(knitr)
knitr::kable(geno[1:6, 1:10], caption = 'Table 4: Agriplex data format', format = 'html', booktabs = TRUE)
```

<table>
<caption>
Table 4: Agriplex data format
</caption>
<thead>
<tr>
<th style="text-align:left;">
Plate.name
</th>
<th style="text-align:left;">
Well
</th>
<th style="text-align:left;">
Sample_ID
</th>
<th style="text-align:left;">
Batch
</th>
<th style="text-align:left;">
Genotype
</th>
<th style="text-align:left;">
Status
</th>
<th style="text-align:left;">
S1_778962
</th>
<th style="text-align:left;">
S1_1019896
</th>
<th style="text-align:left;">
S1_1613105
</th>
<th style="text-align:left;">
S1_1954298
</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align:left;">
RHODES_PLATE1
</td>
<td style="text-align:left;">
D04
</td>
<td style="text-align:left;">
NIL_1
</td>
<td style="text-align:left;">
1
</td>
<td style="text-align:left;">
RTx430a
</td>
<td style="text-align:left;">
Recurrent parent
</td>
<td style="text-align:left;">
A
</td>
<td style="text-align:left;">
G
</td>
<td style="text-align:left;">
G
</td>
<td style="text-align:left;">
A
</td>
</tr>
<tr>
<td style="text-align:left;">
RHODES_PLATE1
</td>
<td style="text-align:left;">
F04
</td>
<td style="text-align:left;">
NIL_2
</td>
<td style="text-align:left;">
1
</td>
<td style="text-align:left;">
RTx430b
</td>
<td style="text-align:left;">
Recurrent parent
</td>
<td style="text-align:left;">
A
</td>
<td style="text-align:left;">
G
</td>
<td style="text-align:left;">
G
</td>
<td style="text-align:left;">
A
</td>
</tr>
<tr>
<td style="text-align:left;">
RHODES_PLATE1
</td>
<td style="text-align:left;">
G04
</td>
<td style="text-align:left;">
NIL_3
</td>
<td style="text-align:left;">
1
</td>
<td style="text-align:left;">
IRAT204a
</td>
<td style="text-align:left;">
Donor parent
</td>
<td style="text-align:left;">
G
</td>
<td style="text-align:left;">
C
</td>
<td style="text-align:left;">
G
</td>
<td style="text-align:left;">
A
</td>
</tr>
<tr>
<td style="text-align:left;">
RHODES_PLATE1
</td>
<td style="text-align:left;">
A05
</td>
<td style="text-align:left;">
NIL_4
</td>
<td style="text-align:left;">
1
</td>
<td style="text-align:left;">
IRAT204b
</td>
<td style="text-align:left;">
Donor Parent
</td>
<td style="text-align:left;">
G
</td>
<td style="text-align:left;">
C
</td>
<td style="text-align:left;">
G
</td>
<td style="text-align:left;">
A
</td>
</tr>
<tr>
<td style="text-align:left;">
RHODES_PLATE1
</td>
<td style="text-align:left;">
D07
</td>
<td style="text-align:left;">
NIL_5
</td>
<td style="text-align:left;">
1
</td>
<td style="text-align:left;">
RMES1+\|+\_1
</td>
<td style="text-align:left;">
NIL+
</td>
<td style="text-align:left;">
A
</td>
<td style="text-align:left;">
G
</td>
<td style="text-align:left;">
G
</td>
<td style="text-align:left;">
A
</td>
</tr>
<tr>
<td style="text-align:left;">
RHODES_PLATE1
</td>
<td style="text-align:left;">
F08
</td>
<td style="text-align:left;">
NIL_6
</td>
<td style="text-align:left;">
1
</td>
<td style="text-align:left;">
RMES1+\|+\_2
</td>
<td style="text-align:left;">
NIL+
</td>
<td style="text-align:left;">
A
</td>
<td style="text-align:left;">
G
</td>
<td style="text-align:left;">
G
</td>
<td style="text-align:left;">
A
</td>
</tr>
</tbody>
</table>

To create a heatmap that compares the genetic background of parents and
NILs across all markers, we need to first process the raw Agriplex data
into a numeric format. The panGB package has customizable data wrangling
functions for KASP, Agriplex, and DArTag data.

Since our imported Agriplex data has informative SNP IDs, we can use the
`parse_marker_ns()` function to generate a map file, which can be passed
to the `proc_kasp()` function to order the SNP markers according to
their chromosome numbers and positions.

The `kasp_numeric()` function converts the output of the `proc_kasp()`
function into a numeric format (Table 5). The re-coding to numeric
format is done as follows:

- Homozygous for Parent 1 allele = 1.
- Homozygous for Parent 2 allele = 0.
- Heterozygous = 0.5.
- Monomorphic loci = -1.
- Loci with a suspected genotype error = -2.
- Loci with at least one missing parental or any other genotype = -5.

The next step would be to melt the numeric output matrix of the
`kasp_numeric()` function into a long tidy format using the `ggdat()`
function. This last conversion is necessary to allow us to use the
`ggplot2` package for heatmap plotting.

``` r

# Parse snp ids to generate a map file
library(panGenomeBreedr)
snps <- colnames(geno)[-c(1:6)] # Get snp ids
map_file <- parse_marker_ns(x = snps, sep = '_', prefix = 'S')

# Process genotype data to re-order SNPs based on chromosome and positions
stg5 <- proc_kasp(x = geno[geno$Batch == 3,], # stg5 NILs
                  kasp_map = map_file,
                  map_snp_id = "snpid",
                  sample_id = "Genotype",
                  marker_start = 7,
                  chr = 'chr',
                  chr_pos = 'pos')

map_file <- stg5$ordered_map # Ordered map
stg5 <- stg5$ordered_geno # Ordered geno

# Convert to numeric format for plotting
num_geno <- kasp_numeric(x = stg5,
                         rp_row = 1, # Recurrent parent row ID
                         dp_row = 3, # Donor parent row ID
                         sep = ' / ',
                         data_type = 'agriplex')

library(knitr)
knitr::kable(num_geno[, 1:8], caption = 'Table 5: Agriplex data converted to a numeric format.', format = 'html', booktabs = TRUE)
```

<table>
<caption>
Table 5: Agriplex data converted to a numeric format.
</caption>
<thead>
<tr>
<th style="text-align:left;">
</th>
<th style="text-align:right;">
S1_328467
</th>
<th style="text-align:right;">
S1_402592
</th>
<th style="text-align:right;">
S1_778962
</th>
<th style="text-align:right;">
S1_825853
</th>
<th style="text-align:right;">
S1_1019896
</th>
<th style="text-align:right;">
S1_1218846
</th>
<th style="text-align:right;">
S1_1613105
</th>
<th style="text-align:right;">
S1_1727150
</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align:left;">
BTx623a
</td>
<td style="text-align:right;">
-1
</td>
<td style="text-align:right;">
1
</td>
<td style="text-align:right;">
1
</td>
<td style="text-align:right;">
1
</td>
<td style="text-align:right;">
-1
</td>
<td style="text-align:right;">
1
</td>
<td style="text-align:right;">
1
</td>
<td style="text-align:right;">
1
</td>
</tr>
<tr>
<td style="text-align:left;">
BTx623b
</td>
<td style="text-align:right;">
-1
</td>
<td style="text-align:right;">
1
</td>
<td style="text-align:right;">
1
</td>
<td style="text-align:right;">
1
</td>
<td style="text-align:right;">
-1
</td>
<td style="text-align:right;">
1
</td>
<td style="text-align:right;">
1
</td>
<td style="text-align:right;">
1
</td>
</tr>
<tr>
<td style="text-align:left;">
BTx642a
</td>
<td style="text-align:right;">
-1
</td>
<td style="text-align:right;">
0
</td>
<td style="text-align:right;">
0
</td>
<td style="text-align:right;">
0
</td>
<td style="text-align:right;">
-1
</td>
<td style="text-align:right;">
0
</td>
<td style="text-align:right;">
0
</td>
<td style="text-align:right;">
0
</td>
</tr>
<tr>
<td style="text-align:left;">
BTx642b
</td>
<td style="text-align:right;">
-1
</td>
<td style="text-align:right;">
0
</td>
<td style="text-align:right;">
0
</td>
<td style="text-align:right;">
0
</td>
<td style="text-align:right;">
-1
</td>
<td style="text-align:right;">
0
</td>
<td style="text-align:right;">
0
</td>
<td style="text-align:right;">
0
</td>
</tr>
<tr>
<td style="text-align:left;">
Stg5+\|+\_1
</td>
<td style="text-align:right;">
-1
</td>
<td style="text-align:right;">
1
</td>
<td style="text-align:right;">
0
</td>
<td style="text-align:right;">
0
</td>
<td style="text-align:right;">
-1
</td>
<td style="text-align:right;">
0
</td>
<td style="text-align:right;">
0
</td>
<td style="text-align:right;">
0
</td>
</tr>
<tr>
<td style="text-align:left;">
Stg5+\|+\_2
</td>
<td style="text-align:right;">
-1
</td>
<td style="text-align:right;">
0
</td>
<td style="text-align:right;">
0
</td>
<td style="text-align:right;">
0
</td>
<td style="text-align:right;">
-1
</td>
<td style="text-align:right;">
0
</td>
<td style="text-align:right;">
0
</td>
<td style="text-align:right;">
1
</td>
</tr>
<tr>
<td style="text-align:left;">
Stg5-\|-\_1
</td>
<td style="text-align:right;">
-1
</td>
<td style="text-align:right;">
1
</td>
<td style="text-align:right;">
1
</td>
<td style="text-align:right;">
1
</td>
<td style="text-align:right;">
-1
</td>
<td style="text-align:right;">
1
</td>
<td style="text-align:right;">
1
</td>
<td style="text-align:right;">
1
</td>
</tr>
<tr>
<td style="text-align:left;">
Stg5-\|-\_2
</td>
<td style="text-align:right;">
-1
</td>
<td style="text-align:right;">
1
</td>
<td style="text-align:right;">
1
</td>
<td style="text-align:right;">
1
</td>
<td style="text-align:right;">
-1
</td>
<td style="text-align:right;">
1
</td>
<td style="text-align:right;">
1
</td>
<td style="text-align:right;">
1
</td>
</tr>
<tr>
<td style="text-align:left;">
Stg5-\|-\_3
</td>
<td style="text-align:right;">
-1
</td>
<td style="text-align:right;">
1
</td>
<td style="text-align:right;">
1
</td>
<td style="text-align:right;">
1
</td>
<td style="text-align:right;">
-1
</td>
<td style="text-align:right;">
1
</td>
<td style="text-align:right;">
1
</td>
<td style="text-align:right;">
1
</td>
</tr>
</tbody>
</table>

``` r

# Get tidy format data for heatmap plotting
df <- gg_dat(num_mat = num_geno,
             map_file = map_file)

knitr::kable(df[1:10,], caption = 'Table 6: Conversion from numeric matrix format to a tidy format.', format = 'html', booktabs = TRUE)
```

<table>
<caption>
Table 6: Conversion from numeric matrix format to a tidy format.
</caption>
<thead>
<tr>
<th style="text-align:left;">
</th>
<th style="text-align:left;">
snpid
</th>
<th style="text-align:left;">
x
</th>
<th style="text-align:left;">
value
</th>
<th style="text-align:right;">
chr
</th>
<th style="text-align:right;">
pos
</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align:left;">
1.1
</td>
<td style="text-align:left;">
S1_328467
</td>
<td style="text-align:left;">
BTx623a
</td>
<td style="text-align:left;">
-1
</td>
<td style="text-align:right;">
1
</td>
<td style="text-align:right;">
328467
</td>
</tr>
<tr>
<td style="text-align:left;">
1.2
</td>
<td style="text-align:left;">
S1_328467
</td>
<td style="text-align:left;">
BTx623b
</td>
<td style="text-align:left;">
-1
</td>
<td style="text-align:right;">
1
</td>
<td style="text-align:right;">
328467
</td>
</tr>
<tr>
<td style="text-align:left;">
1.3
</td>
<td style="text-align:left;">
S1_328467
</td>
<td style="text-align:left;">
BTx642a
</td>
<td style="text-align:left;">
-1
</td>
<td style="text-align:right;">
1
</td>
<td style="text-align:right;">
328467
</td>
</tr>
<tr>
<td style="text-align:left;">
1.4
</td>
<td style="text-align:left;">
S1_328467
</td>
<td style="text-align:left;">
BTx642b
</td>
<td style="text-align:left;">
-1
</td>
<td style="text-align:right;">
1
</td>
<td style="text-align:right;">
328467
</td>
</tr>
<tr>
<td style="text-align:left;">
1.5
</td>
<td style="text-align:left;">
S1_328467
</td>
<td style="text-align:left;">
Stg5+\|+\_1
</td>
<td style="text-align:left;">
-1
</td>
<td style="text-align:right;">
1
</td>
<td style="text-align:right;">
328467
</td>
</tr>
<tr>
<td style="text-align:left;">
1.6
</td>
<td style="text-align:left;">
S1_328467
</td>
<td style="text-align:left;">
Stg5+\|+\_2
</td>
<td style="text-align:left;">
-1
</td>
<td style="text-align:right;">
1
</td>
<td style="text-align:right;">
328467
</td>
</tr>
<tr>
<td style="text-align:left;">
1.7
</td>
<td style="text-align:left;">
S1_328467
</td>
<td style="text-align:left;">
Stg5-\|-\_1
</td>
<td style="text-align:left;">
-1
</td>
<td style="text-align:right;">
1
</td>
<td style="text-align:right;">
328467
</td>
</tr>
<tr>
<td style="text-align:left;">
1.8
</td>
<td style="text-align:left;">
S1_328467
</td>
<td style="text-align:left;">
Stg5-\|-\_2
</td>
<td style="text-align:left;">
-1
</td>
<td style="text-align:right;">
1
</td>
<td style="text-align:right;">
328467
</td>
</tr>
<tr>
<td style="text-align:left;">
1.9
</td>
<td style="text-align:left;">
S1_328467
</td>
<td style="text-align:left;">
Stg5-\|-\_3
</td>
<td style="text-align:left;">
-1
</td>
<td style="text-align:right;">
1
</td>
<td style="text-align:right;">
328467
</td>
</tr>
<tr>
<td style="text-align:left;">
1.10
</td>
<td style="text-align:left;">
S1_402592
</td>
<td style="text-align:left;">
BTx623a
</td>
<td style="text-align:left;">
1
</td>
<td style="text-align:right;">
1
</td>
<td style="text-align:right;">
402592
</td>
</tr>
</tbody>
</table>

All is now set to generate the heatmap (Figure 6) using the
`cross_qc_ggplot()` function, as shown in the code snippet below:

``` r

# Get prediction summary for snp:snpSB00804
library(panGenomeBreedr)
# Create a heatmap that compares the parents to progenies
cross_qc_ggplot(x = df,
                snp_ids = 'snpid',
                geno_ids = 'x',
                chr = 'chr',
                chr_pos = 'pos',
                value = 'value',
                parents = c('BTx623', 'BTx642'),
                group_sz = 5L,
                pdf = FALSE,
                legend_title = 'Heatmap_key',
                alpha = 1,
                text_size = 14)
#> $Batch1
```

<div class="figure">

<img src="man/figures/README-heatmap1-1.png" alt="Fig. 6. A heatmap that compares the genetic background of parents and stg5 NIL progenies across all markers." width="100%" />
<p class="caption">
Fig. 6. A heatmap that compares the genetic background of parents and
stg5 NIL progenies across all markers.
</p>

</div>

The `cross_qc_ggplot()` function is a wrapper for functions in the
`ggplot2` package.

Users must specify the IDs for the two parents using the `parents`
argument. In the code snippet above, the recurrent parent is `BTx623`
and the donor parent for the *stg5* locus is `BTx642`.

The `group_sz` argument must be specified to plot the heatmap in batches
of progenies to avoid cluttering the plot with many observations.

Users can set the `pdf = TRUE` argument to save plots as a PDF file in a
directory outside R.

To test the hypothesis that *stg5* NIL development was effective, we can
generate a heatmap (Figure 7) that zooms into the location of *stg5* on
Chromosome 1, as shown below:

``` r

###########################################################################
# stg5 NILs -- first 30 markers on Chr 1
stg5_ch1 <- num_geno[, map_file$chr == 1][,1:30] # Subset data

# Get map for subset data
stg5_ch1_map <- map_file[map_file$chr == 1,][1:30,]

# Get tidy format data for heatmap plotting
df <- gg_dat(num_mat = stg5_ch1,
             map_file = stg5_ch1_map)

# Re-order levels of the sample ids before plotting
df$x <- factor(df$x, levels = rev(unique(df$x)))

# Heatmap plot using ggplot2
if (!require('ggplot2')) install.packages('ggplot2')
#> Loading required package: ggplot2

main <- 'Stg5_NILs_Chr_1' # Legend title

# Markers positions delimiting stg5 locus on chr 1
stg5_pos <- c(start = 1019896, end = 1613105)

# Blue = Missing; coral1 = RP; yellow = Het; purple = DP; grey70 = Mono
col <- c('-1' = 'grey70',
         '-5' = 'blue',
        '0' = 'purple2',
        '0.5' = 'gold',
        '1' = 'coral2')

labels <- c("Monomorphic", "Missing", "BTx642", "Heterozygous", "BTx623")

ggplot2::ggplot(df, ggplot2::aes(x = as.factor(pos), y = x, fill = value)) +
  ggplot2::geom_tile(lwd = 2, linetype = 1) +
  ggplot2::scale_fill_manual( values = col, label = labels, name = main) +
  ggplot2::geom_vline(xintercept = as.character(stg5_pos), linetype = 2, 
                      lwd = 2, col = 'black') +
  ggplot2::xlab('Marker position (bp)') +
  ggplot2::expand_limits(y = c(1, length(unique(df$x)) + 0.8)) +
  ggplot2::theme(axis.text.y = ggplot2::element_text(size = 14),
        axis.text.x = ggplot2::element_text(angle = -90, hjust = 0, size = 12),
        axis.title.x = ggplot2::element_text(size = 14),
        axis.title.y = ggplot2::element_blank(),
        panel.background = ggplot2::element_blank(),
        legend.text = ggplot2::element_text(size = 14),
        legend.title = ggplot2::element_text(size = 14)) +
  ggplot2::geom_hline(yintercept = c(as.numeric(df$x) + .5, .5),
             col = 'white', lwd = 2) +
  ggplot2::geom_text(ggplot2::aes(x = 6, y = 9.65, label = 'stg5'), size = 5)
```

<div class="figure">

<img src="man/figures/README-heatmap2-1.png" alt="Fig. 7. Heatmap comparing the genetic background of parents to NILs on Chr1." width="100%" />
<p class="caption">
Fig. 7. Heatmap comparing the genetic background of parents to NILs on
Chr1.
</p>

</div>

## Troubleshooting

If the app does not run as expected, check the following:

- Was the package properly installed?

- Were any warnings or error messages returned during package
  installation?

- Do you have the required dependencies installed?

- Are all packages up to date?

# Authors and contributors

- [Alexander Wireko Kena](https://www.github.com/awkena)

- [Cruet Burgos](https://www.morrislab.org/people/clara-cruet-burgos)

- [Geoffrey Preston
  Morris](https://www.morrislab.org/people/geoff-morris)

# License

[GNU GPLv3](https://choosealicense.com/licenses/gpl-3.0/)

# Support and Feedback

For support and submission of feedback, email the maintainer **Alexander
Kena, PhD** at <alex.kena24@gmail.com>
