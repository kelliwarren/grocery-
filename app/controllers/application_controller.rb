class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :cart
  before_filter :configure_permitted_parameters, if: :devise_controller?

  def cart
    session[:product] ||= []
  end

  def add_to_cart
    @product = Product.find(params[:id])
    session[:product] << @product.id
    redirect_to store_path(@product.store)
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :name
    devise_parameter_sanitizer.for(:sign_up) << :phone
  end
end
