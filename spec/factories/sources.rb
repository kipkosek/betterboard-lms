FactoryGirl.define do
  factory :source do
    title { Faker::Book.title }
    description { Faker::Lorem.sentence }
    file { Faker::Internet.url }
    link { Faker::Internet.url }
    youtube { Faker::Internet.url }
  end
end
