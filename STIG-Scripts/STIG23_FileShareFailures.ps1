# Script 23 - Check File Share Failures 
# Requirement/recommendation: File share failures should be audited 

# check the current audit setting w/ out changing it 
$setting = auditpol /get /subcategory:"File Share" | Select-String "File Share"

# display settings 
Write-Host "Current Setting: $setting"

# check if success auditing is enabled 
if ($setting -match "Failure") {
    Write-Host "Status: Compliant"
}
elseif ($setting) {
    Write-Host "Status: Non-Compliant"
    Write-Host "Recommendation: enable failure auditing for file shares using group policy"
}
else {
    Write-Host "Status: Unable to read"
    Write-Host "Recommendation: check the audit setting manually"
}