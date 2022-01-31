echo "Startup Started" > .\Desktop\Status.txt

$LocalTempDir = $env:TEMP; $ChromeInstaller = "ChromeInstaller.exe"; (new-object    System.Net.WebClient).DownloadFile('http://dl.google.com/chrome/install/375.126/chrome_installer.exe', "$LocalTempDir\$ChromeInstaller"); & "$LocalTempDir\$ChromeInstaller" /silent /install; $Process2Monitor =  "ChromeInstaller"; Do { $ProcessesFound = Get-Process | ?{$Process2Monitor -contains $_.Name} | Select-Object -ExpandProperty Name; If ($ProcessesFound) { "Still running: $($ProcessesFound -join ', ')" | Write-Host; Start-Sleep -Seconds 2 } else { rm "$LocalTempDir\$ChromeInstaller" -ErrorAction SilentlyContinue -Verbose } } Until (!$ProcessesFound)

echo "Getting Selenium" >> .\Desktop\Status.txt

Invoke-WebRequest -Uri https://chromedriver.storage.googleapis.com/97.0.4692.71/chromedriver_win32.zip -OutFile .\Desktop\sel.zip

echo "Done - Getting Github" >> .\Desktop\Status.txt

Invoke-WebRequest -Uri https://raw.githubusercontent.com/GeeGeeWP/selenium/main/win_chrome.py -OutFile .\Desktop\win_chrome.py
echo "Done - unzipping Selenium" >> .\Desktop\Status.txt

Expand-Archive .\Desktop\sel.zip -DestinationPath .\Desktop\seli
echo "Done - Getting Python" >> .\Desktop\Status.txt

#.\Desktop\seli\chromedriver.exe

$script = New-Object Net.WebClient
$script | Get-Member
$script.DownloadString("https://chocolatey.org/install.ps1")
iwr https://chocolatey.org/install.ps1 -UseBasicParsing | iex
choco upgrade chocolatey
choco install -y nano
choco install -y python3
choco install -y pip3

pip install -U selenium
pip install webdriver_manager

echo "SETUP COMPLETE" >> .\Desktop\Status.txt
