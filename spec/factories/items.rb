FactoryBot.define do
  factory :item do
    image            { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/test1.jpg')) }
    name             { Faker::Lorem.words }
    description      { Faker::Lorem.sentences }
    category_id      { Faker::Number.within(range: 1..10) }
    status_id        { Faker::Number.within(range: 1..6) }
    delivery_fee_id  { Faker::Number.within(range: 1..2) }
    shipper_area_id  { Faker::Number.within(range: 1..47) }
    shipment_date_id { Faker::Number.within(range: 1..3) }
    price            { Faker::Number.within(range: 300..9_999_999) }
    association :user
  end
end
