class ItemsController < ApplicationController
  def index
    #@item = Item.includes(:user)
  end

  def new
  end


  private
  def items_params
    params.require(:item).permit(:content, :image).merge(user_id: current_user.id)
  end

end
