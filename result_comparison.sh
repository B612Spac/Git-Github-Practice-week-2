#!/bin/bash


#Prompt the user for csv file path 
read -p "Enter path to the csv file(e.g, reports/baseline_model_results.csv): " model_csv


#Check if the file exists
if [[ ! -f "$model_csv" ]]; then 
	echo "csv file not found. Please check path and try again"
	exit 1 
fi 

#Extract the best model by f1-score 
best_model=$(tail -n +2 "$model_csv" | sort -t, -k5 -nr | head -1)

#Output the best model based on F1-Score
if [[ -n "$best_model" ]]; then
#Extract individual fields from the best model line
	data_version=$(echo "$best_model" | awk -F, '{print  $1}')
	model_name=$(echo "$best_model" | awk -F, '{print $2}')
	precision=$(echo "$best_model" | awk -F, '{print $3}')
	recall=$(echo "$best_model" | awk -F, '{print $4}')
	f1_score=$(echo "$best_model" | awk -F, '{print $5}')
	roc_auc=$(echo "$best_model" | awk -F, '{print $6}')

	#Create markdown report
	report_file="baseline_model_report.md"
	echo "# Baseline Model Report" > "$report_file"
	echo "## Best Model based on F1-score" >> "$report_file"
	echo "- Model: $model_name" >> "$report_file"
	echo "- Data version: $data_version" >> "$report_file"
	echo "" >> "$report_file"
	echo "### Key Performance Metrics" >> "$report_file"
	echo "- Precision: $precision" >> "$report_file"
	echo "- Recall: $recall" >> "$report_file"
	echo "- F1-Score: $f1_score" >> "$report_file"
	echo "- POC-AUC: $roc_auc" >> "$report_file"
	echo "" >> "$report_file"
	echo "### Confusion Matrix" >> "$report_file"
	echo "![Confusion Matrix](reports/$data_version_$model_name_confusion_matrix.png)" >> "$report_file"

	echo "Markdown report gnerated: $report_file"
else 
	echo "No models found in the specified CSV."
	exit 1
fi 


