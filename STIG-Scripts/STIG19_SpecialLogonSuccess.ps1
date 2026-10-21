# Script 19 - check special logon successes
# From: V-253318
# Requirement/recommendation: special logon successes should be audited 

# check the current audit setting w/ out changing it 
$setting = auditpol /get /subcategory:"Special Logon" | Select-String "Special Logon"

# display settings 
Write-Host "Current Setting: $setting"

# check if success auditing is enabled 
if ($setting -match "Success") {
    Write-Host "Status: Compliant"
}
elseif ($setting) {
    Write-Host "Status: Non-Compliant"
    Write-Host "Recommendation: enable success auditing for special logon using group policy"
}
else {
    Write-Host "Status: Unable to read"
    Write-Host "Recommendation: check the audit setting manually"
}