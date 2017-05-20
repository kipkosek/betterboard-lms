FactoryGirl.define do
  factory :instructor do
    firstname { Faker::Name.first_name }
    lastname { Faker::Name.last_name }
    email { Faker::Internet.email }
    password 'instructor'
  end
end
