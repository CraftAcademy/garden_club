# this needs to be false if you're trying to test actual FB login functionality on the local server. Otherwise, keep it true to prevent us throwing a thousand requests at FB
OmniAuth.config.test_mode = true
OmniAuth.config.mock_auth[:facebook] = nil
OmniAuth.config.mock_auth[:facebook] = OmniAuth::AuthHash.new({"provider"=>"facebook",
 "uid"=>"10101143923045869",
 "info"=>
  {"email"=>"joe@boggs.com",
   "name"=>"Joe Boggs",
   "image"=>"http://graph.facebook.com/v2.6/10101143923045869/picture"},
 "credentials"=>
  {"token"=>
    "EAATRfvIVFs0BAP3uTezasAFPbu8zLbmOyFo28Te663JGzSciMM39idcvdXzWMbahlNJYABSwhQLLvZCBZBoZC6dZB91EdnZC8oPT8I58uHMxlnYQm2RugGgxkn2VJRPLX8WWwZBoFZA53ZASx3qaiiLKRszVpm8RmJUZD",
   "expires_at"=>1479048165,
   "expires"=>true},
 "extra"=>{"raw_info"=>{"name"=>"Amber Wilkie", "email"=>"theamb@gmail.com", "id"=>"10101143923045869"}}
})

When(/^I click the Sign in with Facebook link$/) do
  click_link('Sign in with Facebook')
end
