Given(/^I am on the "([^"]*)" page$/) do |page|
  set_goto(page)
  visit @goto
  expect(current_path).to eq @goto
end

When(/^I visit the "([^"]*)" page$/) do |page|
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
  set_goto(page)
  expect(current_path).to eq @goto
end

Given(/^I am logged in as "([^"]*)"$/) do |email|
  visit new_user_session_path
  fill_in "Email", with: email
  fill_in "Password", with: 'password'
  click_button "Log in"
  expect(page).to have_content "Signed in successfully"
end

Given(/^I am not logged in$/) do
  current_driver = Capybara.current_driver
  begin
    Capybara.current_driver = :rack_test
    page.driver.submit :delete, "/users/sign_out", {}
  ensure
    Capybara.current_driver = current_driver
  end
end

def set_goto(page)
  @goto = user_facebook_omniauth_authorize_path if page == "Facebook Login"
  @goto = root_path if page == "home"
  @goto = new_user_session_path if page == "Login"
  @goto = new_user_registration_path if page == "registration"
  @goto = edit_user_registration_path if page == "Edit Profile"
  @goto = user_profile_path if page == "Profile"
  @goto = private_path if page == "private information"
end

Given(/^I am on the "([^"]*)" page for "([^"]*)"$/) do |page, name|
  user_id = User.find_by(name: name).id
  case page
  when "compose"
    visit new_user_article_path(user_id)
    expect(current_path).to eq new_user_article_path(user_id)
  when "article"
    visit user_articles_path(user_id)
    expect(current_path).to eq user_articles_path(user_id)
  when "profile"
    visit user_profile_path(user_id)
    expect(current_path).to eq user_profile_path(user_id)
  else
    "nothing"
  end
end

Then(/^I should be on the "([^"]*)" page for "([^"]*)"$/) do |page, name|
  user_id = User.find_by(name: name).id
  case page
  when "profile"
    expect(current_path).to eq user_profile_path(user_id)
  else
    "nothing"
  end
end

Then(/^I should see:$/) do |table|
  table.hashes.each do |hash|
    expect(page).to have_content hash[:content]
  end
end
