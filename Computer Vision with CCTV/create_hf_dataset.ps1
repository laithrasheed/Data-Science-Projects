# Prompt the user
$datasetName = Read-Host "Enter the name of the dataset"
$username = Read-Host "Enter your Hugging Face username"
# --- BEGIN: Force correct token to override environment ---
$tokenPath = Read-Host "Enter the full path to your HF token file (e.g. D:\hf_token.txt)"
$token = $token = Get-Content $tokenPath | Out-String #Get-Content $tokenPath -Raw
$env:HF_TOKEN = $token
Write-Host "Token set successfully for this session."
# --- END: Force correct token ---


# Run Python inside .venv
$venvPython = ".\.venv\Scripts\python.exe"

# Execute Python script
& $venvPython create_hf_dataset_script.py --dataset "$datasetName" --username "$username" --token_path "$tokenPath"
