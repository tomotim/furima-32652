require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品情報登録' do
    context '商品が登録できるとき' do
      it '全ての情報が正しく入力されていれば登録できる' do
        expect(@item).to be_valid
      end
    end

    context '商品が登録できないとき' do
      # imageに関するテスト
      it 'imageが空だと登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      # productに関するテスト
      it 'productが空だと登録できない' do
        @item.product = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Product can't be blank")
      end
      # explanationに関するテスト
      it 'explanationが空だと登録できない' do
        @item.explanation = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanation can't be blank")
      end
      # ctegoryに関するテスト
      it 'ctegory_idが未選択だと保存できない' do
        @item.ctegory_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Ctegory select')
      end
      # condtionに関するテスト
      it 'condtion_idが未選択だと登録できない' do
        @item.condtion_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Condtion select')
      end
      # burden_idに関するテスト
      it 'burden_idが未選択だと登録できない' do
        @item.burden_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Burden select')
      end
      # shipping_areaに関するテスト
      it 'shipping_area_idが未選択だと登録できない' do
        @item.shipping_area_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Shipping area select')
      end
      # shipping_daysに関するテスト
      it 'shipping_days_idが未選択だと登録できない' do
        @item.shipping_days_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Shipping days select')
      end
      # priceに関するテスト
      it 'priceが空だと登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank", 'Price is not a number')
      end
      it 'priceの数値が300未満だと登録できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
      end
      it 'priceの数値が10_000_000以上だと登録できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
      end
      it 'priceに全角数字が入力されていると登録できない' do
        @item.price = '５００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
      it 'priceに全角英字が入力されていると登録できない' do
        @item.price = 'ａｂｃ'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
      it 'priceに日本語が入力されていると登録できない' do
        @item.price = '五百円'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
      it 'priceに半角英字が入力されていると登録できない' do
        @item.price = 'abc'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
    end
  end
end