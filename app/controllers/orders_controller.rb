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
    @order = Order.new()
  end
  def create
    @order = Order.new(order_params)
  end
  def edit
    if correct_permissions?
      @order.delete
      redirect_to user_path(@consumer)
    else
      redirect_to user_path(@consumer)
    end
  end
  def update
    @order = Order.find(params[:id])
    if order.update_attributes()
    else
      render :edit
    end
  end
  def destroy
    set_order
    store = @order.store
    if @order.delete
      session[:order_id] = nil
      redirect_to store_path(store)
    else
      redirect_to store_path(store)
    end
  end

  def checkout
    @store = Store.find(params[:store_id])
    @order = Order.find(session[:order_id])
    if current_user
      session[:order_id] = nil
    else
      redirect_to new_user_registration_path(consumer: true)
    end
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
  # def correct_permissions?
  #   puts params
  #   @order = Order.find(params[:id])
  #   if params[:store_id] == nil
  #     @consumer = User.find(params[:user_id])
  #     if @order.user == @consumer
  #       return @order
  #     else
  #       return false
  #     end
  #   elsif params[:user_id] == nil
  #     @store = Store.find(params[:store_id])
  #     if @order.user == @store
  #       return @order
  #     else
  #       return false
  #     end
  #   end
  # end
end

