require 'rubygems'
require 'selenium-webdriver'
require 'test/unit'
include Test::Unit::Assertions

puts "Enter Username: "
userID = gets
puts "Enter Password: "
pass = gets

driver = Selenium::WebDriver.for :chrome
wait = Selenium::WebDriver::Wait.new(:timeout => 10)
# userID = "ID"
# pass = "PASS"
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

verify = wait.until {driver.find_element(xpath: "//img[@src = 'https://ecs7.tokopedia.net/otp/cotp/ICON_EMAIL_NEW.png']")}
verify.click

puts "Enter verification code: "
verificationCode = gets

otp = wait.until {driver.find_element(xpath: "//input[@autocomplete = 'one-time-code']")}
otp.send_keys +verificationCode	

inputItemName = wait.until {driver.find_element(xpath: "//input[@data-unify= 'Search']")}
inputItemName.send_keys +cartItem

searchItem = wait.until {driver.find_element(xpath: "//button[@aria-label= 'Tombol pencarian']")}
searchItem.submit

#findCorrectItem = wait.until {driver.find_element(xpath: "//a[contains(@title= 'IPhone 13 Pro Max')]")}
#findCorrectItem.click

#addToCart = wait.until {driver.find_element(xpath: "//button[@data-testid = 'pdpBtnNormalPrimary']")}
#addToCart.click

