FactoryGirl.define do
  factory :assignment do
    name { Faker::Lorem.sentence }
    instructions { Faker::Lorem.sentence }
    duedate Faker::Date.forward(30)
  end
end
