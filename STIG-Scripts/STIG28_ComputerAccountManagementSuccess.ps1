# Script 28 - check computer account management success
# Requirement/recommendation:  computer account management success should be audited

# check the current audit setting w/ out changing it 
$setting = auditpol /get /subcategory:"Computer Account Management" | Select-String "Computer Account Management"

# display settings 
Write-Host "Current Setting: $setting"

# check if success auditing is enabled 
if ($setting -match "Success") {
    Write-Host "Status: Compliant"
}
elseif ($setting) {
    Write-Host "Status: Non-Compliant"
    Write-Host "Recommendation: enable success auditing for computer account management using group policy"
}
else {
    Write-Host "Status: Unable to read"
    Write-Host "Recommendation: check the audit setting manually"
}