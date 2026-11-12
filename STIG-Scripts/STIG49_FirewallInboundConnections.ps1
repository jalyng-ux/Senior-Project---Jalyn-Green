# Script 49 - check windows firewall inbound connections
# Requirement/recommendation: incbound connections should be blocked

# check the current setting w/ out changing it
$setting = Get-NetFirewallProfile -Name Domain

# display settings
Write-Host "Current Setting: $($setting.DefaultInboundAction)"

# check if inbound connections are blocked
if ($setting.DefaultInboundAction -eq "Block") {
    Write-Host "Status: Compliant"
}
elseif ($setting.DefaultInboundAction -eq "Allow") {
    Write-Host "Status: Non-Compliant"
    Write-Host "Recommendation: block inbound connections by default"
}
else {
    Write-Host "Status: Unable to read"
    Write-Host "Recommendation: check windows firewall settings manually"
}