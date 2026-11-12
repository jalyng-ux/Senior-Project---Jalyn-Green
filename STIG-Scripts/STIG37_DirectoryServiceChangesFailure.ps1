# Script 37 - check directory service changes failure
# Requirement/recommendation: directory service changes failure should be audited

# check the current audit setting w/ out changing it 
$setting = auditpol /get /subcategory:"Directory Service Changes" | Select-String "Directory Service Changes"

# display settings 
Write-Host "Current Setting: $setting"

# check if failure auditing is enabled 
if ($setting -match "Failure") {
    Write-Host "Status: Compliant"
}
elseif ($setting) {
    Write-Host "Status: Non-Compliant"
    Write-Host "Recommendation: enable failure auditing for directory service changes using group policy"
}
else {
    Write-Host "Status: Unable to read"
    Write-Host "Recommendation: check the audit setting manually"
}