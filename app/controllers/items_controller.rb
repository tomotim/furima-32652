class ItemsController < ApplicationController
  def index
    @items = Item.includes(:user).order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(items_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def items_params
    params.require(:item).permit(:image, :product, :explanation, :ctegory_id, :condtion_id, :burden_id, :shipping_area_id, :shipping_days_id, :price ).merge(user_id: current_user.id)
  end

end
