# Script 42 - check windows defender on-access protection 
# Requirement/recommendation: on-access protection should be enabled

# check the current setting w/ out changing it
$setting = Get-MpComputerStatus

# display settings
Write-Host "Current Setting: $($setting.OnAccessProtectionEnabled)"

# check if on-access protection is enabled 
if ($setting.OnAccessProtectionEnabled -eq $true) {
    Write-Host "Status: Compliant"
}
elseif ($setting.OnAccessProtectionEnabled -eq $false) {
    Write-Host "Status: Non-Compliant"
    Write-Host "Recommendation: enable windows defender on-access protection"
}
else {
    Write-Host "Status: Unable to read"
    Write-Host "Recommendation: check windows defender settings manually"
}