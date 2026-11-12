# Script 33 - check directory service access failure
# Requirement/recommendation: directory service access failure should be audited

# check the current audit setting w/ out changing it 
$setting = auditpol /get /subcategory:"Directory Service Access" | Select-String "Directory Service Access"

# display settings 
Write-Host "Current Setting: $setting"

# check if failure auditing is enabled 
if ($setting -match "Failure") {
    Write-Host "Status: Compliant"
}
elseif ($setting) {
    Write-Host "Status: Non-Compliant"
    Write-Host "Recommendation: enable failure auditing for directory service access using group policy"
}
else {
    Write-Host "Status: Unable to read"
    Write-Host "Recommendation: check the audit setting manually"
}