FactoryGirl.define do
  factory :user do
    name Faker::Name.name
    age Faker::Number.between(from = 1, to = 1200)
  end
end
