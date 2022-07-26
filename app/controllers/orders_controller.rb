class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :set_order, only: [:index, :create]
  before_action :set_id, only: [:index, :create]

  def index
    @order_destination = OrderDestination.new
    if current_user == @item.user
      redirect_to root_path
    end
  end

  def create
    @order_destination = OrderDestination.new(order_params)
    if @order_destination.valid?
      pay_item
      @order_destination.save
      redirect_to root_path
    else
      render :index
    end
  end

  def set_order
    @item = Item.find(params[:item_id])
  end

  def set_id
    redirect_to root_path if !@item.order.nil?
  end

  private

  def order_params
    params.require(:order_destination).permit(:zip, :prefecture_id, :city, :address, :building, :tel, :item_id).merge(
      user_id: current_user.id, item_id: params[:item_id], token: params[:token]
    )
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end
end
