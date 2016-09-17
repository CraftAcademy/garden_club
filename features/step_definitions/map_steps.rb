Then(/^"([^"]*)" should have a latitude$/) do |name|
  user = User.find_by(name: name)
  expect(user.latitude).not_to be nil
end
