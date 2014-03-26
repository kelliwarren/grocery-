class ProductsController < ApplicationController
  before_action :store_owner?, except: [:index, :show]

  def index
    redirect_to users_path
  end
  def show
  end
  def new
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
  def product_params
    params.require(:product).permit(:name, :description, :price, :quantity, :image)
  end
  def store_owner?
    @user = User.find(params[:user_id])
    true if @user.store_owner
    false
  end
end
