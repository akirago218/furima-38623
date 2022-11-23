class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index,]

  def index
    @items = Item.all.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

 private

 def item_params
   params.require(:item).permit(:image, :name, :content, :category_id, :status_id, :payer_id, :prefecture_id, :shipping_day_id, :price).merge(user_id: current_user.id)
 end

end