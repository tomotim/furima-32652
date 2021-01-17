class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :login_user_origin?, only: :edit
  
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

  def show
    @item = Item.find(params[:id])
  end

  def edit
     @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(items_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  private

  def items_params
    params.require(:item).permit(:image, :product, :explanation, :ctegory_id, :condtion_id, :burden_id, :shipping_area_id,
                                 :shipping_days_id, :price).merge(user_id: current_user.id)
  end

  def login_user_origin?
    @item = Item.find(params[:id])
    unless current_user.id == @item.user_id 
      redirect_to root_path 
    end
  end

end
