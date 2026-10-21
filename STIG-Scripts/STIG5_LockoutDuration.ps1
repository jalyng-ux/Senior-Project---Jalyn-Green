# Script 5 - Check Account Lockout Duration
# From download: V-253297
# Requirement/recommendation: Account lockout duration must be at least 15 minutes 


# check current settings for account lockout duration 
$duration = net accounts | Select-String "Lockout Duration"

# display the setting 
Write-Host "Current Setting: $duration"

# check if the setting shows a number & look for a colon followed by the spaces and one or more numbers 
# if so allow spaces after the number & make sure theres nothing else after
# get the number of minutes  
if ($duration -match ":\s*(\d+)\s*$") {

    $minutes = [int]$Matches[1]

    if($minutes -ge 15) {
        Write-Host "Status: Compliant"
    }
    else {
        Write-Host "Status: Non-Compliant"
        Write-Host "Recommendation: Set the account lockout duration to at least 15 minutes using group policy"
    }
}
else {
    Write-Host "Status: Unable to read"
    Write-Host "Recommendation: Check the account lockout duration settings in group policy"
}