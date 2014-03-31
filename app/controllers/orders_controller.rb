class OrdersController < ApplicationController
  # before_action :set_consumer, except:[:index, :show]
  # before_action :set_store, except:[:index, :show]
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
  end
  def create
    @order = Order.new(order_params)
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
  def set_order
    @order = Order.find(params[:id])
  end
  def correct_consumer
    @order = Order.find(params[:id])
    @consumer = User.find(params[:user_id])
    if @order.user == @consumer
      return true
    else
      return false
    end
  end
end

