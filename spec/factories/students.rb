FactoryGirl.define do
  factory :student do
    firstname { Faker::Name.first_name }
    lastname { Faker::Name.last_name }
    email { Faker::Internet.email }
    password 'student'
  end
end
