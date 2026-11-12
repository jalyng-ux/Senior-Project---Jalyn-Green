# Script 26 - check account lockout failures
# Requirement/recommendation: account lockout failures should be audited

# check the current audit setting w/ out changing it 
$setting = auditpol /get /subcategory:"Account Lockout" | Select-String "Account Lockout"

# display settings 
Write-Host "Current Setting: $setting"

# check if failure auditing is enabled 
if ($setting -match "Failure") {
    Write-Host "Status: Compliant"
}
elseif ($setting) {
    Write-Host "Status: Non-Compliant"
    Write-Host "Recommendation: enable failure auditing for account lockout using group policy"
}
else {
    Write-Host "Status: Unable to read"
    Write-Host "Recommendation: check the audit setting manually"
}