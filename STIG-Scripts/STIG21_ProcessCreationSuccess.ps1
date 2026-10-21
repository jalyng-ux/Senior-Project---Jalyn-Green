# Script 21 - check process creation successes
# Requirement/recommendation: process creation successes should be audited 

# check the current audit setting w/ out changing it 
$setting = auditpol /get /subcategory:"Process Creation" | Select-String "Process Creation"

# display settings 
Write-Host "Current Setting: $setting"

# check if success auditing is enabled 
if ($setting -match "Success") {
    Write-Host "Status: Compliant"
}
elseif ($setting) {
    Write-Host "Status: Non-Compliant"
    Write-Host "Recommendation: enable success auditing for process creation using group policy"
}
else {
    Write-Host "Status: Unable to read"
    Write-Host "Recommendation: check the audit setting manually"
}