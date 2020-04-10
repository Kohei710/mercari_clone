class CommentsController < ApplicationController
  before_action :logged_in_user, only: [:create]

  def create
    item = Item.find(params[:comment][:item_id])
    comment = item.comments.build(comment_params)
    comment.user = current_user

    if comment.save
      flash[:success] = "Comment created!"
    end

    redirect_back(fallback_location: item_path(item))
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
