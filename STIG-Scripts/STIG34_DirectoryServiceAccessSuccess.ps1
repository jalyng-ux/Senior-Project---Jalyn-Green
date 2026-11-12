# Script 34 - check directory service access success
# Requirement/recommendation: directory service access success should be audited

# check the current audit setting w/ out changing it 
$setting = auditpol /get /subcategory:"Directory Service Access" | Select-String "Directory Service Access"
# display settings 
Write-Host "Current Setting: $setting"

# check if success auditing is enabled 
if ($setting -match "Success") {
    Write-Host "Status: Compliant"
}
elseif ($setting) {
    Write-Host "Status: Non-Compliant"
    Write-Host "Recommendation: enable success auditing for directory service access using group policy"
}
else {
    Write-Host "Status: Unable to read"
    Write-Host "Recommendation: check the audit setting manually"
}