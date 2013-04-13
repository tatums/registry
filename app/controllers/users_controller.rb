class UsersController < ApplicationController
  respond_to :html
  before_action :require_user, except: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    flash[:notice] = 'User was successfully created.' if @user.save
    respond_with(@user)
  end

  def show
    @user = User.find(params[:id])
    respond_with(@user)
  end

  private
    def user_params
      params.require(:user).permit(:first, :last, :email)
    end
end
