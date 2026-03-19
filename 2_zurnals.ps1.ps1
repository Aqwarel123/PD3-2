$LogName = "Application"
$EntryType = "Warning"
$DaysBack = 3
$OutputFile = "$HOME\Documents\warnings.txt"
$StartTime = (Get-Date).AddDays(-$DaysBack)

Write-Host "Search alerts for the last $DaysBack days..." -ForegroundColor Yellow

if ($Events) {
    $Events | Select-Object TimeCreated, Id, ProviderName, Message |
    Format-List |
    Out-File -FilePath $OutputFile -Encoding utf8
    
    Write-Host "Success! $($Events.Count) events found." -ForegroundColor Green
    Write-Host "The file has been saved: $OutputFile" -ForegroundColor Cyan
} 
else {
    Write-Host "No warnings found for the last $DaysBack days." -ForegroundColor White
    "No warnings found for the last $DaysBack days." | Out-File -FilePath $OutputFile -Encoding utf8
}
