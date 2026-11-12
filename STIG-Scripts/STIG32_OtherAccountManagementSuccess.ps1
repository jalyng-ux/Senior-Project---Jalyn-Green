# Script 32 - check other account management events success
# Requirement/recommendation: other account management events should be audited

# check the current audit setting w/ out changing it 
$setting = auditpol /get /subcategory:"Other Account Management Events" | Select-String "Other Account Management Events"

# display settings 
Write-Host "Current Setting: $setting"

# check if success auditing is enabled 
if ($setting -match "Success") {
    Write-Host "Status: Compliant"
}
elseif ($setting) {
    Write-Host "Status: Non-Compliant"
    Write-Host "Recommendation: enable success auditing for other account management events using group policy"
}
else {
    Write-Host "Status: Unable to read"
    Write-Host "Recommendation: check the audit setting manually"
}