# Script 20 - check security system extension successes
# From: V-253334
# Requirement/recommendation: security system extension successes should be audited 

# check the current audit setting w/ out changing it 
$setting = auditpol /get /subcategory:"Security System Extension" | Select-String "Security System Extension"

# display settings 
Write-Host "Current Setting: $setting"

# check if success auditing is enabled 
if ($setting -match "Success") {
    Write-Host "Status: Compliant"
}
elseif ($setting) {
    Write-Host "Status: Non-Compliant"
    Write-Host "Recommendation: enable success auditing for security system extension using group policy"
}
else {
    Write-Host "Status: Unable to read"
    Write-Host "Recommendation: check the audit setting manually"
}