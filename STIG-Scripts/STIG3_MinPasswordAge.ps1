# Script 3 - Check Minimum Password Age
# From download: V-253302
# Requirement/recommendation: should be at least 1 day 

# check current settings for the min password age
$age = net accounts | Select-String "Minimum password age"

# display the setting 
Write-Host "Current Setting: $age"

# check if the setting shows a number & look for a colon followed by the spaces and one or more numbers 
# if so allow spaces after the number & make sure theres nothing else after 
if ($age -match ":\s*(\d+)\s*$") {

    $days = [int]$Matches[1]

    if($days -ge 1) {
        Write-Host "Status: Compliant"
    }
    else {
        Write-Host "Status: Non-Compliant"
        Write-Host "Recommendation: Set the minimum password age to at least 1 day using group policy"
    }
}
else {
    Write-Host "Status: Unable to read"
    Write-Host "Recommendation: Check the minimum password age settings in group policy"
}