# Rock defeats Scissors, Scissors defeats Paper, and Paper defeats Rock. If both players choose the same shape, the round instead ends in a draw.

# Column 1 (Computer): A for Rock, B for Paper, and C for Scissors

# Column 2 (Player Strategy): X means you need to lose, Y means you need to end the round in a draw, and Z means you need to win.

# Your total score is the sum of your scores for each round.

# The score for a single round is the score for the shape you selected (1 for Rock, 2 for Paper, and 3 for Scissors) plus the score for the outcome of the round (0 if you lost, 3 if the round was a draw, and 6 if you won).

# ================================================================================

$inputFile = Get-Content "./input2.txt";

$score = 0;

# Save point values and round outcomes in separate hash tables for easy reference

$hashMap = @{"A" = 1; "B" = 2; "C" = 3; "X" = 0; "Y" = 3; "Z" = 6}

$loseMap = @{"A" = "C"; "B" = "A"; "C" = "B"}

$winMap = @{"A" = "B"; "B" = "C"; "C" = "A"}



foreach ($line in $inputFile)
{
    $charArray = $line.Split(" ")
    $firstCol = $charArray[0]
    $secondCol = $charArray[1] 

    # Draw -- use the same input as computer
    if ($secondCol -eq "Y")
    {
        $score += $hashMap[$firstCol] + $hashMap[$secondCol]
    }
    # Lose
    elseif ($secondCol -eq "X")
    {
        $score += $hashMap[$loseMap[$firstCol]] + $hashMap[$secondCol]
    }
    # Win
    elseif ($secondCol -eq "Z")
    {
        $score += $hashMap[$winMap[$firstCol]] + $hashMap[$secondCol]
    }
    
}

Write-Host "Final Score is: " $score