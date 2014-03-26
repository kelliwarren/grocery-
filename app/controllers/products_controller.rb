class ProductsController < ApplicationController
  before_action :store_owner?, except: [:index, :show]
  before_action :set_user_id
  before_action :set_store_id

  def index
    @products = @store.products
    redirect_to user_store_products(@user, @store)
  end
  def show
    @product = @store.products.find(params[:id])
    redirect_to user_store_product(@user, @store, @product)
  end
  def new
    @products = Product.new
    redirect_to  new_user_store_product(@user, @store)
  end
  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to user_store_product(@user, @store, @product)
    else
      render :new
    end
  end
  def edit
    @products = Product.find(params[:id])
  end
  def update
    @product = Product.find(params[:id])
    if @product.update_attributes(product_params)
      redirect_to user_store_products(@user, @store)
    else
      render :edit
    end
  end
  def destroy
    @product = Product.find(params[:id])
    @product.delete
    redirect_to user_store_products(@user, @store)
  end

  private

  def set_user_id
    @user = User.find(params[:user_id])
  end
  def set_store_id
    @store = Store.find(params[:store_id])
  end

  def product_params
    params.require(:product).permit(:name, :description, :price, :quantity, :image)
  end

  def store_owner?
    @user = User.find(params[:user_id])
    true if @user.store_owner
    false
  end

end
