class TransactionsController < ApplicationController
  before_action :logged_in_user

  def create
    item = Item.find(params[:item_id])
    transaction = item.transactions.build
    transaction.user = current_user
    transaction.save

    redirect_to root_url
  end
end
