# Get the settings from the .env file
switch -File .env {
  default {
    $name, $value = $_.Trim() -split '=', 2
    if ($name -and $name[0] -ne '#') { # ignore blank and comment lines.
      Set-Item "settings:$name" $value
    }
  }
}

# Create the credential object
$securePassword = ConvertTo-SecureString $settings:PASSWORD -AsPlainText -Force
$credential = New-Object System.Management.Automation.PSCredential $settings:USERNAME, $securePassword

# Run the actual process using the given credentials
Start-Process -FilePath $settings:APP -Credential $credential -WorkingDirectory $settings:WD