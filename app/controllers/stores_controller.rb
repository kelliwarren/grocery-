class StoresController < ApplicationController
  before_action :ensure_user_a_store_owner!, except: [:show]

  def index
    @user = User.find(params[:user_id])
    @stores = @user.stores  
  end

  def new
    # @user = User.find(params[:user_id])
    @store = @user.stores.build
  end

  def create
    # @user = User.find(params[:user_id])
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
    # @user = User.find(params[:user_id])
    @store = @user.stores.find(params[:id])
  end

  def update

    # @user = User.find(params[:user_id])
    @store = @user.stores.find(params[:id])
    if @store.update_attributes(store_params)
      redirect_to users_path
    else
      render :edit
    end
  end

  def destroy

    @store = Store.find(params[:id])
    # @user = User.find(@store.user_id)
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
  end

  def store_params
    params.require(:store).permit(:name, :street_address, :city, :state, :zip, :user_id)
  end


end
