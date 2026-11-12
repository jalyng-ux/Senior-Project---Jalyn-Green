# Script 48 - check windows public firewall
# Requirement/recommendation: public firewall should be enabled

# check the current setting w/ out changing it
$setting = Get-NetFirewallProfile -Name Public

# display settings
Write-Host "Current Setting: $($setting.Enabled)"

# check if public firewall is enabled 
if ($setting.Enabled -eq $true) {
    Write-Host "Status: Compliant"
}
elseif ($setting.Enabled -eq $false) {
    Write-Host "Status: Non-Compliant"
    Write-Host "Recommendation: enable public firewall"
}
else {
    Write-Host "Status: Unable to read"
    Write-Host "Recommendation: check windows firewall settings manually"
}