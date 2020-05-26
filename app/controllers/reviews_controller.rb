class ReviewsController < ApplicationController

  def create
    @dealing = Dealing.find(params[:dealing_id])
    @item = @dealing.item
    review = @dealing.reviews.build(evaluation: params[:evaluation].to_i)
    review.reviewer_id = current_user.id
    if @dealing.seller.id == review.reviewer_id
      review.reviewed_id = @dealing.buyer.id
    elsif @dealing.buyer.id == review.reviewer_id
      review.reviewed_id = @dealing.seller.id
    end
    if review.save
      redirect_to root_path
      flash[:info] = "レビューを送信しました。"
    end
  end
end
