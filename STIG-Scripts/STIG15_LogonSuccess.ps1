# Script 15 - check audit success logons
# From Download: V-253316
# Requirement/recommendation: success logon attempts should be audited 

# check the current setting for logons
$setting = auditpol /get /subcategory:"Logon" | Select-String "Logon"

# display settings 
Write-Host "Current Setting: $setting"

# check if success auditing is enabled 
if ($setting -match "Success") {
    Write-Host "Status: Compliant"
}
else {
    Write-Host "Status: Non-Compliant"
    Write-Host "Recommendation: enable success logon auditing using group policy"
} 