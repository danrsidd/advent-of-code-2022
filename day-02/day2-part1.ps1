# Rock defeats Scissors, Scissors defeats Paper, and Paper defeats Rock. If both players choose the same shape, the round instead ends in a draw.

# Column 1 (Computer): A for Rock, B for Paper, and C for Scissors

# Column 2 (Player): X for Rock, Y for Paper, and Z for Scissors.

# Your total score is the sum of your scores for each round.

# The score for a single round is the score for the shape you selected (1 for Rock, 2 for Paper, and 3 for Scissors) plus the score for the outcome of the round (0 if you lost, 3 if the round was a draw, and 6 if you won).

# ================================================================================

$inputFile = Get-Content "./input2.txt";

$win = 6;
$draw = 3;

$score = 0;

$hashMap = @{ "A" = 1; "B" = 2; "C" = 3; "X" = 1; "Y" = 2; "Z" = 3; }

foreach ($line in $inputFile)
{
    $charArray = $line.Split(" ")
    $firstCol = $charArray[0]
    $secondCol = $charArray[1] 

    # tie
    if ($hashMap[$firstCol] -eq $hashMap[$secondCol])
    {
        $score += $hashMap[$secondCol] + $draw
    }
    # win rock
    elseif (($hashMap[$secondCol] -eq 1) -and ($hashMap[$firstCol] -eq 3))
    {
        $score += $hashmap[$secondCol] + $win
    }
    # win paper
    elseif (($hashMap[$secondCol] -eq 2) -and ($hashMap[$firstCol] -eq 1)) 
    {
        $score += $hashmap[$secondCol] + $win
    }
    # win scissors
    elseif (($hashMap[$secondCol] -eq 3) -and ($hashMap[$firstCol] -eq 2)) 
    {
        $score += $hashmap[$secondCol] + $win
    }
    # lost
    else {
        $score += $hashMap[$secondCol]
    }
    
}

Write-Host "Final Score is: " $score