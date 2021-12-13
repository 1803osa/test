require 'rubygems'
require 'selenium-webdriver'
require 'test/unit'
include Test::Unit::Assertions

driver = Selenium::WebDriver.for :chrome
wait = Selenium::WebDriver::Wait.new(:timeout => 10)
url = "https://www.tokopedia.com/"

def get_data
	puts "Enter email: "
	$user = gets
	puts "Enter password: "
	$pass = gets
	puts "Enter item to add to cart"
	$item = gets
end

#navigate function
def open_website (webname)
	driver.navigate.to +webname
end

def path(tagname, attribute, value)
	xpath: "//#{tagname}[@#{attribute}= '#{value}']"
end

def pathfinder(path)
	wait.until{driver.find_element(path)}
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


def automatic_login_test (webname, email, password)
	#login_button = xpath: "//button[@data-testid= 'btnHeaderLogin']"
	login_button = path("button","data-testid","btnHeaderLogin")
	#email_field = xpath: "//input[@data-testid= 'email-phone-input']")
	email_field = path("input","data-testid","email-phone-input")
	#enter_password = xpath: "//button[@data-testid= 'email-phone-submit']")
	enter_password = path("button","data-testid","email-phone-submit")
	#password_field = xpath: "//input[@autocomplete= 'current-password']")
	password_field = path("input","autocomplete","current-password")
	#login = xpath: "//span[@aria-label= 'login-button']"
	login = path("span","aria-label","login-button")

	open_website(webname)
	click_item(login_button)
	input_text(email, email_field)
	click_item(enter_password)
	input_text(password, password_field)
	submit_data(login)	
end

def automatic_add_item_to_cart_test (item_to_add)
	search_field = xpath: "//input[@data-unify= 'Search']"
	search_button = xpath: "//button[@aria-label= 'Tombol pencarian']"
	correct_item = xpath: "//a[contains(@title= '#{item_to_add}')]"
	cart_button = xpath: "//button[@data-testid = 'pdpBtnNormalPrimary']"
	
	input_text(item_to_add, search_field)
	click_item(search_button)
	click_item(correct_item)
	click_item(cart_button)
end
begin
	automatic_login_test($url, $user, $pass)
	automatic_add_item_to_cart_test($item)
rescue StandardError => e	
end

# verify = wait.until {driver.find_element(xpath: "//img[@src = 'https://ecs7.tokopedia.net/otp/cotp/ICON_EMAIL_NEW.png']")}
# verify.click

# puts "Enter verification code: "
# verificationCode = gets

# otp = wait.until {driver.find_element(xpath: "//input[@autocomplete = 'one-time-code']")}
# otp.send_keys +verificationCode	