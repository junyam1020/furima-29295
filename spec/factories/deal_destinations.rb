FactoryBot.define do
  factory :deal_destination do
    skip_create

    token        { Faker::Lorem.characters(number: 20) }
    postal_code  { Faker::Number.number(digits: 7).to_s.insert(3, '-') }
    prefecture   { Faker::Number.within(range: 1..47) }
    city         { Faker::Address.city }
    house_number { Faker::Address.building_number }
    building     { Faker::Address.mail_box }
    phone_number { Faker::Number.number(digits: 11) }
  end
end
