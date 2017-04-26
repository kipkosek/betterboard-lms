# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#Create Students
10.times do
  Student.create!(
    firstname: Faker::Name.first_name,
    lastname: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: 'helloworld'
  )
end
students = Student.all

#Create Sources
10.times do
  Source.create!(
    title: Faker::Book.title,
    description: Faker::Lorem.sentence,
    link: Faker::Internet.url
  )
end
sources = Source.all

puts "Seed finished"
puts "#{Student.count} students created"
puts "#{Source.count} sources created"
