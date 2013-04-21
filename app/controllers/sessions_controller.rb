class SessionsController < ApplicationController

  def new
  end

  def create
    if user = find_user(request.env["omniauth.auth"])
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

private

  def find_user(auth)
    if auth
      User.find_by(provider: auth["provider"], uid: auth["uid"]) || User.create_with_omniauth(auth)
    else
      User.find_by(email: params[:email])
    end
  end

end
