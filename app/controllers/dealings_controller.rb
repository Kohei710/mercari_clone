class DealingsController < ApplicationController
  before_action :logged_in_user
  before_action :seller?, only:[:show]
  before_action :buyer?, only:[:show]

  def show
    @dealing = Dealing.find(params[:id])
    @item = @dealing.item
  end

  def create
    item = Item.find(params[:item_id])
    @dealing = item.build_dealing
    @dealing.user = current_user
    @dealing.save

    redirect_to dealing_path(@dealing)
  end

  def new
    @item = Item.find(params[:item_id])
    @dealing = @item.build_dealing
    @dealing.user = current_user
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
    current_user == dealing.item.user
  end

  def buyer?
    dealing = Dealing.find(params[:id])
    current_user == dealing.user
  end

  helper_method :seller?
  helper_method :buyer?
end
