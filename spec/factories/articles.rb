

FactoryGirl.define do
  factory :article do
    title "MyString"
    body "MyText"
    association :user, factory: :user
  end
end
