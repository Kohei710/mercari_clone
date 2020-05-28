class DealingsController < ApplicationController
  include DealingsHelper

  before_action :logged_in_user
  before_action :correct_seller_or_buyer, only: [:show]

  def show
    @dealing = Dealing.find(params[:id])
    @item = @dealing.item
  end

  def create
    @item = Item.find(params[:item_id])
    redirect_to root_path if current_user == @item.user

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

    def correct_seller_or_buyer
      dealing = Dealing.find(params[:id])
      redirect_to root_url unless dealing.accessible_user?(current_user)
    end


end
