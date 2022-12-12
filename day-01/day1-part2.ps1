# Parse input
$input = "./input.txt";
$calories = Get-Content $input

# Declare blank array
$caloriesArray = @()

# Local total populated in each iteration of for loop
$currentTotal = 0

# Loop through all lines of input
foreach ($item in $calories)
{
    # When we reach a newline, append local total to array, reset local total to 0 for next block of values
    if ($item -eq "")
    {
        $caloriesArray += $currentTotal
        $currentTotal = 0
    }
    else {
        # Add current value to running local total. Type casting to parse from string to int type.
        $currentTotal =  [int]$item + $currentTotal
    }
}
# To ensure we append the last line of input
$caloriesArray += $currentTotal

# Sort the array from least to greatest
$sortedArray = $caloriesArray | sort-object

# Retrieve the last 3 array items (three largest)
$topThree = $sortedArray[-1..-3]

$globalTotal = 0;

# For each of the top three, add them to the global total (the total we return)
$topThree.foreach{$globalTotal = $globalTotal + [int]$PSItem}

$globalTotal