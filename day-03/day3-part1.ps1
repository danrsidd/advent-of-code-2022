# Read input file
$inputFile = Get-Content "./input3.txt";

# Global sum
$total = 0;

# Loop through each line of input
foreach ($line in $inputFile)
{
    # Hashmap to store duplicate letters (we want to have a fresh hashmap for each line of input, to avoid any miscalculations)
    $duplicates = @{};

    # Split input string in 2 parts
    $firstHalf = $line.Substring(0, $line.Length / 2);
    $secondHalf = $line.Substring($line.Length / 2);
    
    # Loop through each letter of the first half
    for ($i = 0; $i -lt $firstHalf.Length; $i++)
    {
        $firstCurrent = $firstHalf[$i];
        
        # Loop through each letter of the second half
        for ($j = 0; $j -lt $secondHalf.Length; $j++)
        {
            $secondCurrent = $secondHalf[$j];
            
            # If the letter from the first half is found in the second half (case-sensitive), add it to the hashmap
            if ($firstCurrent -ceq $secondCurrent)
            {
                # If the hashmap does not have a key associated to the currently identified letter
                if (!($duplicates.ContainsKey($firstCurrent)))
                {
                    # Assign a number to each duplicate letter 1-26 (lowercase), 27-52 (uppercase). Convert to ascii and subtract as appropriate to get to specified constraints.
                    $asciiValue = [int][char]$firstCurrent;

                    # Check if the identified letter is lowercase or uppercase using regex
                    if ($firstCurrent -cmatch "[a-z]")
                    {
                        # Format of hashmap is "Letter" : "value - 1-26 (lowercase), 27-52 (uppercase)"
                        $duplicates.add($firstCurrent, $asciiValue - 96)
                    }
                    elseif ($firstCurrent -cmatch "[A-Z]")
                    {
                        $duplicates.add($firstCurrent, $asciiValue - 38)
                    }
                }
            }
        }
    }
    
    # Loop through the current line's dictionary, sum up the values, and add it to the global sum
    foreach ($value in $duplicates.Values)
    {
        $total += $value
    }
}

# Write the global sum of all lines of input
Write-Host "Total is: " $total