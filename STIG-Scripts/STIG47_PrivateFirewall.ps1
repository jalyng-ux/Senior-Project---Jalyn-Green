# Script 47 - check windows private firewall
# Requirement/recommendation: private firewall should be enabled

# check the current setting w/ out changing it
$setting = Get-NetFirewallProfile -Name Private

# display settings
Write-Host "Current Setting: $($setting.Enabled)"

# check if private firewall is enabled 
if ($setting.Enabled -eq $true) {
    Write-Host "Status: Compliant"
}
elseif ($setting.Enabled -eq $false) {
    Write-Host "Status: Non-Compliant"
    Write-Host "Recommendation: enable private firewall"
}
else {
    Write-Host "Status: Unable to read"
    Write-Host "Recommendation: check windows firewall settings manually"
}