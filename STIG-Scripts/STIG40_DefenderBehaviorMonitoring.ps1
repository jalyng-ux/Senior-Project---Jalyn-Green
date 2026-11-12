# Script 40 - check windows defender behavior monitoring
# Requirement/recommendation: windows defender behavior monitoring should be enabled

# check the current setting w/ out changing it
$setting = Get-MpComputerStatus

# display settings
Write-Host "Current Setting: $($setting.BehaviorMonitorEnabled)"

# check if windows defender behavior monitoring is enabled 
if ($setting.BehaviorMonitorEnabled -eq $true) {
    Write-Host "Status: Compliant"
}
elseif ($setting.BehaviorMonitorEnabled -eq $false) {
    Write-Host "Status: Non-Compliant"
    Write-Host "Recommendation: enable windows defender behavior monitoring"
}
else {
    Write-Host "Status: Unable to read"
    Write-Host "Recommendation: check windows defender settings manually"
}