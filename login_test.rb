require 'rubygems'
require 'selenium-webdriver'
require 'test/unit'
include Test::Unit::Assertions

LOGIN_URL = "https://accounts.bukalapak.com/login?"
USER = "user"
PASS = "pass"
ITEM_TO_ADD = "item"
LOGIN_BUTTON = "//a[@class= 'sigil-header__nav te-header-login']"
EMAIL_FIELD = "//div[@class= 'wrapper-input-identity']"
TO_PASSWORD_FIELD = "//button[@id= 'submit_button']"
PASSWORD_FIELD = "//div[@class= 'bl-text-field__boxed']"
LOGIN = "//div[@id= 'btn-login']"
SEARCH_FIELD = "//input[@name= 'search[keywords]']"
SEARCH_BUTTON = "//button[@title= 'Cari']"
CART_BUTTON = "//button[contains(@class = 'c-main-product__action__cart')]"

#navigate function
def open_website (web_name)
	@driver = Selenium::WebDriver.for :chrome
	@driver.navigate.to web_name
end

#def wait (wait_time)
#	Selenium::WebDriver::Wait.new(:timeout => wait_time)
#end

def pathfinder(path, wait_time = 10)
	@driver = Selenium::WebDriver.for :chrome
	@wait = Selenium::WebDriver::Wait.new(:timeout => wait_time)
	@wait.until{@driver.find_element(xpath: path)}
end

def click_item(path)
	pathfinder(path).click
end   

def input_text(text, path)
	pathfinder(path).send_keys +text
end

def submit_data(path)
	pathfinder(path).submit
end

def correct_item()
	"//a[contains(@title= '#{ITEM_TO_ADD}')]"
end

def automatic_login_test
	open_website(LOGIN_URL)
	#click_item(login_button)
	input_text(USER, EMAIL_FIELD)
	click_item(TO_PASSWORD_FIELD)
	input_text(PASS, PASSWORD_FIELD)
	submit_data(LOGIN)	
end

def automatic_add_item_to_cart_test	
	input_text(ITEM_TO_ADD, SEARCH_FIELD)
	click_item(SEARCH_BUTTON)
	click_item(correct_item)
	click_item(cart_button)
end

def run_test
	if automatic_login_test !=true
		puts "Login failed"
	end
	if automatic_add_item_to_cart_test != true
		puts "Add item to cart failed"
	end
end

run_test