class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user, :find_cart, :store_location

  before_action :new_user

  def require_user
    unless current_user
      store_location
      redirect_to login_path
    end
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def find_cart
    Cart.find(cart_id)
  end

private

  def new_user
    @user = User.new
  end

  def cart_id
    session[:cart_id] ||= Cart.create!.id
  end

  def store_location
    session[:return_back_to] = request.env['REQUEST_URI']
  end

  def redirect_back(message='success')
    flash[:notice] = message
    redirect_to(session[:return_back_to] || root_path)
    session[:return_back_to] = nil
  end

end
