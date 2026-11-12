# Script 30 - check distribution group management success
# Requirement/recommendation: distribution group management success should be audited

# check the current audit setting w/ out changing it 
$setting = auditpol /get /subcategory:"Distribution Group Management" | Select-String "Distribution Group Management"

# display settings 
Write-Host "Current Setting: $setting"

# check if success auditing is enabled 
if ($setting -match "Success") {
    Write-Host "Status: Compliant"
}
elseif ($setting) {
    Write-Host "Status: Non-Compliant"
    Write-Host "Recommendation: enable success auditing for distribution group management using group policy"
}
else {
    Write-Host "Status: Unable to read"
    Write-Host "Recommendation: check the audit setting manually"
}