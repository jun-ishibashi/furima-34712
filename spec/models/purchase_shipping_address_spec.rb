require 'rails_helper'

RSpec.describe PurchaseShippingAddress, type: :model do
  describe '商品の購入' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @purchase_shipping_address = FactoryBot.build(:purchase_shipping_address, user_id: user.id, item_id: item.id)
      sleep 0.1
    end

    context '商品が購入できる場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@purchase_shipping_address).to be_valid
      end
      it 'buildingは空でも保存できること' do
        @purchase_shipping_address.building = ''
        expect(@purchase_shipping_address).to be_valid
      end
    end

    context '商品が購入できない場合' do
      it 'postcodeが空だと購入できないこと' do
        @purchase_shipping_address.postcode = ''
        @purchase_shipping_address.valid?
        expect(@purchase_shipping_address.errors.full_messages).to include("Postcode can't be blank")
      end
      it 'postal_codeが半角のハイフンを含んでいないと購入できないこと' do
        @purchase_shipping_address.postcode = '1234567'
        @purchase_shipping_address.valid?
        expect(@purchase_shipping_address.errors.full_messages).to include('Postcode is invalid. Include hyphen(-)')
      end
      it 'prefectureを選択していないと購入できないこと' do
        @purchase_shipping_address.prefecture = 0
        @purchase_shipping_address.valid?
        expect(@purchase_shipping_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'cityが空だと購入できないこと' do
        @purchase_shipping_address.city = ''
        @purchase_shipping_address.valid?
        expect(@purchase_shipping_address.errors.full_messages).to include("City can't be blank")
      end
      it 'blockが空だと購入できないこと' do
        @purchase_shipping_address.block = ''
        @purchase_shipping_address.valid?
        expect(@purchase_shipping_address.errors.full_messages).to include("Block can't be blank")
      end
      it 'phone_numberが空だと購入できないこと' do
        @purchase_shipping_address.phone_number = ''
        @purchase_shipping_address.valid?
        expect(@purchase_shipping_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberが12桁以上だと購入できないこと' do
        @purchase_shipping_address.phone_number = '111222233334'
        @purchase_shipping_address.valid?
        expect(@purchase_shipping_address.errors.full_messages).to include('Phone number is invalid.')
      end
      it 'tokenが空では登録できないこと' do
        @purchase_shipping_address.token = nil
        @purchase_shipping_address.valid?
        expect(@purchase_shipping_address.errors.full_messages).to include("Token can't be blank")
      end
      it 'userが紐付いていないと保存できないこと' do
        @purchase_shipping_address.user_id = nil
        @purchase_shipping_address.valid?
        expect(@purchase_shipping_address.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐付いていないと保存できないこと' do
        @purchase_shipping_address.item_id = nil
        @purchase_shipping_address.valid?
        expect(@purchase_shipping_address.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
