class StoresController < ApplicationController
  before_action :ensure_user_and_store_owner!, except: [:show, :index]

  def index
    @user = User.find(params[:id])
    @stores = @user.stores
  end

  def new
    @user = User.find(params[:id])
    @store = @user.stores.build
  end

  def create
    @user = User.find(params[:id])
    @store = @user.stores.create(store_params)
    if @store.save
      redirect_to user_store_path(@store)
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
    @store = @user.stores.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
    @store = @user.stores.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @store = @user.stores.find(params[:id])
    if @store.update_attributes(store_params)
      redirect_to user_store_path(@user)
    else
      render :edit
    end
  end

 
  def destroy
    @user = User.find(params[:id])
    @store = @user.stores.find(params[:id])
    @store.destroy
    redirect_to user_stores_path
  end

private

  def ensure_user_and_store_owner
    current_user.signed_in? && current_user.store_owner?
  end

  def store_params
    params.require(:store).permit(:name, :street_address, :city, :state, :zip, :user)
  end

 
end
