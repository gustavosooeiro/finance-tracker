class StocksController < ApplicationController
  def search
    if params[:stock].present? #params[:stock].size > 0
      @stock = Stock.new_from_lookup(params[:stock])
      #render json:@stock
      if @stock
        render 'users/my_portfolio'
      else
        flash[:danger] = "You have entered an incorrect string"
        redirect_to my_portfolio_path
      end
    else
      flash[:danger] = "You have entered an empty search string"
      redirect_to my_portfolio_path
    end
  end
end
