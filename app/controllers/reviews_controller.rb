class ReviewsController < ApplicationController
  before_action :logged_in_user

  def create
    @user = User.find(params[:reviewed_id])
    current_user.follow(@user)
  end

  def destroy
    @user = Relationship.find(params[:id]).followed
    current_user.unfollow(@user)

  end
end