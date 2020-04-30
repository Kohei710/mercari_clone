module DealingsHelper
  def seller?
    dealing = Dealing.find(params[:id])
    current_user == dealing.seller
  end

  def buyer?
    dealing = Dealing.find(params[:id])
    current_user == dealing.buyer
  end
end
