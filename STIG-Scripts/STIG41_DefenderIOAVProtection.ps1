# Script 41 - check windows defender IOAV protection 
# Requirement/recommendation: windows defender IOAV should be enabled

# check the current setting w/ out changing it
$setting = Get-MpComputerStatus

# display settings
Write-Host "Current Setting: $($setting.IoavProtectionEnabled)"

# check if windows defender IOAV protection is enabled 
if ($setting.IoavProtectionEnabled -eq $true) {
    Write-Host "Status: Compliant"
}
elseif ($setting.IoavProtectionEnabled -eq $false) {
    Write-Host "Status: Non-Compliant"
    Write-Host "Recommendation: enable windows defender IOAV protection"
}
else {
    Write-Host "Status: Unable to read"
    Write-Host "Recommendation: check windows defender settings manually"
}