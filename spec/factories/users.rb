FactoryBot.define do
  factory :user do
    nickname { 'ガッキー' }
    email { Faker::Internet.free_email }
    password { 'test1234' }
    password_confirmation { password }
    last_name { '新垣' }
    first_name { '結衣' }
    last_name_kana { 'アラガキ' }
    first_name_kana { 'ユイ' }
    birth_date { '2000-01-01' }
  end
end
