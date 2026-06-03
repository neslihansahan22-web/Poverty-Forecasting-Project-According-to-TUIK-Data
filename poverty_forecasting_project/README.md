\# TUIK Forecasting Project

\#\# 1\. Project Overview  
This project develops an R-based time series forecasting analysis using a dataset obtained from the TUIK Data Portal. The main objective is to forecast the next annual value of the Poverty Rate for the İstanbul region using the most recently available TUIK data.

The selected variable is the Poverty Rate (%). The analysis applies alternative quantitative forecasting methods, compares their forecast accuracy, selects the superior method, and produces a forecast for the next available period.

\#\# 2\. Data Source and TUIK Connection  
The data were accessed directly from the TUIK Data Portal using the \`tuikr\` R package.

\* \*\*TUIK dataset name:\*\* Income and Living Conditions Survey Regional Results  
\* \*\*TUIK theme/category:\*\* Income and Living Conditions  
\* \*\*TUIK table name:\*\* Number of the poor, poverty rate and poverty gap by equivalised household disposable income  
\* \*\*TUIK dataflow ID:\*\* NA because the selected table is an istab table (\`tables\_7\`)  
\* \*\*Selected variable:\*\* Poverty Rate (%) calculated based on 50% of the median equivalised household disposable income (İstanbul Region)  
\* \*\*Data frequency:\*\* Annual  
\* \*\*Time coverage:\*\* 2006 \- 2025  
\* \*\*Latest available observation:\*\* 2025  
\* \*\*Forecast target period:\*\* 2026  
\* \*\*Date of data access:\*\* 2026-06-03  
\* \*\*R package used for data access:\*\* \`tuikr\`

The selected table was identified through \`tuikr::statistical\_tables()\`. Since the table is an istab type table and does not provide a standard dataflow ID, the official TUIK table data structure was accessed reproducibly in R. No manually downloaded, manually edited, copy-pasted, or externally prepared data file was used. The data access, formatting, filtering, and time series transformation steps were all performed inside the R Markdown notebook.

\#\# 3\. Research Objective  
The objective of this project is to forecast the next annual value of the Poverty Rate for the İstanbul region.

The Poverty Rate is meaningful for forecasting because it measures social welfare, income distribution inequalities, and economic vulnerability patterns over time. Since the selected regional poverty series is observed annually and has a historical coverage from 2006 to 2025, it is suitable for time series trend analysis. The latest available observation in the selected TUIK table is 2025; therefore, the forecast target period is 2026\.

\#\# 4\. Use of TUIK Data in R  
The TUIK data were imported directly in R. The raw TUIK table was published in a wide format where rows represented categorical indicators (poverty thresholds, number of poor, poverty rates for different median thresholds) and columns represented time steps. It also contained metadata and header rows. Therefore, the notebook filtered the row specific to the 12th entry ("Poverty rate (%) based on 50% of median income") and transformed it into a clean, long time series object.

The following R-based adjustments were made:  
\* The specific poverty rate variable for the selected threshold was isolated.  
\* Structural metadata rows and unindexed parameters were filtered out.  
\* The historical timeline was converted into an annual numerical time series.  
\* Missing values and duplicate periods were checked and verified to be zero.  
\* The final vector was formalised into a time series object (\`ts\`) with \`start \= 2006\` and \`frequency \= 1\`.

\#\# 5\. Exploratory Time Series Analysis  
The selected İstanbul poverty rate series displays a continuous baseline pattern combined with long-term fluctuations. Unlike rapid macroeconomic indices, poverty indices change gradually but maintain directional momentum over years. 

The data validation results were:  
\* \*\*Missing values:\*\* 0  
\* \*\*Duplicate periods:\*\* 0  
\* \*\*Number of observations:\*\* 20  
\* \*\*Time coverage:\*\* 2006 \- 2025  
\* \*\*Latest available observation:\*\* 2025  
\* \*\*Forecast target period:\*\* 2026

There are no missing or duplicate annual periods in the final forecasting dataset. The consistency of the data allowed for immediate application of quantitative modeling techniques.

\#\# 6\. Forecasting Methods Applied  
The following structural forecasting methods were evaluated for the annual series:  
\* \*\*Naive Forecasting:\*\* Applicable. Used as a baseline benchmark method where the forecast for 2026 equals the 2025 observation.  
\* \*\*Linear Trend Projection:\*\* Applicable. Used to capture the long-term deterministic trajectory of poverty rates by regressing the values against a chronological year index.

\*(Note: Advanced seasonal forecasting methods, such as seasonal dummies or decompositions, were omitted as the dataset frequency is strictly annual and contains no seasonal sub-periods).\*

\#\# 7\. Forecast Accuracy Comparison  
The candidate methods were compared using standard performance measures calculated via empirical residuals ($e\_t \= Y\_t \- \\hat{Y}\_t$).

The complete accuracy comparison results:

| Method | Bias | MAD | MSE | MAPE | RSFE | Tracking Signal |  
| :--- | :--- | :--- | :--- | :--- | :--- | :--- |  
| \*\*Naive Model\*\* | \-2.1975e-01 | 0.4871765 | 0.3458358 | 3.351212 | \-3.7358e+00 | \-7.668269e+00 |  
| \*\*Trend Model\*\* | \-1.7578e-16 | 0.4812996 | 0.3323021 | 3.258043 | \-3.5527e-15 | \-7.381502e-15 |

The complete accuracy comparison table is saved in: \`outputs/tables/accuracy\_comparison.csv\`

\#\# 8\. Selection of the Superior Method  
The selected superior method is the \*\*Trend Model (Linear Regression Trend Projection)\*\*.

The selection is justified mathematically by looking at error minimization. The Trend Model yields a lower Mean Absolute Percentage Error (\*\*MAPE: 3.258%\*\* vs \*\*3.351%\*\*), lower Mean Absolute Deviation (\*\*MAD: 0.4812\*\* vs \*\*0.4871\*\*), and lower Mean Squared Error (\*\*MSE: 0.3323\*\* vs \*\*0.3458\*\*) than the Naive model. 

Crucially, the Trend Model exhibits a Bias, Running Sum of Forecast Errors (RSFE), and Tracking Signal of practically \*\*0\*\* (scaled at $10^{-15}$ and $10^{-16}$). This statistical equilibrium confirms that the model is perfectly centered, removing systematic over- or under-forecasting tendencies. In contrast, the Naive model demonstrates a negative Tracking Signal (-7.66), indicating a structural lag in adaptation.

\#\# 9\. Final Next-Period Forecast  
The final forecast result is:  
\* \*\*Selected superior method:\*\* Trend Model  
\* \*\*Date of data access:\*\* 2026-06-03  
\* \*\*Latest available TUIK observation:\*\* 2025  
\* \*\*Forecast target period:\*\* 2026  
\* \*\*Forecasted value:\*\* \*\*12.88731%\*\*

The final forecast table is saved in: \`outputs/tables/final\_forecast.csv\`

\#\# 10\. Interpretation of Results  
The selected model projects the İstanbul region poverty rate for the year 2026 as approximately \*\*12.89%\*\*. 

This implies that, based on the historical structural baseline and the continuous longitudinal momentum of the dataset, the poverty rate is statistically estimated to transition towards 12.89% in the target period. This output is a purely mathematical, univariate projection based on historical patterns. It does not account for external macroeconomic policy interventions, unexpected regional wealth distribution shifts, or sudden institutional changes.

\#\# 11\. Limitations  
\* \*\*Univariate Modeling Constraints:\*\* The project applies a univariate time series framework. The models rely solely on historical poverty figures and exclude highly relevant external covariates such as inflation rates, regional employment dynamics, social transfer shifts, minimum wage policies, and macro-economic shocks.  
\* \*\*Sample Size Limitation:\*\* Annual regional data yields fewer observations compared to high-frequency monthly series, limiting the capability to implement highly complex autoregressive architectures (e.g., high-order ARIMA).  
\* \*\*Deterministic Trend Assumption:\*\* The linear regression trend model assumes that the directional momentum will remain constant without structural breaks, which might be vulnerable to abrupt socio-economic shifts.

\#\# 12\. Reproducibility  
Another user can reproduce the project by following these steps:  
1\. Clone or download the project repository.  
2\. Open \`poverty\_forecasting\_project.Rproj\` in RStudio.  
3\. Open \`forecasting\_project.Rmd\`.  
4\. Click the \*\*"Knit"\*\* button in RStudio to render the notebook to HTML.

The notebook will automatically connect to the TUIK data environment, execute data cleaning, re-evaluate the algorithms, export the statistical tables into \`outputs/tables/\`, and generate the final reporting visualizations.

\#\# 13\. Repository Structure  
\`\`\`text  
poverty\_forecasting\_project/  
├── README.md  
├── forecasting\_project.Rmd  
├── forecasting\_project.html  
├── outputs/  
│   ├── tables/  
│   │   ├── accuracy\_comparison.csv  
│   │   └── final\_forecast.csv  
│   └── figures/  
│       ├── actual\_series\_plot.png  
│       ├── naive\_forecast\_plot.png  
│       ├── trend\_projection\_plot.png  
│       └── superior\_method\_plot.png  
├── R/  
│   ├── data\_import.R  
│   ├── forecasting\_methods.R  
│   ├── accuracy\_measures.R  
│   └── plots.R  
├── poverty\_forecasting\_project.Rproj  
└── .gitignore  
