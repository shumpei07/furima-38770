class Order < ApplicationRecord
    attr_accessor :token
    belongs_to :user
    belongs_to :item
    has_one :shipping_address
    
    
    def new
      @order_shipping_address = OrderShippingAddress.new
    end
  
    def create
      @order_shipping_address = OrderShippingAddress.new(order_params)
      if @order_shipping_address.valid?
        @order_shipping_address.save
        redirect_to root_path
      else
        render :new
      end
    end

      private

  def order_params
    params.require(:order_shipping_address).permit(:post_number, :prefecture, :city, :house_number, :building_name, :phone_number).merge(user_id: current_user.id)
  end
end
