require 'rubygems'
require 'selenium-webdriver'
require 'test/unit'
include Test::Unit::Assertions

driver = Selenium::WebDriver.for :chrome
Login_url = "https://accounts.bukalapak.com/login?"
User = "user"
Pass = "pass"
Item_to_add = "item"
Login_button = "//a[@class= 'sigil-header__nav te-header-login']"
Email_field = "//div[@dclass= 'bl-text-field__boxed']"
To_password_field = "//button[@id= 'submit_button']"
Password_field = "//div[@class= 'bl-text-field__boxed']"
Login = "//div[@id= 'btn-login']"
Search_field = "//input[@name= 'search[keywords]']"
Search_button = "//button[@title= 'Cari']"
Correct_item = "//a[contains(@title= '#{Item_to_add}')]"
Cart_button = "//button[contains(@class = 'c-main-product__action__cart')]"

#navigate function
def open_website (web_name)
	driver.navigate.to web_name
end

def wait (wait_time)
	Selenium::WebDriver::Wait.new(:timeout => wait_time)
end

def pathfinder(path, wait_time = 10)
	wait(wait_time).until{driver.find_element(xpath: path)}
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

def automatic_login_test
	open_website(Login_url)
	#click_item(login_button)
	input_text(User, Email_field)
	click_item(To_password_field)
	input_text(Pass, Password_field)
	submit_data(Login)	
end

def automatic_add_item_to_cart_test	
	input_text(item_to_add, Search_field)
	click_item(Search_button)
	#click_item(correct_item)
	#click_item(cart_button)
end

def run_test
	automatic_login_test
	if automatic_login_test !=true
		puts "Login failed"
	end
	automatic_add_item_to_cart_test
	if automatic_add_item_to_cart_test != true
		puts "Add item to cart failed"
	end
end

run_test