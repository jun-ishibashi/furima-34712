FactoryBot.define do
  factory :item do
    name { 'タケコプター' }
    description { '空を飛べる' }
    category_id { 1 }
    condition_id { 1 }
    payment_id { 1 }
    prefecture_id { 1 }
    shipping_day_id { 1 }
    price { 2000 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test-takekopta.png'), filename: 'test-takekopta.png')
    end
  end
end
