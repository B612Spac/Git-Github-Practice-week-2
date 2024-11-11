# Bash Script and Git

## Introduction 
This task is a continuation of bash scripting and introduction to git and github. This report illustrates how bash script was used to select the best baseline model using the f1-score after iterating through a csv file containing multiple machine learning models and generating a report for the best performing model with relevant metrics.

## Procedure
To tackle this task, first I created a script named result_comparison.sh which performs the following: 
1. Locates a CSV file containing model performance metrics. 
2. Identifies the best model based on the F1-score metric. 
3. Extracts key metrics for the best model (Precision, Recall, F1-Score, ROC-AUC). 
4. Generates a Markdown report (baseline_model_report.md) with model details and a link to the corresponding confusion matrix image of the model.

## Script explanation
"" Bash
read -p "Enter path to the csv file(e.g, reports/baseline_model_results.csv): " model_csv
""
This code prompts the user for a csv file with that example directory and saves it in the model_csv variable
