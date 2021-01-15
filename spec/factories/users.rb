FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.free_email }
    password              { 'sss000' }
    password_confirmation { password }
    first_name            { '米森' }
    last_name             { '伴幸' }
    first_name_kana       { 'ヨネモリ' }
    last_name_kana        { 'トモユキ' }
    birth_date            { '1932-04-05' }
  end
end
