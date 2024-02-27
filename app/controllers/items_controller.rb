class ItemsController < ApplicationController

  before_action :authenticate_user!, only: :new

    def new
      @item = Item.new
    end

    def create
      @item = Item.create(item_params)
      if @item.save
        redirect_to root_path
      else
        render :new, status: :unprocessable_entity
      end
    end


    private
    def item_params
      params.require(:item).permit(:name, :price, :category_id, :sales_status_id, :shipping_fee_status_id, :prefecture_id, :scheduled_delivery_id, :info, :user, :image).merge(user_id: current_user.id)
    end

end
