class ItemsController < ApplicationController

  before_action :authenticate_user!, only: [:new, :edit]
  before_action :set_item, only: [:edit, :show, :update]

    def index
      @items = Item.all.order('created_at DESC')
    end

    def new
      @item = Item.new
    end

    def create
      @item = Item.new(item_params)
      if @item.save
        redirect_to root_path
      else
        render :new, status: :unprocessable_entity
      end
    end


    def show
    end

    def edit
      if current_user.id != @item.user_id
        redirect_to root_path
      end
    end 


    def update
      if @item.update(item_params)
        redirect_to item_path
      else
        render :edit, status: :unprocessable_entity
      end 
    end


    def destroy
        @item = Item.find(params[:id])
        @item.destroy
        redirect_to root_path
    end
    

    def set_item
      @item = Item.find(params[:id])
    end


    private
    def item_params
      params.require(:item).permit(:name, :price, :category_id, :sales_status_id, :shipping_fee_status_id, :prefecture_id, :scheduled_delivery_id, :info, :image).merge(user_id: current_user.id)
    end

end
