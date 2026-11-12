# Script 34 - check directory service changes success
# Requirement/recommendation: directory service changes success should be audited

# check the current audit setting w/ out changing it 
$setting = auditpol /get /subcategory:"Directory Service Changes" | Select-String "Directory Service Changes"
# display settings 
Write-Host "Current Setting: $setting"

# check if success auditing is enabled 
if ($setting -match "Success") {
    Write-Host "Status: Compliant"
}
elseif ($setting) {
    Write-Host "Status: Non-Compliant"
    Write-Host "Recommendation: enable success auditing for directory service changes using group policy"
}
else {
    Write-Host "Status: Unable to read"
    Write-Host "Recommendation: check the audit setting manually"
}