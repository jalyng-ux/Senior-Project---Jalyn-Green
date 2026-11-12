# Script 38 - check windows defender real-time protection 
# Requirement/recommendation: real-time protection should be enabled

# check the current setting w/ out changing it
$setting = Get-MpComputerStatus

# display settings
Write-Host "Current Setting: $($setting.RealTimeProtectionEnabled)"

# check if real-time protection is enabled 
if ($setting.RealTimeProtectionEnabled -eq $true) {
    Write-Host "Status: Compliant"
}
elseif ($setting.RealTimeProtectionEnabled -eq $false) {
    Write-Host "Status: Non-Compliant"
    Write-Host "Recommendation: enable windows defender real-time protection"
}
else {
    Write-Host "Status: Unable to read"
    Write-Host "Recommendation: check windows defender settings manually"
}

