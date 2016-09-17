Then(/^"([^"]*)" should have a latitude$/) do |name|
  user = User.find_by(name: name)
  expect(user.latitude).not_to be nil
end

And(/^I should see a Google Map$/) do
  loop until all(:css, '#map').length == 1
  expect(page).to have_css '#map'
end
