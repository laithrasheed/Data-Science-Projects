# This script updates requirements.txt from Poetry, commits the changes to Git, and pushes to the main branch.
poetry export -f requirements.txt --output requirements.txt --without-hashes
git add requirements.txt
git commit -m "Update requirements.txt"
git push origin main
Write-Host "requirements.txt updated and committed to Git!"