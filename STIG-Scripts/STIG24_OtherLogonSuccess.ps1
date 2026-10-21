# Script 24 - check other logon/logoff event successes
# Requirement/recommendation: other logon/logoff event success should be audited 

# check the current audit setting w/ out changing it 
$setting = auditpol /get /subcategory:"Other Logon/Logoff Events" | Select-String "Other Logon/Logoff Events"

# display settings 
Write-Host "Current Setting: $setting"

# check if success auditing is enabled 
if ($setting -match "Success") {
    Write-Host "Status: Compliant"
}
elseif ($setting) {
    Write-Host "Status: Non-Compliant"
    Write-Host "Recommendation: enable success auditing for other logon/logoff event using group policy"
}
else {
    Write-Host "Status: Unable to read"
    Write-Host "Recommendation: check the audit setting manually"
}