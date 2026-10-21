# Script 1 - Check Password History  
# From download: V-253300
# Requirement/recommendation: 24 previous passwords should be remebered 

# check the current password history setting 
$history = net accounts | Select-String "Length of password history maintained"

# display the current settings
Write-Host $history

# check whether or not the setting meet the recommendation requirement using -match for extraction 

# needs to look for the colon before the number & allow spaces between the colon & the number
# then display the number of recommendation & allow any spaces after that & then make sure there is nothing else
# after the number of recommendation
if ($history -match ":\s*24\s*$") {
    Write-Host "Status: Compliant"
}
else {
    Write-Host "Status: Non-Compliant"
    Write-Host "Recommendation: Set the password history to 24 using group policy"
}
 