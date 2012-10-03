FactoryGirl.define do
  factory :user do
    sequence(:name)       { |n| "Person #{n}" }
    sequence(:email)      { |n| "person_#{n}@bar.com" }
    password              "foobar"
    password_confirmation "foobar"
  end

  factory :money do
    description "Rent July 2012"
    value        600
    user
  end
end
