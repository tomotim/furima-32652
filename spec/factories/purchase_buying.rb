FactoryBot.define do
  factory :purchase_buying do
    association :user
    association :item
    zip_code { '123-4567' }
    shipping_area_id { 1 }
    municipality { '東京都' }
    street_number { '1-1' }
    building_name { '東京ツール' }
    telephone_number { '08028190297' }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
