## Metadata for raw data

**file name**: Markov_Blankets.xlsx

**format**: Excel .xlsx file

The file contains the Conditional Probability Tables resulting from the data collection and expert consultation process. The data is in the form of a multi-sheet excel file. Each sheet contains a single CPT.

There are 5 sheets for the root nodes of the Bayesian Network. The rows corresponds to the possible states of the nodes (limited to 2 per node, for example, "Expansion" and "Return_to_Marshland"), and the single column ("Probability") holds the prior probability associated with that state. The sheets are:

-   **HD**, CPT for the Human Development node.
-   **EW**, CPT for the Extreme Weather node.
-   **FC**, CPT for the Financial Constraints node.
-   **MAR**, CPT for the Saltmarsh node.
-   **DMK**, CPT for the Decision Maker Knowledge node.

There are 3 sheets for the intermediate nodes. The rows corresponds to the possible states of the first node in the sheet name, and the columns corresponds either to the possible states of the second node in the sheet name, or the state combination for the remaining nodes in the sheet name. For example, in the "TID_and_EW_and_MAR" sheet, rows are the states for Tides, while the columns corresponds to the combinations of states for Extreme Weather and Saltmarsh ("Above_Average_EW:Present_MAR" is for the combination of above average extreme weather and Saltmarsh being present). The cells of the tables holds the prior probability associated with that combination of states. The sheets are:

-   **IJ_and_HD**, for the intersection of Ice Jams frequency and Human Development.
-   **TID_and_EW_and_MAR**, for the intersection of Tides, Extreme Weather and Saltmarsh.
-   **DMNT_and_FC_and_DMK**, for the intersection of Dyke Maintenance, Financial Constraints and Decision Maker Knowledge.

There is one sheet for the target node of the network. The rows corresponds to the possible states of the target node, and the columns corresponds to the state combination for the remaining nodes in the sheet name. The cells of the tables holds the prior probability associated with that combination of states. The sheets is:

-   **FL_and_IJ_and_TID_and_DMNT**, for the intersection of Ice Jams, Tides, Decision Maker Knowledge and Flood Risk.
