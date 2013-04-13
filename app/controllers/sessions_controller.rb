class SessionsController < ApplicationController

  def new
  end

  def create
    if user = User.where(email: params[:email]).first
      session[:user_id] = user.id
      redirect_to root_url
    else
      flash.now[:alert] = "Invalid email or password"
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path
  end

end
