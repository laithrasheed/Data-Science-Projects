# Prompt user
$datasetName = Read-Host "Enter the dataset name (must match HF)"
$username = Read-Host "Enter your Hugging Face username"
$tokenPath = Read-Host "Enter the full path to your HF token file"
$dataPath = Read-Host "Enter the full path to the local folder containing MP4 files"

# Run Python inside .venv
$venvPython = ".\.venv\Scripts\python.exe"
& $venvPython upload_mp4_to_raw_script.py --dataset "$datasetName" --username "$username" --token_path "$tokenPath" --data_path "$dataPath"
