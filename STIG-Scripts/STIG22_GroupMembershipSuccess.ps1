# Script 22 - check group membership successes
# Requirement/recommendation: group memebership successes should be audited 

# check the current audit setting w/ out changing it 
$setting = auditpol /get /subcategory:"Group Membership" | Select-String "Group Membership"

# display settings 
Write-Host "Current Setting: $setting"

# check if success auditing is enabled 
if ($setting -match "Success") {
    Write-Host "Status: Compliant"
}
elseif ($setting) {
    Write-Host "Status: Non-Compliant"
    Write-Host "Recommendation: enable success auditing for group membership using group policy"
}
else {
    Write-Host "Status: Unable to read"
    Write-Host "Recommendation: check the audit setting manually"
}