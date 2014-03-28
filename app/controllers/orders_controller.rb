class OrdersController < ApplicationController
  before_action :set_consumer, execpt:[:index]
  before_action :set_store, execpt:[:index]
  def index
    if params[:user_id] == nil
      @store = Store.find(params[:store_id])
      @orders = @store.orders
    elsif params[:store_id] == nil
      @consumer = User.find(params[:user_id])
      @orders = @consumer.orders
    end
  end
  def show
    @order = Order.find(params[:id])
  end
  def new
    # @store = nil
    # @consumer = nil
    # @order = nil
    # if
    #   #logged in
    # else
    #   #send them to users/new then after making a user send them back to orders/new
    # end
  end
  def create
    @order = Order.new(order_params)
    # if
    # else
    # end
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

