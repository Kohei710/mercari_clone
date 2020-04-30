module DealingsHelper
  def seller?
    dealing = Dealing.find(params[:id])
    redirect_to root_url unless current_user == dealing.seller || current_user == dealing.buyer
  end

  def buyer?
    dealing = Dealing.find(params[:id])
    redirect_to root_url unless current_user == dealing.seller || current_user == dealing.buyer
  end
end
