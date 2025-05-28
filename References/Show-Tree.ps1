# Prompt user for path and depth
$path = Read-Host "Enter the folder path (or leave blank for current directory)"
if ([string]::IsNullOrWhiteSpace($path)) {
    $path = Get-Location
}
$maxDepthInput = Read-Host "Enter the maximum depth (e.g., 2)"
[int]$maxDepth = $maxDepthInput  # ✅ Correctly cast to integer

# Set up output file
$outputFile = Join-Path -Path $path -ChildPath "tree_output.txt"
"" | Out-File -FilePath $outputFile

# Define the tree function
function Show-Tree {
    param (
        [string]$Path,
        [int]$MaxDepth,
        [int]$CurrentDepth = 0
    )

    if ($CurrentDepth -ge $MaxDepth) { return }

    Get-ChildItem -LiteralPath $Path -Force | ForEach-Object {
        $prefix = ('|   ' * $CurrentDepth) + '+-- '
        $line = "$prefix$($_.Name)"
        $line | Out-File -FilePath $outputFile -Append

        if ($_.PSIsContainer) {
            Show-Tree -Path $_.FullName -MaxDepth $MaxDepth -CurrentDepth ($CurrentDepth + 1)
        }
    }
}

# Run the tree builder
Show-Tree -Path $path -MaxDepth $maxDepth

# Notify user and open the result
Write-Host "Tree structure saved to: $outputFile"
notepad $outputFile
