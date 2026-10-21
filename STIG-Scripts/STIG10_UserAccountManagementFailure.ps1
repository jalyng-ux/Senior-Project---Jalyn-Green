# Script 10 - Check User Account Management Failures
# From: 253309
# Requirement/recommendation: user account management failures should be audited

# look for available commands: auditpol /?
# auditpol /get /? & auditpol /set /? to see syntax 
# auditpol /list /subcategory:* to find setting names 

# check current audit settings 
$setting = auditpol /get /subcategory:"User Account Management" | Select-String "User Account Management"

# display current settings 
Write-Host "Current Setting: $setting"

# check if failure auditing is enabled 
if ($setting -match "Failure") {
    Write-Host "Status: Compliant"
}
else {
    Write-Host "Status: Non-Compliant"
    Write-Host "Recommendation: enable the failure auditing for user account management using group policy"
}
