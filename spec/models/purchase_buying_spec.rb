require 'rails_helper'

RSpec.describe PurchaseBuying, type: :model do
  describe '購入情報の保存' do
    before do
      @user = FactoryBot.create(:user)
      @item = FactoryBot.create(:item)
      @purchase_buying = FactoryBot.build(:purchase_buying, user_id: @user.id, item_id: @item.id)
    end

    context '購入情報が保存できるとき' do
      it 'すべての値が正しく入力されていれば保存できる' do
        expect(@purchase_buying).to be_valid
      end
      it 'building_nameが空でも保存できる' do
        @purchase_buying.building_name = ''
        expect(@purchase_buying).to be_valid
      end
    end

    context '購入情報が保存できないとき' do
      # user_idに関するテスト
      it 'user_idが存在しないと保存できない' do
        @purchase_buying.user_id = ''
        @purchase_buying.valid?
        expect(@purchase_buying.errors.full_messages).to include("User can't be blank")
      end
      # item_idに関するテスト
      it 'item_idが存在しないと保存できない' do
        @purchase_buying.item_id = ''
        @purchase_buying.valid?
        expect(@purchase_buying.errors.full_messages).to include("Item can't be blank")
      end
      # tokenに関するテスト
      it 'tokenが正しく生成されない（カード情報が不正）だと保存できない' do
        @purchase_buying.token = ''
        @purchase_buying.valid?
        expect(@purchase_buying.errors.full_messages).to include("Token can't be blank")
      end
      # postal_codeに関するテスト
      it 'zip_codeが空だと保存できない' do
        @purchase_buying.zip_code = ''
        @purchase_buying.valid?
        expect(@purchase_buying.errors.full_messages).to include("Zip code can't be blank")
      end
      it 'zip_codeが半角のハイフンを含んだ形式でないと保存できない' do
        @purchase_buying.zip_code = '1234567'
        @purchase_buying.valid?
        expect(@purchase_buying.errors.full_messages).to include('Zip code Input correctly')
      end
      it 'zip_codeが8桁以上だと保存できない' do
        @purchase_buying.zip_code = '1234-5678'
        @purchase_buying.valid?
        expect(@purchase_buying.errors.full_messages).to include('Zip code Input correctly')
      end
      it 'zip_codeが半角英字が含まれていると保存できない' do
        @purchase_buying.zip_code = '123abcd'
        @purchase_buying.valid?
        expect(@purchase_buying.errors.full_messages).to include('Zip code Input correctly')
      end
      it 'zip_codeが全角英字が含まれていると保存できない' do
        @purchase_buying.zip_code = 'ａｂｃｄｅｆｇ'
        @purchase_buying.valid?
        expect(@purchase_buying.errors.full_messages).to include('Zip code Input correctly')
      end
      # shipping_area_idに関するコード
      it 'shipping_areaを選択していないと保存できない' do
        @purchase_buying.shipping_area_id = ''
        @purchase_buying.valid?
        expect(@purchase_buying.errors.full_messages).to include('Shipping area select')
      end
      it 'shipping_areaが0だと保存できない' do
        @purchase_buying.shipping_area_id = 0
        @purchase_buying.valid?
        expect(@purchase_buying.errors.full_messages).to include('Shipping area select')
      end
      # municipalityに関するコード
      it 'municipalityが空だと保存できない' do
        @purchase_buying.municipality = ''
        @purchase_buying.valid?
        expect(@purchase_buying.errors.full_messages).to include("Municipality can't be blank")
      end
      # street_numberに関するコード
      it 'street_numberは空だと保存できない' do
        @purchase_buying.street_number = ''
        @purchase_buying.valid?
        expect(@purchase_buying.errors.full_messages).to include("Street number can't be blank")
      end
      # building_nameに関するコード

      # telephone_numberに関するコード
      it 'telephone_numberが空だと保存できない' do
        @purchase_buying.telephone_number = ''
        @purchase_buying.valid?
        expect(@purchase_buying.errors.full_messages).to include("Telephone number can't be blank")
      end
      it 'telephone_numberが11桁以下だと保存できない' do
        @purchase_buying.telephone_number = '0901234567'
        @purchase_buying.valid?
        expect(@purchase_buying.errors.full_messages).to include('Telephone number Input only number')
      end
      it 'telephone_numberが13桁以上だと保存できない' do
        @purchase_buying.telephone_number = '090123456789'
        @purchase_buying.valid?
        expect(@purchase_buying.errors.full_messages).to include('Telephone number Input only number')
      end
      it 'telephone_numberに半角英字が含まれていると保存できない' do
        @purchase_buying.telephone_number = 'abcdefghijk'
        @purchase_buying.valid?
        expect(@purchase_buying.errors.full_messages).to include('Telephone number Input only number')
      end
      it 'telephone_numberに全角英字が含まれていると保存できない' do
        @purchase_buying.telephone_number = 'ａｂｃｄｅｆｇｈｉｊｋ'
        @purchase_buying.valid?
        expect(@purchase_buying.errors.full_messages).to include('Telephone number Input only number')
      end
      it 'telephone_numberに日本語が含まれていると保存できない' do
        @purchase_buying.telephone_number = 'ああああああああああああ'
        @purchase_buying.valid?
        expect(@purchase_buying.errors.full_messages).to include('Telephone number Input only number')
      end
    end
  end
end
