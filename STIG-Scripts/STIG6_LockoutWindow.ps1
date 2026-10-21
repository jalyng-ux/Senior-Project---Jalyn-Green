# Script 6 - Check Lockout Window 
# From download: V-253299
# Requirement/recommendation: Reset account lockout window after at least 15 minutes 


# check current settings for account lockout window 
$window = net accounts | Select-String "Lockout observation window"

# display the setting 
Write-Host "Current Setting: $window"

# check if the setting shows a number & look for a colon followed by the spaces and one or more numbers 
# if so allow spaces after the number & make sure theres nothing else after
# get the number of minutes  
if ($window -match ":\s*(\d+)\s*$") {

    $minutes = [int]$Matches[1]

    if($minutes -ge 15) {
        Write-Host "Status: Compliant"
    }
    else {
        Write-Host "Status: Non-Compliant"
        Write-Host "Recommendation: Set the lockout observation window to at least 15 minutes using group policy"
    }
}
else {
    Write-Host "Status: Unable to read"
    Write-Host "Recommendation: Check the lockout observation window settings in group policy"
}