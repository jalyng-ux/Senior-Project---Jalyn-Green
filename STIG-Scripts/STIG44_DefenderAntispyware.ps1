# Script 44 - check windows defender antispyware protection
# Requirement/recommendation: antispyware should be enabled

# check the current setting w/ out changing it
$setting = Get-MpComputerStatus

# display settings
Write-Host "Current Setting: $($setting.AntispywareEnabled)"

# check if antispyware protetcion is enabled 
if ($setting.AntispywareEnabled -eq $true) {
    Write-Host "Status: Compliant"
}
elseif ($setting.AntispywareEnabled -eq $false) {
    Write-Host "Status: Non-Compliant"
    Write-Host "Recommendation: enable windows defender antispyware protection"
}
else {
    Write-Host "Status: Unable to read"
    Write-Host "Recommendation: check windows defender settings manually"
}