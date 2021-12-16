require 'rubygems'
require 'selenium-webdriver'
require 'test/unit'
include Test::Unit::Assertions

url = "https://accounts.bukalapak.com/login?"

def get_data
	puts "Enter email: "
	user = gets
	puts "Enter password: "
	pass = gets
	puts "Enter item to add to cart"
	item = gets
end

#navigate function
def open_website (web_name)
	driver = Selenium::WebDriver.for :chrome
	driver.navigate.to web_name
end

def wait (wait_time)
	Selenium::WebDriver::Wait.new(:timeout => wait_time.to_i)
end

def pathfinder(path, wait_time = 10)
	driver = Selenium::WebDriver.for :chrome
	wait(wait_time).until{driver.find_element(xpath: path.to_s)}
end

#def nav (type, path, text = "")
#	if type == "click"
#		pathfinder(path).click
#	elsif type == "fill"
#		pathfinder(path).send_keys +text
#	elsif type == "submit"
#		pathfinder(path).submit			
#end

def click_item(path)
	pathfinder(path).click
end   

def input_text(text, path)
	pathfinder(path).send_keys +text
end

def submit_data(path)
	pathfinder(path).submit
end


def automatic_login_test (web_name, email, password)
	login_button = "//a[@class= 'sigil-header__nav te-header-login']"
	#login_button = path("button","id","submit_button")
	email_field = "//div[@dclass= 'bl-text-field__boxed']"
	#email_field = path("div","class","bl-text-field__boxed")
	to_password_field = "//button[@id= 'submit_button']"
	#to_password_field = path("button","id","submit_button")
	password_field = "//div[@class= 'bl-text-field__boxed']"
	#password_field = path("div","class","bl-text-field__boxed")
	login = "//div[@id= 'btn-login']"
	#login = path("div","id","btn-login")

	open_website(web_name)
	#click_item(login_button)
	input_text(email, email_field)
	click_item(to_password_field)
	input_text(password, password_field)
	submit_data(login)	
end

def automatic_add_item_to_cart_test (item_to_add)
	search_field = "//input[@name= 'search[keywords]']"
	search_button = "//button[@title= 'Cari']"
	correct_item = "//a[contains(@title= '#{item_to_add}')]"
	cart_button = "//button[contains(@class = 'c-main-product__action__cart')]"
	
	input_text(item_to_add, search_field)
	click_item(search_button)
	#click_item(correct_item)
	#click_item(cart_button)
end

#get_data
automatic_login_test(url, "user", "pass")
automatic_add_item_to_cart_test("item")
