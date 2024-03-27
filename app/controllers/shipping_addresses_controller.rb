class ShippingAddressesController < ApplicationController
#-------------------------------これはいらないファイル------------------------------------
  before_action :authenticate_user!, only: :create

    def new
    end

    def create
      binding.pry
      @shipping_address = ShippingAddress.new(shipping_address_params)
      if @shipping_address.save
        redirect_to root_path
      else
        render :new, status: :unprocessable_entity
      end
    end

  private
    def shipping_address_params
      params.require(:shipping_address).permit(:postal_code, :prefecture_id, :city, :address, :building, :phone_number).merge(order: order.id)
    end

end
