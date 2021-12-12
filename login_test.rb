require 'rubygems'
require 'selenium-webdriver'
require 'test/unit'
include Test::Unit::Assertions

driver = Selenium::WebDriver.for :edge
wait = Selenium::WebDriver::Wait.new(:timeout => 10)
userID = "ID"
pass = "PASS"
cartItem = "ITEM"

driver.navigate.to "https://www.tokopedia.com/"

findLogin = wait.until {driver.find_element(xpath: "//button[@data-testid= 'btnHeaderLogin']")}
findLogin.click

enterID = wait.until {driver.find_element(xpath: "//input[@data-testid= 'email-phone-input']")}
enterID.send_keys +userID

proceedToPass = wait.until {driver.find_element(xpath: "//button[@data-testid= 'email-phone-submit']")}
proceedToPass.click

enterPass = wait.until {driver.find_element(xpath: "//input[@autocomplete= 'current-password']")}
enterPass.send_keys +pass

login = wait.until {driver.find_element(xpath: "//span[@aria-label= 'login-button']")}
login.submit

inputItemName = wait.until {driver.find_element(xpath: "//input[@data-unify= 'Search']")}
inputItemName.send_keys +cartItem

searchItem = wait.until {driver.find_element(xpath: "//button[@aria-label= 'Tombol Pencarian']")}
searchItem.submit

#findCorrectItem = wait.until {driver.find_element(xpath: "//a[contains(@title= 'IPhone 13 Pro Max')])}
#findCorrectItem.click

#addToCart = wait.until {driver.find_element(xpath: "//button[@data-testid = 'pdpBtnNormalPrimary']")}
#addToCart.click
