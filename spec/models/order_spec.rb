require 'rails_helper'

RSpec.describe Order, type: :model do
  before do
    @order = FactoryBot.build(:order)
  end

  describe '購入機能' do
    context '購入できる場合' do
      it 'user_idとitem_idが存在すれば登録できる'do
        expect(@order).to be_valid
      end
    end

    context '購入できない場合' do
      it 'user_idが紐づいてなければ登録できない' do
        @order.user = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("User must exist")
      end
      it 'item_idが紐づいてなければ登録できない' do
        @order.item = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Item must exist")
      end
    end
  end
end
