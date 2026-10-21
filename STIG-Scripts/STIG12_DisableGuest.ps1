# Script 12 - Check Guest Account Status 
# From download: V-253433
# Requirement/recommendation: the built in guest account should be disabled 

# net user /? to see the command options 

# check the current setting for guest account status 
$guest = net user Guest | Select-String "Account active"

# display the current setting 
Write-Host "Current Setting: $guest"

# check if the guest account is disabled 
if ($guest -match "No\s*$") {
    Write-Host "Status: Compliant"
}
elseif ($guest -match  "Yes\s*$") {
    Write-Host "Status: Non-Compliant"
    Write-Host "Recommendation: disable the built in guest account using group policy"
}
else {
    Write-Host "Status: Unable to read"
    Write-Host "Recommendation: check the guest account settings in group policy" 
}