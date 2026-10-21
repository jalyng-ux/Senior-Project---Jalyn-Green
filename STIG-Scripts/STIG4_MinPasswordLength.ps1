# Script 4 - Check Minimum Password Length
# From download: V-253303
# Requirement/recommendation: Minimum password length must be at least 14 characters 


# check current settings for the min password length
$length = net accounts | Select-String "Minimum password length"

# display the setting 
Write-Host "Current Setting: $length"

# check if the setting shows a number & look for a colon followed by the spaces and one or more numbers 
# if so allow spaces after the number & make sure theres nothing else after 
if ($length -match ":\s*(\d+)\s*$") {

    $characters = [int]$Matches[1]

    if($characters -ge 14) {
        Write-Host "Status: Compliant"
    }
    else {
        Write-Host "Status: Non-Compliant"
        Write-Host "Recommendation: Set the minimum password length to at least 14 characters using group policy"
    }
}
else {
    Write-Host "Status: Unable to read"
    Write-Host "Recommendation: Check the minimum password length settings in group policy"
}