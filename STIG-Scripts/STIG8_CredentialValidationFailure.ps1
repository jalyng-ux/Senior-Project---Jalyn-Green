# Script 8 - Check Credential Validation Failures 
# From: 253306
# Requirement/recommendation: the credential validation failure should be audited 

# look for available commands: auditpol /?
# auditpol /get /? & auditpol /set /? to see syntax 
# auditpol /list /subcategory:* to find setting names 

# check current audit settings 
$setting = auditpol /get /subcategory:"Credential Validation" | Select-String "Credential Validation"

# display current settings 
Write-Host "Current Setting: $setting"

# check if failure auditing is enabled 
if ($setting -match "Failure") {
    Write-Host "Status: Compliant"
}
else {
    Write-Host "Status: Non-Compliant"
    Write-Host "Recommendation: enable the failure auditing for credential validation using group policy"
}


