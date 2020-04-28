class ItemsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user,   only: :destroy

  def show
    @item = Item.find(params[:id])
    @comment = @item.comments.build
  end

  def new
    @item  = current_user.items.build
  end

  def create
    @item = current_user.items.build(item_params)
    if @item.save
      flash[:success] = "Item created!"
      redirect_to root_url
    else
      @feed_items = []
      render 'static_pages/home'
    end
  end

  def destroy
    @item.destroy
    flash[:success] = "Item deleted"
    redirect_to root_url
  end



  private

  def item_params
    params.require(:item).permit(:content, :picture, :seller_area, :name, :price, :category, :days_to_ship, :condition, :shipping_fee)
  end

  def correct_user
    @item = current_user.items.find_by(id: params[:id])
    redirect_to root_url if @item.nil?
  end
end
