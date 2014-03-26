class StoresController < ApplicationController
  before_action :ensure_user_a_store_owner!, except: [:show]

  def index
    @user = User.find(params[:user_id])
    @stores = @user.stores  
  end

  def new
    @store = @user.stores.build
  end

  def create
    @store = @user.stores.build(store_params)
    if @store.save
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:user_id])
    @store = @user.stores.find(params[:id])
  end

  def edit
    @store = @user.stores.find(params[:id])
  end

  def update
    @store = @user.stores.find(params[:id])
    if @store.update_attributes(store_params)
      redirect_to users_path
    else
      render :edit
    end
  end

  def destroy
    @store = Store.find(params[:id])
    @store.destroy
    redirect_to users_path
  end


  private

  def ensure_user_a_store_owner!
  @user = User.find(params[:user_id])
   unless @user.store_owner?
      flash[:alert] = "you are not a store owner"
      redirect_to edit_user_registration_path(@user)
    end
     @user = User.find(params[:user_id])
  end

  def store_params
    params.require(:store).permit(:name, :street_address, :city, :state, :zip, :user_id)
  end


end
