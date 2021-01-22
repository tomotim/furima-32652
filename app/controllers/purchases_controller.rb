class PurchasesController < ApplicationController
before_action :authenticate_user!
before_action :set_item_id
before_action :prevent_purchase
before_action :prevent_myindex

def index
  @purchase_buying = PurchaseBuying.new
end

def create
  @purchase_buying = PurchaseBuying.new(purchase_params)
  if @purchase_buying.valid?
    pay_item
    @purchase_buying.save
    redirect_to root_path
  else
    render action: :index
  end
end

private

def purchase_params
  params.require(:purchase_buying).permit(:zip_code, :shipping_area_id, :municipality, :street_number, :building_name, :telephone_number).merge(user_id: current_user.id, item_id: @item.id, token: params[:token])
end

def set_item_id
  @item = Item.find(params[:item_id])
end

def pay_item
  Payjp.api_key = ENV['PAYJP_SECRET_KEY']
  Payjp::Charge.create(
    amount: @item.price,
    # paramsの名前はストロングパラメーターのメソッド名
    card: purchase_params[:token],
    currency: 'jpy'
  )
end

# 売却済み商品の購入ページに遷移できない処理
def prevent_purchase
  # 購入テーブルに既に商品が含まれている（購入済み）か判定
  redirect_to root_path if @item.purchase.present?
end

# ログインユーザーが自分の商品購入ページにログインできない処理
def prevent_myindex
  redirect_to root_path if current_user.id == @item.user.id
end
end