$settingsFile = ".\settings.json"
$settings = Get-Content -Path $settingsFile | ConvertFrom-Json

if (($settings.PASSWORD -eq "YourPassword") -or ($settings.USERNAME -eq "YourDomain\\YourUsername") -or ($settings.PASSWORD -eq "") -or ($settings.USERNAME -eq "") ) {
  $USERNAME = Read-Host -Prompt 'Input your username'
  $PASSWORD = Read-Host -Prompt 'Enter your password'
  $settings.USERNAME = $USERNAME
  $settings.PASSWORD = $PASSWORD
  
  $settings | ConvertTo-Json | Out-File -FilePath $settingsFile
}

# Create the credential object
$securePassword = ConvertTo-SecureString $settings.PASSWORD -AsPlainText -Force
$credential = New-Object System.Management.Automation.PSCredential $settings.USERNAME, $securePassword

# Run the actual process using the given credentials
Start-Process -FilePath $settings.APP -Credential $credential -WorkingDirectory $settings.WD


# Read-Host -Prompt "Press ENTER key to exit."