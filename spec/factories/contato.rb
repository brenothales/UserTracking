FactoryGirl.define do
  factory :contato do
    nome { Faker::Name.first_name }
    email { Faker::Internet.email }
  end
end