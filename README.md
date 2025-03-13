
<!-- README.md is generated from README.Rmd. Please edit that file -->

## Measuring the degree of ‘fit’ within social-ecological systems to support local decision-making

<!-- badges: start -->

[![DOI
Badge](https://img.shields.io/badge/DOI-10.1111/jfr3.70006-blue.svg)](http://dx.doi.org/10.1111/jfr3.70006)
[![Citation
Badge](https://api.juleskreuer.eu/citation-badge.php?doi=10.1111/jfr3.70006)](https://juleskreuer.eu/citation-badge/)
<!-- badges: end -->

Imogen Hobbs, Valentin Lucet, Jennifer Holzer, Julia Baird, and Gordon
M. Hickey

*Effective social-ecological fit is considered essential for properly
managing social-ecological systems. Despite this importance, the concept
of social-ecological fit lacks the following: clarity in scope and
definition, a practical quantitative method to assess effectiveness, and
methods capable of equally assessing the social and ecological factors
within the system being managed. To address these knowledge gaps, we
reviewed how social-ecological fit has been conceptualised in the
literature and then tested the use of Bayesian Belief networks and
analysis to quantitatively assess “fit” using the case of flooding in
the North Onslow saltmarsh region of Truro, Nova Scotia. The objective
of this study was to assess which decision-making choices would most
likely reduce flood risk, and therefore achieve the best ‘fit’. Drawing
from a combination of existing literature and local expert opinion, we
identified the relevant factors influencing flood risk in the region,
their relationship to each other and their combined relationship to
local flood risk. Ice jam frequency, high tide frequency and dyke
maintenance were found to have the most influence. The results of this
study can be used to inform local flood-risk-related decision-making in
Truro and act as a model for quantitatively assessing social-ecological
fit in other risk management settings.*

### How to reproduce

1.  Clone this repository.
2.  Use `renv::restore` to install all the packages necessary for this
    analysis. Note that you may need to install BioConductor packages
    manually as prompted.
3.  Run the
    [`1_analyse_BN_truro.Rmd`](https://github.com/VLucet/bn-flood-truro/blob/main/scripts/1_analyse_BN_truro.Rmd)
    file.

Alternatively, you can download and open the [knitted html
file](https://github.com/VLucet/bn-flood-truro/blob/main/docs/index.html)
resulting from the markdown file.

### Data format

See the [data
readme](https://github.com/VLucet/bn-flood-truro/blob/main/data/README.md)
for a detailed description of the excel data format.

### Citation

    @article{Hobbs2025-yb,
      title     = "Measuring the degree of `fit' within social‐ecological systems
                   to support local flood risk decision‐making",
      author    = "Hobbs, Imogen and Lucet, Valentin and Holzer, Jennifer M and
                   Baird, Julia and Hickey, Gordon M",
      journal   = "Journal of Flood Risk Management",
      publisher = "Wiley",
      volume    =  18,
      number    =  1,
      month     =  mar,
      year      =  2025,
      copyright = "http://creativecommons.org/licenses/by/4.0/",
      language  = "en",
      url       = "http://dx.doi.org/10.1111/jfr3.70006",
      doi       = "10.1111/jfr3.70006"
    }
