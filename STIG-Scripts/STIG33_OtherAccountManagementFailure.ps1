# Script 33 - check other account management events failure
# Requirement/recommendation: other account management events failure should be audited

# check the current audit setting w/ out changing it 
$setting = auditpol /get /subcategory:"Other Account Management Events" | Select-String "Other Account Management Events"

# display settings 
Write-Host "Current Setting: $setting"

# check if failure auditing is enabled 
if ($setting -match "Failure") {
    Write-Host "Status: Compliant"
}
elseif ($setting) {
    Write-Host "Status: Non-Compliant"
    Write-Host "Recommendation: enable failure auditing for other account management events  using group policy"
}
else {
    Write-Host "Status: Unable to read"
    Write-Host "Recommendation: check the audit setting manually"
}