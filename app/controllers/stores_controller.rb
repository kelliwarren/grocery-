class StoresController < ApplicationController
  # before_action :ensure_user_and_store_owner!, except: [:show, :index]

  def index
    # @user = User.find(params[:id])
    @stores = Store.all
  end

  def new
    # @user = User.find(params[:id])
    # @store = @user.stores.build
  end

  def create
    @user = User.find(params[:user_id])
    @store = @user.stores.build(store_params)
    if @user.store_owner == true
      @store.save
      redirect_to user_path(@user)
    else
      redirect_to user_path(@user)
    end
  end

  def show
    # @user = User.find(params[:id])
    # @store = @user.stores.find(params[:id])
  end

  def edit
    # @user = User.find(params[:id])
    # @store = @user.stores.find(params[:id])
  end

  def update
    puts params
    @user = User.find(params[:user_id])
    @store = @user.stores.find(params[:id])
    if @user.store_owner
      puts 'yes'
      @store.update_attributes(store_params)
      redirect_to users_path
    else
      puts 'no'
      redirect_to users_path
    end
  end


  def destroy
    # @user = User.find(params[:id])
    # @store = @user.stores.find(params[:id])
    # @store.destroy
    # redirect_to user_stores_path
  end

  private

  # def ensure_user_and_store_owner!
  #   current_user.signed_in? && current_user.store_owner?
  # end

  def store_params
    params.require(:store).permit(:name, :street_address, :city, :state, :zip, :user_id)
  end


end
