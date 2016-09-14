OmniAuth.config.test_mode = true
OmniAuth.config.mock_auth[:facebook] = nil
OmniAuth.config.mock_auth[:facebook] = OmniAuth::AuthHash.new({
  provider: 'facebook',
  uid: '123545',
  info: {
    email: 'joe@bloggs.com',
    name: 'Joe Bloggs',
    image: 'http://graph.facebook.com/1234567/picture?type=square',
    verified: true
        }
  })

When(/^I click the Sign in with Facebook link$/) do
  click_link('Sign in with Facebook')
end
