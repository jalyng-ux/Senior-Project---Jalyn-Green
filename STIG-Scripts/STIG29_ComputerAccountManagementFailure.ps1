# Script 29 - check computer account management failure
# Requirement/recommendation:  computer account management failure should be audited

# check the current audit setting w/ out changing it 
$setting = auditpol /get /subcategory:"Computer Account Management" | Select-String "Computer Account Management"

# display settings 
Write-Host "Current Setting: $setting"

# check if failure auditing is enabled 
if ($setting -match "Failure") {
    Write-Host "Status: Compliant"
}
elseif ($setting) {
    Write-Host "Status: Non-Compliant"
    Write-Host "Recommendation: enable failure auditing for computer account management using group policy"
}
else {
    Write-Host "Status: Unable to read"
    Write-Host "Recommendation: check the audit setting manually"
}