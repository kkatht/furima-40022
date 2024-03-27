require 'rails_helper'

RSpec.describe OrderShippingAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order_shipping_address = FactoryBot.build(:order_shipping_address, user_id: user.id, item_id: item.id)
    #binding.pry
  end
  describe '購入情報の保存' do
    context '登録できる場合' do

      it 'postal_codeとprefecture_id、cityとaddressとbuildingとphone_numberとorder_idが存在すれば登録できる' do
        expect(@order_shipping_address).to be_valid
      end
      it ' 建物名が無くても登録できる'do
        @order_shipping_address.building = ""
      end
    end

    context '登録できない場合' do
      it 'tokenが空では登録できない' do
        @order_shipping_address.token = ''
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("Token can't be blank")
      end
      it '郵便番号が空では登録できない' do
        @order_shipping_address.postal_code = ''
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("Postal code can't be blank")
      end
      it '郵便番号は、「3桁ハイフン4桁」の半角文字列のみでないと登録できない' do
        @order_shipping_address.postal_code = '1234567'             
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
      it '都道府県が---では登録できない' do
        @order_shipping_address.prefecture_id = 0
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("Prefecture must be other than 0")
      end
      it '市区町村が空では登録できない' do
        @order_shipping_address.city = ''
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("City can't be blank")
      end
      it '番地が空では登録できない' do
        @order_shipping_address.address = ''
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("Address can't be blank")
      end
      it '電話番号が空では登録できない' do
        @order_shipping_address.phone_number = ''
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it '電話番号は、9桁以下では購入できない' do
        @order_shipping_address.phone_number = '110000000'
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("Phone number is invalid. ")
      end
      it '電話番号は、12桁以上では購入できない' do
        @order_shipping_address.phone_number = '110000000111'
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("Phone number is invalid. ")
      end
      it '電話番号に半角数字以外が含まれている場合は購入できない' do
        @order_shipping_address.phone_number = 'aa２aa'
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("Phone number is invalid. ")
      end
      it 'userが紐づいていないと出品できない' do
        @order_shipping_address.user_id = nil
        @order_shipping_address.valid?
        #binding.pry
        expect(@order_shipping_address.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐づいていないと出品できない' do
        @order_shipping_address.item_id = nil
        @order_shipping_address.valid?
        #binding.pry
        expect(@order_shipping_address.errors.full_messages).to include("Item can't be blank")
      end
     
    end
  end
end
