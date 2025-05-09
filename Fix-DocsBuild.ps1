# Path to the Build folder and index.html inside 'docs'
$buildPath = ".\docs\Build"
$indexPath = ".\docs\index.html"

# Rename files with spaces in the Build folder
Get-ChildItem -Path $buildPath -Filter "*ChromeOS Version*" | ForEach-Object {
    $oldName = $_.Name
    $newName = $oldName -replace "ChromeOS Version", "ChromeOS_Version"
    Rename-Item -Path $_.FullName -NewName $newName
    Write-Host "Renamed: $oldName → $newName"
}

# Update references in index.html
(Get-Content $indexPath) -replace "ChromeOS Version", "ChromeOS_Version" | Set-Content $indexPath
Write-Host "✅ Updated index.html references"
