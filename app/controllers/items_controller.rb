class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:show, :edit, :update]
  before_action :login_user_origin?, only: [:edit, :update]

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
  end

  def edit
  end

  def update
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
    redirect_to root_path unless current_user.id == @item.user_id
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
