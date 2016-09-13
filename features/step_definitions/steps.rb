Given(/^I am on the "([^"]*)" page$/) do |page|
  visit new_user_registration_path
end

Then(/^I should see "([^"]*)"$/) do |text|
  expect(page).to have_content(text)
end

When(/^I fill in "([^"]*)" with "([^"]*)"$/) do |element, text|
  fill_in element, with: text
end

When(/^I click the "([^"]*)" button$/) do |button|
  click_button(button)
end

Then(/^I should be on the "([^"]*)" page$/) do |page|
  goto = new_user_registration_path if page == "registration"
  goto = edit_user_registration_path if page == "Edit Profile"
  expect(current_path).to eq goto
end

When(/^I click the "([^"]*)" link$/) do |link|
  click_link(link)
end

Given(/^I am on my "([^"]*)" page$/) do |arg1|
  visit edit_user_registration_path
end
