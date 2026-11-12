# Script 43 - check windows defender network inspection 
# Requirement/recommendation: network inspection should be enabled

# check the current setting w/ out changing it
$setting = Get-MpComputerStatus

# display settings
Write-Host "Current Setting: $($setting.NISEnabled)"

# check if network inspection is enabled 
if ($setting.NISEnabled -eq $true) {
    Write-Host "Status: Compliant"
}
elseif ($setting.NISEnabled -eq $false) {
    Write-Host "Status: Non-Compliant"
    Write-Host "Recommendation: enable windows defender network inspection"
}
else {
    Write-Host "Status: Unable to read"
    Write-Host "Recommendation: check windows defender settings manually"
}