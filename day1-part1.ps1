# Get input file path
$input = "./test.txt";

# Read input file
$calories = Get-Content $input

# Global total that will be returned
$globalTotal = 0

# Local total populated in each iteration of for loop
$currentTotal = 0

# Loop through all lines of input
foreach ($item in $calories)
{
    # When we reach a newline, compare the totals, reset local total to 0 for next block of values
    if ($item -eq "")
    {
        if ($currentTotal -gt $globalTotal)
        {
            $globalTotal = $currentTotal
        }
        $currentTotal = 0
    }
    else {
        # Add current value to running local total. Type casting to parse from string to int type.
        $currentTotal =  [int]$item + $currentTotal
    }
}
# To ensure we calculate the last line of input
if ($currentTotal -gt $globalTotal)
{
    $globalTotal = $currentTotal
}

Write-Host "Most number of calories being carreid are" $globalTotal