$procesi = Get-Process | Where-Object {$_.WorkingSet -gt 150MB -and $_.Name -ne "msedge"}
$procesi | Select-Object Name, Id, WorkingSet | Export-Csv "$env:USERPROFILE\Documents\LielieProcesi.csv" -NoTypeInformation
