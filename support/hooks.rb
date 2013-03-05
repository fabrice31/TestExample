# Before a scenario, open a browser
# Resize to 1024*768 by default
# Create a token for this test
# Author:: Fabrice
Before do
  $token = Token.new
  puts "Token for this test : #{$token.value}"

  # open the browser
  case ENV['BROWSER']
  when 'ie'
    @browser = Watir::Browser.new :ie

  when 'mobile'
    mobile_useragent = "Mozilla/5.0 (iPhone; CPU iPhone OS 5_1_1 like Mac OS X) AppleWebKit/534.46 (KHTML, like Gecko) Version/5.1 Mobile/9B206 Safari/7534.48.3"
    profile = Selenium::WebDriver::Firefox::Profile.new
    profile['general.useragent.override'] = mobile_useragent
    @browser = Watir::Browser.new :firefox, :profile => profile

  when 'chrome'
    @browser = Watir::Browser.new :chrome

  else
    # Default case : firefox
    profile = Selenium::WebDriver::Firefox::Profile.new
    profile['browser.link.open_newwindow'] = 3
    @browser = Watir::Browser.new :firefox, :profile => profile
  end

  # resize the browser
  if ENV['BROWSER'] != 'mobile'
    @browser.window.resize_to(1024, 768)
  else
    @browser.window.resize_to(640, 960)
  end
end

# After a scenario, close the browser
# If failed, Capture a screen and add in the cucumber report
# Author:: Fabrice
After do |scenario|
  begin
    if scenario.failed?
      screenshot = "./screen/FAIL_#{scenario.name.gsub(' ','_').gsub(/[^0-9A-Za-z_]/, '')}.png"
      @browser.driver.save_screenshot(screenshot)
      embed screenshot, 'image/png'
    end
    @browser.close
  rescue
    # if browser crash during test, you can't close it again
    # if you remove berin/rescue, you get 2 errors in this case : 
    # - one for the test
    # - one fot the after step
  end
end
