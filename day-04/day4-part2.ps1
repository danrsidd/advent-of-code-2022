# Parse input file
$inputFile = Get-Content "./input4.txt"

# Global count of how many pairs filly contain another pair
$totalPairs = 0

foreach ($line in $inputFile)
{   
    # Split pairs by comma
    $groups = $line.Split(',')

    # Initialize values array
    $values = @();

    foreach ($pair in $groups)
    {
        # Split values within a pair and append them to the values array
        $numbers = $pair.Split('-')
        $values += ($numbers[0])
        $values += ($numbers[1])
    }

    # Convert each of the four numbers of the current line to ints
    $firstLower = [int]$values[0]
    $firstUpper = [int]$values[1]
    $secondLower = [int]$values[2]
    $secondUpper = [int]$values[3]
  
    # Fully contained case
    if ((($secondLower -ge $firstLower) -and ($secondUpper -le $firstUpper)) -or (($firstLower -ge $secondLower) -and ($firstUpper -le $secondUpper)))
    {
        $totalPairs++
    }
    # Partially contained case
    elseif ((($secondLower -ge $firstLower) -and ($secondLower -le $firstUpper)) -or (($firstLower -ge $secondLower) -and ($firstLower -le $secondUpper)))
    {
        $totalPairs++
    }

}

Write-Host "Total pairs: " $totalPairs
