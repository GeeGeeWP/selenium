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
