# setup-venv-kernel.ps1

Write-Host "Checking Poetry installation..."
if (-not (Get-Command poetry -ErrorAction SilentlyContinue)) {
    Write-Error "Poetry is not installed. Please install Poetry first."
    exit 1
}

# Ensure we are in a Poetry project
if (-not (Test-Path "./pyproject.toml")) {
    Write-Error "No pyproject.toml found. Are you in a Poetry project directory?"
    exit 1
}

# Step 1: Install notebook and ipykernel if not already added
Write-Host "Ensuring 'notebook' and 'ipykernel' are installed..."
$installedPackages = poetry show --no-ansi

if ($installedPackages -notmatch "notebook") {
    Write-Host "Installing 'notebook'..."
    poetry add notebook
} else {
    Write-Host "'notebook' already installed."
}

if ($installedPackages -notmatch "ipykernel") {
    Write-Host "Installing 'ipykernel'..."
    poetry add ipykernel
} else {
    Write-Host "'ipykernel' already installed."
}

# Step 2: Register the kernel
Write-Host "Registering the Jupyter kernel..."

$kernelName = ".venv"
$displayName = ".venv (Poetry Env)"
poetry run python -m ipykernel install --user --name=$kernelName --display-name=$displayName

Write-Host "Kernel '$displayName' registered successfully!"
