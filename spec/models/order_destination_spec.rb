require 'rails_helper'

RSpec.describe OrderDestination, type: :model do
  describe '購入情報の保存' do
    before do
      @user = FactoryBot.create(:user)
      @item = FactoryBot.build(:item)
      @item.image = fixture_file_upload('app/assets/images/test_image.jpeg')
      @item.save
      @order_destination = FactoryBot.build(:order_destination, user_id: @user.id, item_id: @item.id)
      sleep 0.1
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order_destination).to be_valid
      end
      it 'buildingは空でも保存できること' do
        @order_destination.building = ''
        expect(@order_destination).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'zipが空だと保存できないこと' do
        @order_destination.zip = ''
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Zip can't be blank")
      end
      it 'zipは、「3桁ハイフン4桁」の半角文字列でないと保存できないこと' do
        @order_destination.zip = '1234-123'
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Zip is invalid. Include hyphen(-)")
      end
      it 'prefectureを選択していないと保存できないこと' do
        @order_destination.prefecture_id = nil
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'cityが空だと保存できないこと' do
        @order_destination.city = ''
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("City can't be blank")
      end
      it 'addressが空だと保存できないこと' do
        @order_destination.address = ''
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Address can't be blank")
      end
      it 'telが空だと保存できないこと' do
        @order_destination.tel = ''
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Tel can't be blank")
      end
      it 'telは10桁以上11桁以内でないと保存できないこと' do
        @order_destination.tel = '123456789'
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Tel is invalid")
      end
      it 'telは半角数値でないと保存できないこと' do
        @order_destination.tel = '１２３４５６７８９０'
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Tel is invalid")
      end
      it 'userが紐付いていないと保存できないこと' do
        @order_destination.user_id = nil
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐付いていないと保存できないこと' do
        @order_destination.item_id = nil
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
