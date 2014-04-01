class CheckoutController < ApplicationController

  def index
    @products = Product.where(:id => session[:product])
  end
#create action we want to a before create authentiate user so they log in before checkout process
end