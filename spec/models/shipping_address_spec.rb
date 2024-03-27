require 'rails_helper'

RSpec.describe ShippingAddress, type: :model do
  before do
    @shipping_address = FactoryBot.build(:shipping_address)
  end

  describe '配送先情報登録' do
    context '登録できる場合' do

      it 'postal_codeとprefecture_id、cityとaddressとbuildingとphone_numberとorder_idが存在すれば登録できる' do
        expect(@shipping_address).to be_valid
      end
      it ' 建物名が無くても登録できる'do
        @shipping_address.building = ""
      end
    end

    context '登録できない場合' do
      it '郵便番号が空では登録できない' do
        @shipping_address.postal_code = ''
        @shipping_address.valid?
        expect(@shipping_address.errors.full_messages).to include("Postal code can't be blank")
      end
      it '郵便番号は、「3桁ハイフン4桁」の半角文字列のみでないと登録できない' do
        @shipping_address.postal_code = '1234567'             
        @shipping_address.valid?
        expect(@shipping_address.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
      it '都道府県が---では登録できない' do
        @shipping_address.prefecture_id = 0
        @shipping_address.valid?

        expect(@shipping_address.errors.full_messages).to include("Prefecture must be other than 0")
      end
      it '市区町村が空では登録できない' do
        @shipping_address.city = ''
        @shipping_address.valid?
        expect(@shipping_address.errors.full_messages).to include("City can't be blank")
      end
      it '番地が空では登録できない' do
        @shipping_address.address = ''
        @shipping_address.valid?
        expect(@shipping_address.errors.full_messages).to include("Address can't be blank")
      end
      it '電話番号が空では登録できない' do
        @shipping_address.phone_number = ''
        @shipping_address.valid?
        expect(@shipping_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it '電話番号は、9桁以下では購入できない' do
        @shipping_address.phone_number = '110000000'
        @shipping_address.valid?
        expect(@shipping_address.errors.full_messages).to include("Phone number is invalid. ")
      end
      it '電話番号は、12桁以上では購入できない' do
        @shipping_address.phone_number = '110000000111'
        @shipping_address.valid?
        expect(@shipping_address.errors.full_messages).to include("Phone number is invalid. ")
      end
      it '電話番号に半角数字以外が含まれている場合は購入できない' do
        @shipping_address.phone_number = 'aa２aa'
        @shipping_address.valid?
        expect(@shipping_address.errors.full_messages).to include("Phone number is invalid. ")
      end
      it 'orderが紐づいていないと出品できない' do
        @shipping_address.order = nil
        @shipping_address.valid?
        expect(@shipping_address.errors.full_messages).to include("Order must exist")
      end
     
    end
  end
end
