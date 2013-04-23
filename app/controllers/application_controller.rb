class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user, :find_cart

  def require_user
    redirect_to login_path unless current_user
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def find_cart
    Cart.find(cart_id)
  end

private
  def cart_id
    session[:cart_id] ||= Cart.create!.id
  end

end
