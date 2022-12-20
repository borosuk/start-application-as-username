$settingsFile = ".\settings.json"
$settings = Get-Content -Path $settingsFile | ConvertFrom-Json

# Let's check if we have the password already or not
if (($settings.PASSWORD -eq "YourPassword") -or ($settings.USERNAME -eq "YourDomain\\YourUsername") -or ($settings.PASSWORD -eq "") -or ($settings.USERNAME -eq "") ) {
  # Get the user credentials
  $user_credentials = Get-Credential
  
  # Update the settings details
  $settings.USERNAME = $user_credentials.UserName
  $settings.PASSWORD = $user_credentials.Password | ConvertFrom-SecureString
  
  # Update the settings file
  $settings | ConvertTo-Json | Out-File -FilePath $settingsFile
}

# Create the credential object
$securePassword = ConvertTo-SecureString $settings.PASSWORD
$credential = New-Object System.Management.Automation.PSCredential $settings.USERNAME, $securePassword

# Run the actual process using the given credentials
Start-Process -FilePath $settings.APP -Credential $credential -WorkingDirectory $settings.WD

# For debugging purposes.
# Read-Host -Prompt "Press ENTER key to exit."