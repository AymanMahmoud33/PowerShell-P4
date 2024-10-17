Write-Host "x is $x"

$x = 20

Write-Host "In the script, x is $x" -ForegroundColor Cyan

function test-it {
    Write-Host "In the functions, x is $x" -ForegroundColor Yellow

    $x = 30 

    Write-Host "Now, x is $x in the functions" -ForegroundColor Yellow
}

test-it

Write-Host "At this point in the script x is $x" -ForegroundColor Green