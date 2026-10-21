# Script 18 - check removeable storage success
# From: V-253324
# Requirement/recommendation: removable storage success should be audited 

# check the current audit setting w/ out changing it 
$setting = auditpol /get /subcategory:"Removable Storage" | Select-String "Removable Storage"

# display settings 
Write-Host "Current Setting: $setting"

# check if success auditing is enabled 
if ($setting -match "Success") {
    Write-Host "Status: Compliant"
}
elseif ($setting) {
    Write-Host "Status: Non-Compliant"
    Write-Host "Recommendation: enable success auditing for removeable storage using group policy"
}
else {
    Write-Host "Status: Unable to read"
    Write-Host "Recommendation: check the audit setting manually"
}