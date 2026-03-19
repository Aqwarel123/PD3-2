$no= "$env:USERPROFILE\Downloads\*.pdf"
$uz = "$env:USERPROFILE\Documents\PDF_Backup.zip"

$files = Get-ChildItem $source | Where-Object {
    $_.LastWriteTime -gt (Get-Date).AddHours(-48)
}

Compress-Archive -Path $files -DestinationPath $uz -Force