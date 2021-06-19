FactoryBot.define do
  factory :purchase_shipping_address do
    postcode { '123-4567' }
    prefecture { 1 }
    city { '東京都' }
    block { '世田谷区1-1' }
    building { 'メゾン世田谷' }
    phone_number { '11111111111' }
  end
end
