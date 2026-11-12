# Script 50 - check windows firewall outbound connections
# Requirement/recommendation: outbound connections should be allowed

# check the current setting w/ out changing it
$setting = Get-NetFirewallProfile -Name Domain

# display settings
Write-Host "Current Setting: $($setting.DefaultOutboundAction)"

# check if outbound connections are allowed
if ($setting.DefaultOutboundAction -eq "Allow") {
    Write-Host "Status: Compliant"
}
elseif ($setting.DefaultOutboundAction -eq "Block") {
    Write-Host "Status: Non-Compliant"
    Write-Host "Recommendation: look over outbound firewall policy"
}
else {
    Write-Host "Status: Unable to read"
    Write-Host "Recommendation: check windows firewall settings manually"
}