FactoryGirl.define do
  factory :user do
    name                  "foo"
    email                 "foo@bar.com"
    password              "foobar"
    password_confirmation "foobar"
  end
end
