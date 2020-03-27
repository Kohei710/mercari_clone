class CommentsController < ApplicationController
  before_action :logged_in_user, only: [:create]

  def create
    micropost = Micropost.find(params[:comment][:micropost_id])
    comment = micropost.comments.build(comment_params)
    comment.user = current_user

    if comment.save
      flash[:success] = "Comment created!"
    end

    redirect_back(fallback_location: micropost_path(micropost))
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
