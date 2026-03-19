# Get Defender status
$defenderStatus = Get-MpComputerStatus

# Initialize score
$score = 100

# 1. Check Real-Time Protection (-50)
if ($defenderStatus.RealTimeProtectionEnabled -eq $false) {
    $score -= 50
}

# 2. Check Antivirus Signature Age (-20 if > 3 days)
if ($defenderStatus.AntivirusSignatureAge -gt 3) {
    $score -= 20
}

# 3. Check Quick Scan Age (-20 if > 7 days)
if ($defenderStatus.QuickScanAge -gt 7) {
    $score -= 20
}

# Ensure score does not go below 0
if ($score -lt 0) { $score = 0 }

# Output result
Write-Host "Security Rating: $score / 100"
