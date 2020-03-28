class LikesController < ApplicationController
  before_action :logged_in_user, only: [:create]

  def create
    micropost = Micropost.find(params[:post_id])
    like = micropost.likes.build
    like.user = current_user
    like.save


    redirect_back(fallback_location: micropost_path(micropost))
  end

  def destroy
  end

end
