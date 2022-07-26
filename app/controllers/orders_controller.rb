class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @order_destination = OrderDestination.new
  end

  def create
    @item = Item.find(params[:item_id])
    @order_destination = OrderDestination.new(order_params)
    if @order_destination.valid?
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order_destination).permit(:zip, :prefecture_id, :city, :address, :building, :tel, :item_id).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
