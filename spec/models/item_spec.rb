require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe 'itemの保存' do
    context 'itemが保存できる場合' do
      it '必要な情報が全て存在すれば保存できる' do
        expect(@item).to be_valid
      end
    end

    context 'itemの保存ができない場合' do
      it 'titleが空では登録できない' do
        @item.title = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Title can't be blank")
      end
      it 'contentが空では登録できない' do
        @item.content = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Content can't be blank")
      end
      it 'imageが空では登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'categoryが空では登録できない' do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it 'chargeが空では登録できない' do
        @item.charge_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Charge can't be blank")
      end
      it 'ship_dayが空では登録できない' do
        @item.ship_day_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Ship day can't be blank")
      end
      it 'conditionが空では登録できない' do
        @item.condition_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end
      it 'prefectureが空では登録できない' do
        @item.prefecture_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'priceが空では登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it '価格が¥300より少ない時は登録できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is invalid")
      end
      it '価格が¥10,000,000より大きい時は登録できない' do
        @item.price = 10,000,000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is invalid")
      end
      it '価格は半角数値でないと登録できない' do
        @item.price = '４００'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is invalid")
      end
      it 'userが紐付いていないと保存できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end

end
