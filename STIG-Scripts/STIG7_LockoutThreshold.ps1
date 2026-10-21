# Script 7 - Check Lockout Threshold  
# From download: V-253298
# Requirement/recommendation: acount lockout threshold should be at least 3 failed attempts or fewer


# check current settings for account lockout threshold 
$threshold = net accounts | Select-String "Lockout threshold"

# display the setting 
Write-Host "Current Setting: $threshold"


# check for the never results b/c that means the account will not lock after failed attempts 
if ($threshold -match "Never") {
    Write-Host "Status: Non-Compliant"
    Write-Host "Recommendation: Set the lockout threshold to 3 failed attempts using group policy"
}

# check if the setting shows a number & look for a colon followed by the spaces and one or more numbers 
# if so allow spaces after the number & make sure theres nothing else after
# get the number of minutes  
elseif ($threshold -match ":\s*(\d+)\s*$") {

    $attempts = [int]$Matches[1]

    if($attempts -ge 1 -and $attempts -le 3) {
        Write-Host "Status: Compliant"
    }
    else {
        Write-Host "Status: Non-Compliant"
        Write-Host "Recommendation:  Set the lockout threshold to at least 3 failed attempts using group policy"
    }
}
else {
    Write-Host "Status: Unable to read"
    Write-Host "Recommendation: Check the lockout threshold settings in group policy"
}