FactoryGirl.define do
  factory :user do
    name "My Name"
    email "My@Email.com"
    password "password"
    password_confirmation "password"
  end

end
