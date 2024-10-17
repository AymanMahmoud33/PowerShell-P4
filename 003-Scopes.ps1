Write-Host "z is $z"
Set-Variable -Name z -Scope Global -Value 500
#$global:z = 500 # this is the same as line 2
$z = 200 # comment this and uncomment line 2

Write-Host "In the script, z is $z" -ForegroundColor Cyan

function test-it {
    Write-Host "In the functions, z is $z" -ForegroundColor Yellow

    #$z = 300
    $script:z = 300 

    Write-Host "Now, z is $z in the functions" -ForegroundColor Yellow
}

test-it

Write-Host "At this point in the script z is $z" -ForegroundColor Green