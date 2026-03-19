$apps = winget list | Select-String "msstore"

$count = $apps.Count

Write-Output "Sistēmā ir instalētas $count aplikācijas no Microsoft Store."