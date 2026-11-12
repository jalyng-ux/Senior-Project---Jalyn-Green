# Script 45 - check windows defender tamper protection
# Requirement/recommendation: tamper protection should be enabled

# check the current setting w/ out changing it
$setting = Get-MpComputerStatus

# display settings
Write-Host "Current Setting: $($setting.IsTamperProtected)"

# check if tamper protetcion is enabled 
if ($setting.IsTamperProtected -eq $true) {
    Write-Host "Status: Compliant"
}
elseif ($setting.IsTamperProtected -eq $false) {
    Write-Host "Status: Non-Compliant"
    Write-Host "Recommendation: enable windows defender tamper protection"
}
else {
    Write-Host "Status: Unable to read"
    Write-Host "Recommendation: check windows defender settings manually"
}