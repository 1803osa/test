require 'rubygems'
require 'selenium-webdriver'
require 'test/unit'
include Test::Unit::Assertions

driver = Selenium::WebDriver.for :edge

userID = "INSERT_ID"
pass = "INSERT_PASS"
cartItem = "INSERT_ITEM_TO_BE_ADDED_TO_SHOP"

driver.navigate.to "https://www.tokopedia.com/"

findLogin = driver.find_element(xpath: "//button[@data-testid='btnHeaderLogin']")
findLogin.submit

enterID = driver.find_element(id: 'email-phone')
enterID.send_keys userID

proceedToPass = driver.find_element(id: 'email-phone-submit')
proceedToPass.click

enterPass = driver.find_element(id: 'password-input')
enterPass.send_keys pass

login = driver.find_element(class: 'css-ow4jg3-unf-btn e1ggruw00')
login.submit

inputItemName = driver.find_element(class: 'css-1ha94jg e1v0ehno0')
inputItemName.send_keys cartItem

searchItem = driver.find_element(class: 'css-1czin5k e1v0ehno1')
searchItem.submit

#findCorrectItem = driver.find_element(//a[contains(@title,"IPhone 13 Pro Max")])
#findCorrectItem.click

#addToCart = driver.find_element(class: 'css-1t6ir39-unf-btn e1ggruw00')
#addToCart.click
