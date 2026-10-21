# Script 13 - check audit successful logoffs
# Windows 11 STIG V-253315
# Requirement/recommendation: successful logoffs should be audited 

# check the current audit setting for logoffs 
$setting = auditpol /get /subcategory:"Logoff" | Select-String "Logoff"

# display current settings 
Write-Host "Current Settings: $setting"

# \b word boundary - will check for a complete word 
# check if success auditing is enabled 
if ($setting -match "\bSuccess\b") {
    Write-Host "Status: Compliant"
}
else {
    Write-Host "Status: Non-Compliant"
    Write-Host "Recommendation: enable successful logoff auditing using group policy" 
}