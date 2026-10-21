# Script 2 - Check Maximum Password Age
# From download: V-253301
# Requirement/recommendation: should be at least 60 days or less  
 
# check for the current max password age setting
$age = net accounts | Select-String "Maximum password age" 

# display the current settings
Write-Host "Current Setting: $age" 


# check whether or not the setting meeting the recommendation requirements using -match
# needs to also check if the settiung does not show a number... something like unlimited 
# -ge -> greater than or equal to -le -> less than or equal to \d+ looks for one or more numbers 
# check for a colon followed by the spaces and one or more numbers & allow spaces after the number
# & make sure nothing comes after the recommendation  

if($age -match ":\s*(\d+)\s*$") {
    
    $days = [int]$Matches[1]

    if($days -ge 1 -and $days -le 60) {
        Write-Host "Status: Compliant"
    }
    else {
        Write-Host "Status: Non-Compliant"
        Write-Host "Recommendation: Set maximum password age to 60 days or less using Group Policy"
    }
}
    else {
        Write-Host "Status: Non-Compliant"
        Write-Host "Recommendation: Set maximum password age to 60 days or less using Group Policy"
    }


