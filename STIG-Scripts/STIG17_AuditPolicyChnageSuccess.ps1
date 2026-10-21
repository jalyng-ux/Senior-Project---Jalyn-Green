# Script 17 - check audit policy change success
# From: V-253325
# Requirement/recommendation: audit policy change success should be audited 

# check the current audit setting w/ out changing it 
$setting = auditpol /get /subcategory:"Audit Policy Change" | Select-String "Audit Policy Change"

# display settings 
Write-Host "Current Setting: $setting"

# check if success auditing is enabled 
if ($setting -match "Success") {
    Write-Host "Status: Compliant"
}
elseif ($setting) {
    Write-Host "Status: Non-Compliant"
    Write-Host "Recommendation: enable success auditing for audit policy change using group policy"
}
else {
    Write-Host "Status: Unable to read"
    Write-Host "Recommendation: check the audit setting manually"
}