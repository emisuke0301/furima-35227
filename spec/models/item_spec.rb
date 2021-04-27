require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品投稿機能' do
    context '商品が投稿できる時' do
      it '項目が全て存在すれば投稿できる' do
        expect(@item).to be_valid
      end
      it 'category_idが選択されていれば投稿できる' do
        @item.category_id = 2
        expect(@item).to be_valid
      end
      it 'status_idが選択されていれば投稿できる' do
        @item.status_id = 2
        expect(@item).to be_valid
      end
      it 'ship_cost_idが選択されていれば投稿できる' do
        @item.ship_cost_id = 2
        expect(@item).to be_valid
      end
      it 'prefecture_idが選択されていれば投稿できる' do
        @item.prefecture_id = 2
        expect(@item).to be_valid
      end
      it 'ship_date_idが選択されていれば投稿できる' do
        @item.ship_date_id = 2
        expect(@item).to be_valid
      end
      it 'priceが半角数字で、300円以上なら投稿できる' do
        @item.price = 300
        expect(@item).to be_valid
      end
      it 'priceが半角数字で、9,999,999円以下なら投稿できる' do
        @item.price = 9999999
        expect(@item).to be_valid
      end
    end
    context '商品が投稿できない時' do
      it 'imageが1枚ないと投稿できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'nameが空だと投稿できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it 'textが空だと投稿できない' do
        @item.text = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Text can't be blank")
      end
      it 'category_idが未選択だと投稿できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category Select")
      end
      it 'status_idが未選択だと投稿できない' do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Status Select")
      end
      it 'ship_cost_idが未選択だと投稿できない' do
        @item.ship_cost_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Ship cost Select")
      end
      it 'prefecture_idが未選択だと投稿できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture Select")
      end
      it 'ship_date_idが未選択だと投稿できない' do
        @item.ship_date_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Ship date Select")
      end
      it 'priceが空だと投稿できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceが299円以下だと投稿できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price Out of setting range")
      end
      it 'priceが10,000,000円以上だと投稿できない' do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price Out of setting range")
      end
      it 'priceが全角文字だと投稿できない' do
        @item.price = '３００'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price Out of setting range")
      end
      it 'priceが半角英字だと投稿できない' do
        @item.price = 'aaa'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price Out of setting range")
      end
      it 'ユーザーが紐付いていなければ投稿できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist")
      end
    end
  end
end
