class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :update]

  def index
    @items = Item.order('created_at DESC')
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

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
    if @item.user_id != current_user.id
      redirect_to root_path
    end
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  # def destroy
  #   item = Item.find(params[:id])
  #   item.destroy
  #   redirect_to root_path
  # end

  private

  def item_params
    params.require(:item).permit(:title, :content, :image, :price, :category_id, :condition_id, :charge_id, :ship_day_id,
                                 :prefecture_id).merge(user_id: current_user.id)
  end
end
