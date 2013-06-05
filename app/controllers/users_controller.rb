class UsersController < ApplicationController
  respond_to :html
  before_action :require_user, except: [:new, :create]


  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    flash[:notice] = 'User was successfully created.' if @user.save
    respond_with(@user, location: root_path)
  end


  private
    def user_params
      params.require(:user).permit(:first, :last, :email, :password, :password_confirmation)
    end
end
