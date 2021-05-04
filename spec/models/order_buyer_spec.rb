require 'rails_helper'

RSpec.describe OrderBuyer, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order_buyer = FactoryBot.build(:order_buyer, user_id: user.id, item_id: item.id)
    sleep(1)
  end

  describe '商品購入機能' do
    context '商品購入が上手くいく時' do
      it '項目が全て存在すれば購入できる' do
        expect(@order_buyer).to be_valid
      end
      it 'postal_codeが半角数字3桁ハイフン半角数字4桁の8桁であれば購入できる' do
        @order_buyer.postal_code = '123-4567'
        expect(@order_buyer).to be_valid
      end
      it 'buildingがなくても購入できる' do
        @order_buyer.building = ''
        expect(@order_buyer).to be_valid
      end
      it 'phone_numが半角数字のみで11桁以内なら購入できる' do
        @order_buyer.phone_num = '09012345678'
        expect(@order_buyer).to be_valid
      end
    end
    context '商品購入が上手くいかない時' do
      it 'postal_codeが空では購入できない' do
        @order_buyer.postal_code = ''
        @order_buyer.valid?
        expect(@order_buyer.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeがハイフンを含んでいないと購入できない' do
        @order_buyer.postal_code = '1234567'
        @order_buyer.valid?
        expect(@order_buyer.errors.full_messages).to include("Postal code Input correctly")
      end
      it 'postal_codeの前半が半角数字2桁以下だと購入できない' do
        @order_buyer.postal_code = '12-3456'
        @order_buyer.valid?
        expect(@order_buyer.errors.full_messages).to include("Postal code Input correctly")
      end
      it 'postal_codeの前半が半角数字4桁以上だと購入できない' do
        @order_buyer.postal_code = '1234-5678'
        @order_buyer.valid?
        expect(@order_buyer.errors.full_messages).to include("Postal code Input correctly")
      end
      it 'postal_codeの後半が半角数字3桁以下だと購入できない' do
        @order_buyer.postal_code = '123-567'
        @order_buyer.valid?
        expect(@order_buyer.errors.full_messages).to include("Postal code Input correctly")
      end
      it 'postal_codeの後半が半角数字5桁以上だと購入できない' do
        @order_buyer.postal_code = '123-56789'
        @order_buyer.valid?
        expect(@order_buyer.errors.full_messages).to include("Postal code Input correctly")
      end
      it 'postal_codeが全角だと購入できない' do
        @order_buyer.postal_code = '１２３ー４５６７'
        @order_buyer.valid?
        expect(@order_buyer.errors.full_messages).to include("Postal code Input correctly")
      end
      it 'prefecture_idが選択されていなければ購入できない' do
        @order_buyer.prefecture_id = 1
        @order_buyer.valid?
        expect(@order_buyer.errors.full_messages).to include("Prefecture Select")
      end
      it 'cityが空では購入できない' do
        @order_buyer.city = ''
        @order_buyer.valid?
        expect(@order_buyer.errors.full_messages).to include("City can't be blank")
      end
      it 'blockが空では購入できない' do
        @order_buyer.block = ''
        @order_buyer.valid?
        expect(@order_buyer.errors.full_messages).to include("Block can't be blank")
      end
      it 'phone_numが空では購入できない' do
        @order_buyer.phone_num = ''
        @order_buyer.valid?
        expect(@order_buyer.errors.full_messages).to include("Phone num can't be blank")
      end
      it 'phone_numが半角英字では購入できない' do
        @order_buyer.phone_num = 'aaaaaaaaaaa'
        @order_buyer.valid?
        expect(@order_buyer.errors.full_messages).to include("Phone num Input only number")
      end
      it 'phone_numが全角では購入できない' do
        @order_buyer.phone_num = '０９０１２３４５６７８'
        @order_buyer.valid?
        expect(@order_buyer.errors.full_messages).to include("Phone num Input only number")
      end
      it 'phone_numが12桁以上では購入できない' do
        @order_buyer.phone_num = '090123456789'
        @order_buyer.valid?
        expect(@order_buyer.errors.full_messages).to include("Phone num is too long (maximum is 11 characters)")
      end
    end
  end
end
