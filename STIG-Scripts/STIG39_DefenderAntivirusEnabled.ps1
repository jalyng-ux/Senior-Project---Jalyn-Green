# Script 39 - check windows defender antivirus 
# Requirement/recommendation: windows defender antivirus should be enabled

# check the current setting w/ out changing it
$setting = Get-MpComputerStatus

# display settings
Write-Host "Current Setting: $($setting.AntivirusEnabled)"

# check if windows defender antivirus is enabled 
if ($setting.AntivirusEnabled -eq $true) {
    Write-Host "Status: Compliant"
}
elseif ($setting.AntivirusEnabled -eq $false) {
    Write-Host "Status: Non-Compliant"
    Write-Host "Recommendation: enable windows defender antivirus"
}
else {
    Write-Host "Status: Unable to read"
    Write-Host "Recommendation: check windows defender settings manually"
}