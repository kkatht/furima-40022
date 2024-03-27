class OrdersController < ApplicationController

  before_action :authenticate_user!, only: :index

  def index
      gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
      item_set
     if current_user.id == @item.user_id
      redirect_to root_path
     elsif  Order.exists?(item_id: @item.id)
      redirect_to root_path
     else
      item_set
      @order_shipping_address = OrderShippingAddress.new
    end
  end

  def new
  end

  def create
    @item = Item.find(params[:order_shipping_address][:order][:item_id])
    @order_shipping_address = OrderShippingAddress.new(order_params)
    if @order_shipping_address.valid?
      pay_item
      @order_shipping_address.save
      return redirect_to root_path
    else
     render 'index', status: :unprocessable_entity
    end
  end


  private

  def order_params
    params.require(:order_shipping_address).permit(:postal_code, :prefecture_id, :city, :address, :building, :phone_number, :order_id, :user_id, :item_id).merge(user_id: current_user.id, token: params[:token], price: params[:order_shipping_address][:order][:price], item_id: params[:order_shipping_address][:order][:item_id], prefecture_id: params[:order_shipping_address][:prefecture_id])
  end

  def item_set
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: order_params[:price],
      card: order_params[:token],
      currency: 'jpy'
    )
  end

end