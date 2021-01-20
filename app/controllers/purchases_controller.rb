class SoldItemsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item_id
  before_action :prevent_sold_item
  before_action :prevent_myindex
  
  def index
    @purchase_buying = PurchaseBuying.new
  end

  def create
    @purchase_buying = PurchaseBuying.new(purchase_params)
    if @purchase_buying.valid?
      @purchase_buying.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private

  def purchase_params
    params.require(:purchase_buying).permit(:zip_code, :shipping_area_id, :municipality, :street_number, :building_name, :telephone_number).merge(user_id: current_user.id, item_id: @item.id) #token: params[:token])
  end

  def set_item_id
    @item = Item.find(params[:item_id])
  end