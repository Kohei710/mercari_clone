class LikesController < ApplicationController
  before_action :logged_in_user

  def create
    item = Item.find(params[:item_id])
    like = item.likes.build
    like.user = current_user
    like.save
    # respond_to do |format|
    #   format.html { redirect_to request.referrer || root_url }
    #   format.js
    # end

    redirect_back(fallback_location: item_path(item))
  end

  def destroy
    item = Like.find(params[:id]).item
    item.likes.find_by(item_id: item.id).destroy
    # respond_to do |format|
    #   format.html { redirect_to request.referrer || root_url }
    #   format.js
    # end

    redirect_back(fallback_location: item_path(item))
  end
end
