class LikesController < ApplicationController
  before_action :logged_in_user

  def create
    micropost = Micropost.find(params[:micropost_id])
    like = micropost.likes.build
    like.user = current_user
    like.save
    # respond_to do |format|
    #   format.html { redirect_to request.referrer || root_url }
    #   format.js
    # end

    redirect_back(fallback_location: micropost_path(micropost))
  end

  def destroy
    micropost = Like.find(params[:id]).micropost
    micropost.likes.find_by(micropost_id: micropost.id).destroy
    # respond_to do |format|
    #   format.html { redirect_to request.referrer || root_url }
    #   format.js
    # end

    redirect_back(fallback_location: micropost_path(micropost))
  end
end
