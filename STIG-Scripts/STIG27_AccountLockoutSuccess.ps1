# Script 27 - check account lockout success
# Requirement/recommendation: account lockout success should be audited

# check the current audit setting w/ out changing it 
$setting = auditpol /get /subcategory:"Account Lockout" | Select-String "Account Lockout"

# display settings 
Write-Host "Current Setting: $setting"

# check if success auditing is enabled 
if ($setting -match "Success") {
    Write-Host "Status: Compliant"
}
elseif ($setting) {
    Write-Host "Status: Non-Compliant"
    Write-Host "Recommendation: enable success auditing for account lockout using group policy"
}
else {
    Write-Host "Status: Unable to read"
    Write-Host "Recommendation: check the audit setting manually"
}