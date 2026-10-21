# Test Paln/Master Script - run all 25 STIG checks. **soon 50
# This script will not change any windows settings it will just run 
# all scripts created and give a summary report.

# Define all variables
$folder = "C:\Users\jtgreen\Documents" # Locate the STIG scripts 
$report = "$folder\STIG_SummaryReport.txt" # Name & Locate report summary 
# Count needs to start at zero
$compliant = 0 # Count scripts that are compliant
$noncompliant = 0 # Count scripts that are noncompliant
$unknown = 0 # Count scripts that are unable to read/unknown
$i = 0 # Keep track of the scripts (1-25) **soon 50
$script = $null # Store script file that is checked
$result = "" # Store output from each script

# Create report 
"STIG Compliance Summary Report" | Out-File $report
"Date: $(Get-Date)" | Out-File $report -Append
"--------------------------------" | Out-File $report -Append

# Run STIG scripts 1-25 **soon 50
for($i = 1; $i -le 25; $i++) {

    $script = "null"
    $result = ""

    # Scripts need to be found by the #
    $script = Get-ChildItem "$folder\STIG$($i)_*.ps1" -ErrorAction SilentlyContinue

    # Make sure files exsist
    if ($script) {
        
        # Collect script output 
        $result = & $script.FullName 6>&1 | Out-String

        # Save name & collect output for scripts 
        "Script: $($script.Name)" | Out-File $report -Append
        $result | Out-File $report -Append

        # Check & count the compliance status
        if ($result -match "Status: Non-Compliant") {
            $noncompliant++
        }
        elseif ($result -match "Status: Compliant") {
            $compliant++
        }
        else {
            $unknown++
        }

        # Each script needs to be separted in the report 
        "------------------------" | Out-File $report -Append
    }
    else {
        # Missing scripts?
        "Missing Scripts: STIG$i" | Out-File $report -Append
        $unknown++
    }
}

# Save final totals to summary report
"Compliant: $compliant" | Out-File $report -Append
"Non-Compliant: $noncompliant" | Out-File $report -Append
"Unknown or Missing: $unknown" | Out-File $report -Append

# Display final totals in PowerShell 
Write-Host "STIG Report Complete"
Write-Host "Compliant: $compliant"
Write-Host "Non-Compliant: $noncompliant"
Write-Host "Unknown or Missing: $unknown"
Write-Host "Report saved to: $report"