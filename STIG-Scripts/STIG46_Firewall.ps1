# Script 46 - check windows firewall
# Requirement/recommendation: firewall should be enabled

# check the current setting w/ out changing it
$setting = Get-NetFirewallProfile -Name Domain

# display settings
Write-Host "Current Setting: $($setting.Enabled)"

# check if tamper protetcion is enabled 
if ($setting.Enabled -eq $true) {
    Write-Host "Status: Compliant"
}
elseif ($setting.Enabled -eq $false) {
    Write-Host "Status: Non-Compliant"
    Write-Host "Recommendation: enable windows firewall"
}
else {
    Write-Host "Status: Unable to read"
    Write-Host "Recommendation: check windows firewall settings manually"
}