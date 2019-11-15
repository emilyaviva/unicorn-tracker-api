FactoryBot.define do
  factory :unicorn do
    name { Faker::FunnyName.name }
    color { Faker::Color.color_name }
    food { Faker::Food.dish }
    location { Faker::House.room }
  end
end
