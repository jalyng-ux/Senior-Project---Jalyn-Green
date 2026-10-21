# Script 14 - check audit failed logons
# From Download: V-253316
# Requirement/recommendation: failed logon attempts should be audited 

# check the current setting for logons
$setting = auditpol /get /subcategory:"Logon" | Select-String "Logon"

# display settings 
Write-Host "Current Setting: $setting"

# check if failure auditing is enabled 
if ($setting -match "Failure") {
    Write-Host "Status: Compliant"
}
else {
    Write-Host "Status: Non-Compliant"
    Write-Host "Recommendation: enable failed logon auditing using group policy"
} 