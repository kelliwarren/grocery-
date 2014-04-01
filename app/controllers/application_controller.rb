class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :configure_permitted_parameters, if: :devise_controller?

  protected

  def current_order
    if current_user
      if current_user.store_owner
        return true
      end
    else
      if session[:order_id]
        Order.find(session[:order_id])
      else
        store = Store.find(params[:id])
        order = store.orders.create
        session[:order_id] = order.id
        order
      end
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) {|u| u.permit(:name, :email,:password, :password_confirmation,:phone, :store_owner)}
  end

  def after_sign_in_path_for(resource)
    user_stores_path(resource)
  end

end
