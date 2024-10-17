## Downloading a File using Invoke-WebRequest
# Source file location
$source = 'http://speedtest.tele2.net/10MB.zip'
# Destination to save the file
$destination = 'c:\test\10MB.zip'
#Download the file
Invoke-WebRequest -Uri $source -OutFile $destination

## Using WebClient Class and HttpClient Class
# Define the source link and destination path
$source = 'http://speedtest.tele2.net/10MB.zip'
$destination = 'c:\test\10MB.zip'
# Create the new WebClient
$webClient = [System.Net.WebClient]::new()
# Download the file
$webClient.DownloadFile($source, $destination)


# Prompt for username and password
$credentials = Get-Credential
$source = 'http://speedtest.tele2.net/10MB.zip'
$destination = 'c:\test\10MB.zip'
# Create the new WebClient
$webClient = [System.Net.WebClient]::new()
# Add the credential
$webClient.Credentials = $credentials
# Download the file
$webClient.DownloadFile($source, $destination)

#####
# Downloading a File using System.Net.Http.HttpClient

# Set the source and destination
$source = 'http://speedtest.tele2.net/10MB.zip'
$destination = 'c:\test\10MB.zip'
 
# Create the HTTP client download request
$httpClient = New-Object System.Net.Http.HttpClient
$response = $httpClient.GetAsync($source)
$response.Wait()
 
# Create a file stream to pointed to the output file destination
$outputFileStream = [System.IO.FileStream]::new($destination, [System.IO.FileMode]::Create, [System.IO.FileAccess]::Write)
 
# Stream the download to the destination file stream
$downloadTask = $response.Result.Content.CopyToAsync($outputFileStream)
$downloadTask.Wait()

# Close the file stream
$outputFileStream.Close()

#####

## Downloading a File using Invoke-RestMethod

# Invoke-RestMethod -Uri <source> -OutFile <destination>

$source = 'http://speedtest.tele2.net/10MB.zip'
$destination = 'c:\test\10MB.zip'
Invoke-RestMethod -Uri $source -OutFile $destination

# if the server is asking for a password
$credential = Get-Credential
$source = 'http://speedtest.tele2.net/10MB.zip'
$destination = 'c:\test\10MB.zip'
Invoke-RestMethod -Uri $source -OutFile $destination -Credential $credential -AllowUnencryptedAuthentication

<#
Invoke-RestMethod documentation 
https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.utility/invoke-restmethod?view=powershell-7.2
#>

<#
Some API references

Introduction to the Microsoft IIS Administration API
https://docs.microsoft.com/en-us/iis-administration/

API Explorer
https://docs.microsoft.com/en-us/iis-administration/api-explorer/

REST API Browser
https://docs.microsoft.com/en-us/rest/api/

Azure Compute
https://docs.microsoft.com/en-us/rest/api/compute/

#>