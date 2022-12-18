# Read input file
$inputFile = Get-Content "./input3.txt";

# Convert to array so we can iterate 3 lines at a time
$inputArray = $inputFile -split "`n";

# Global sum
$total = 0;

# Loop through every 3 lines of input
for ($c = 0; $c -lt $inputArray.Length; $c+=3)
{
    # Store input lines in batches of 3
    $line1 = $inputArray[$c]; 
    $line2 = $inputArray[$c+1];
    $line3 = $inputArray[$c+2];

    # Hashmap to store duplicate letters (we want to have a fresh hashmap for each line of input, to avoid any miscalculations)
    $duplicates = @{};

    # Loop through each letter of the first line
    for ($i = 0; $i -lt $line1.Length; $i++)
    {
        $line1Current = $line1[$i];
        
        # Loop through each letter of the second line
        for ($j = 0; $j -lt $line2.Length; $j++)
        {
            $line2Current = $line2[$j];

            # If the letter from the first line is found in the second line (case-sensitive)
            if ($line1Current -ceq $line2Current)
            {
                # Loop through each letter of the third line
                for ($k = 0; $k -lt $line3.Length; $k++)
                {
                    $line3Current = $line3[$k];

                    # If the letter from the second line is found in the third line (case-sensitive), add it to the hashmap
                    if ($line2Current -ceq $line3Current)
                    {
                        # If the hashmap does not have a key associated to the currently identified letter
                        if (!($duplicates.ContainsKey($line3Current)))
                        {
                            # Assign a number to each duplicate letter 1-26 (lowercase), 27-52 (uppercase). Convert to ascii and subtract as appropriate to get to specified constraints.
                            $asciiValue = [int][char]$line3Current;

                            # Check if the identified letter is lowercase or uppercase using regex
                            if ($line3Current -cmatch "[a-z]")
                            {
                                # Format of hashmap is "Letter" : "value - 1-26 (lowercase), 27-52 (uppercase)"
                                $duplicates.add($line3Current, $asciiValue - 96)
                            }
                            elseif ($line3Current -cmatch "[A-Z]")
                            {
                                $duplicates.add($line3Current, $asciiValue - 38)
                            }
                        }
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