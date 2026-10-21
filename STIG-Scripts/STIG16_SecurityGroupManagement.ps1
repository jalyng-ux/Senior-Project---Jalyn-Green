# Script 16 - check security group management
# Requirement/recommendation: audit security group should be enabled 

# check the current audit setting w/ out changing it 
$setting = auditpol /get /subcategory:"Security Group Management" | Select-String "Security Group Management"

# display settings 
Write-Host "Current Setting: $setting"

# check if success auditing is enabled 
if ($setting -match "Success") {
    Write-Host "Status: Compliant"
}
else {
    Write-Host "Status: Non-Compliant"
    Write-Host "Recommendation: enable success auditing for security group management using group policy"
}