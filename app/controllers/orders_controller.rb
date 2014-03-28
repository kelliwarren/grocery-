class OrdersController < ApplicationController
  before_action :set_consumer
  before_action :set_store
  def index
  end
  def show
  end
  def new
    @store = nil
    @consumer = nil
    @order = nil
    if
      #logged in
    else
      #send them to users/new then after making a user send them back to orders/new
    end
  end
  def create
  end
  def edit
  end
  def update
  end
  def destroy
  end
  private
  def order_params
    params.require(:order).permit(:store_id, :user_id)
  end
  def set_consumer
    @consumer = User.find(params[:user_id])
  end
  def set_store
    @store = Store.find(params[:store_id])
  end
  def correct_consumer
  end
end

