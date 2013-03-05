Then /^I need to sleep$/ do
  sleep(TIMEOUT)
end


Given /^I visit "(.*?)"$/ do |uri|
  @browser.goto(uri)
end


Then /^I don't see errors$/ do
  text = @browser.text.downcase
  errors_found = Array.new

  errors = ["undefined ", "error", "warning ", "fatal except", "syntax error"]
  errors.each do |error|
    if (text.include?(error))
      errors_found[errors_found.length] = error
    end
  end
  
  errors_found.should == []
end


Then /^I should see "([^"]*)"$/ do |text|
  @browser.wait_until(TIMEOUT) {
    @browser.body.visible? && 
    @browser.element(:text => /#{text}/).exists? &&
    @browser.element(:text => /#{text}/).visible?
  }
end


Then /^I shouldn't see "([^"]*)"$/ do |text|
  (@browser.text.include?text).should == false
end


Then /^I (should|shouldn't) see link to "([^"]*)"$/ do | action, link |
  result = (action == "should")
  (@browser.link(:href => /#{link}/).exists?).should == result
end


When /^I click on "([^"]*)"$/ do |text|
  @browser.link(:text => text).click
end
