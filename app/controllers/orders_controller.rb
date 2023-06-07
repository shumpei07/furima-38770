class OrdersController < ApplicationController
  before_action :authenticate_user!,only: [:index, :create]
  before_action :set_item, only:[:index, :create]


  def index
  @order = OrderShippingAddress.new
    if @item.user == current_user
      redirect_to root_path
      return
    end

    if @item.order.present?
      redirect_to root_path
      return
    end
  end

  def create
    @order = OrderShippingAddress.new(order_params)
    if @order.valid?
      pay_item
      @order.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def order_params
    params.require(:order_shipping_address).permit(:post_number, :prefecture_id, :city, :house_number, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id],token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
        amount: @item.price,  # 商品の値段
        card: order_params[:token],    # カードトークン
        currency: 'jpy'                 # 通貨の種類（日本円）
      )
  end

   
end
