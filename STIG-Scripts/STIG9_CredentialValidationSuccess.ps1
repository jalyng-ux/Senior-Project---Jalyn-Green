# Script 9 - Check Credential Validation Sucesses 
# From: 253307
# Requirement/recommendation: the credential validation successes should be audited 

# look for available commands: auditpol /?
# auditpol /get /? & auditpol /set /? to see syntax 
# auditpol /list /subcategory:* to find setting names 

# check current audit settings 
$setting = auditpol /get /subcategory:"Credential Validation" | Select-String "Credential Validation"

# display current settings 
Write-Host "Current Setting: $setting"

# check if success auditing is enabled 
if ($setting -match "Success") {
    Write-Host "Status: Compliant"
}
else {
    Write-Host "Status: Non-Compliant"
    Write-Host "Recommendation: enable the success auditing for credential validation using group policy"
}