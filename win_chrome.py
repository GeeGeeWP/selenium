import time
from selenium import webdriver
from selenium.webdriver.chrome.service import Service
from webdriver_manager.chrome import ChromeDriverManager
from selenium.webdriver.common.by import By



s=Service(ChromeDriverManager().install())
driver = webdriver.Chrome(service=s)

driver = webdriver.Chrome(r"C:\Users\Administrator\Desktop\seli\chromedriver.exe")

driver.get('http://hackanything.net/');

time.sleep(60)

driver.quit()
