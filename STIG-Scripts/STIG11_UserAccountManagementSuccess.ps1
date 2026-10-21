# Script 11 - Check User Account Management Success
# From: 253310
# Requirement/recommendation: user account management success should be audited

# look for available commands: auditpol /?
# auditpol /get /? & auditpol /set /? to see syntax 
# auditpol /list /subcategory:* to find setting names 

# check current audit settings 
$setting = auditpol /get /subcategory:"User Account Management" | Select-String "User Account Management"

# display current settings 
Write-Host "Current Setting: $setting"

# check if Success auditing is enabled 
if ($setting -match "Success") {
    Write-Host "Status: Compliant"
}
else {
    Write-Host "Status: Non-Compliant"
    Write-Host "Recommendation: enable the success auditing for user account management using group policy"
}
