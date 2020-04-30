class DealingsController < ApplicationController
  before_action :logged_in_user
  before_action :seller?, only: [:show]
  before_action :buyer?, only: [:show]

  def show
    @dealing = Dealing.find(params[:id])
    @item = @dealing.item
  end

  def create
    @item = Item.find(params[:item_id])
    @dealing = @item.build_dealing(
        buyer: current_user,
        seller: @item.user
    )
    if @dealing.save
      flash[:success] = "商品を購入しました"
      redirect_to dealing_path(@dealing)
    else
      flash[:danger] = "商品を購入できませんでした"
      render 'new'
    end
  end

  def new
    @item = Item.find(params[:item_id])
    @dealing = @item.build_dealing
    @dealing.buyer_id = current_user.id
    @dealing.seller_id = @item.user.id
  end

  def update_to_delivering
    @dealing = Dealing.find(params[:id])
    @dealing.delivering!
    redirect_to dealing_path
  end

  def update_to_completed
    @dealing = Dealing.find(params[:id])
    @dealing.completed!
    redirect_to dealing_path
  end

  private

  def seller?
    dealing = Dealing.find(params[:id])
    current_user == dealing.seller
  end

  def buyer?
    dealing = Dealing.find(params[:id])
    current_user == dealing.buyer
  end

  helper_method :seller?
  helper_method :buyer?
end
