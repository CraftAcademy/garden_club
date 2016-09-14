Given(/^I am on the "([^"]*)" page$/) do |page|
  set_goto(page)
  visit @goto
  expect(current_path).to eq @goto
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

When(/^I click the "([^"]*)" link$/) do |link|
  click_link(link)
end

Then(/^I should be on the "([^"]*)" page$/) do |page|
  expect(current_path).to eq registration_index_path
end

def set_goto(page)
  @goto = user_facebook_omniauth_authorize if page == "Facebook Login"
  @goto = root_path if page == "home"
  @goto = new_user_session_path if page == "Login"
  @goto = new_user_registration_path if page == "registration"
  @goto = edit_user_registration_path if page == "Edit Profile"
  @goto = profile_path if page == "Profile"
  @goto = private_path if page == "private information"
end
