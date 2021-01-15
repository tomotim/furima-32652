FactoryBot.define do
  factory :item do
    product          { '商品名' }
    explanation      { 'これは商品の説明です' }
    ctegory_id       { Faker::Number.between(from: 1, to: 10) }
    condtion_id      { Faker::Number.between(from: 1, to: 6) }
    burden_id        { Faker::Number.between(from: 1, to: 2) }
    shipping_area_id { Faker::Number.between(from: 1, to: 47) }
    shipping_days_id { Faker::Number.between(from: 1, to: 3) }
    price            { Faker::Number.between(from: 300, to: 9_999_999) }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end