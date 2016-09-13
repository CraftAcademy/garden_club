FactoryGirl.define do
  factory :user do
    name "My Name"
    email "My@Email.com"
    password "MyPassword"
    password_confirmation "MyPassword"
  end
end
