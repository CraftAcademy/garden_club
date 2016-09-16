Then(/^the user "([^"]*)" should exist with name "([^"]*)"$/) do |email, name|
  expect((User.find_by(email: email))).not_to be nil
end

When(/^I fill in the form with data :$/) do |table|
  data = table.hashes.first
  data.each do |label, value|
    if !value.empty?
      fill_in label, with: value
    end
  end
end

Given(/^the following users exist:$/) do |table|
  table.hashes.each do |hash|
    FactoryGirl.create(:user, hash)
  end
end

When(/^I fill in:$/) do |table|
  table.hashes.each do |hash|
      fill_in hash[:element], with: hash[:content]
  end
end
