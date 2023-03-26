#!/bin/bash
folder_name="deploy_lambda_function"
function_name="lambda_function.py"
package_name="lambda_function_api_requests.zip"

# Create a new folder and move lambda function there
mkdir $folder_name
cp $function_name ./$folder_name
cd $folder_name

# Install boto3 package in the folder
pip install boto3 -t .

# Create the lambda package
zip -r $package_name .

# Remove the unnecessary items
mv $package_name ../
cd ..
rm -r $folder_name