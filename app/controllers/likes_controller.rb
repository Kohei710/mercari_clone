class LikesController < ApplicationController
  before_action :logged_in_user, only: [:create]

  def create
    micropost = Micropost.find(params[:micropost_id])
    like = micropost.likes.build
    like.user = current_user
    like.save


    redirect_back(fallback_location: micropost_path(micropost))
  end

  def destroy
    micropost = Micropost.find(params[:micropost_id])
    like = micropost.likes
    like.destroy
  end

end
