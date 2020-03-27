class LikesController < ApplicationController
  before_action :logged_in_user, only: [:create]

  def create
    micropost = Micropost.find(params[:like][:micropost_id])
    like = micropost.likes.build(like_params)
    like.user = current_user


    redirect_back(fallback_location: micropost_path(micropost))
  end

  def destroy
  end

  private

  def like_params
    params.require(:like).permit(:content)
  end
end
