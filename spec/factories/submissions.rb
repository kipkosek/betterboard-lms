FactoryGirl.define do
  factory :submission do
    note "MyText"
    file "MyString"
    grade 1
    assignment_id 1
    user_id 1
  end
end
