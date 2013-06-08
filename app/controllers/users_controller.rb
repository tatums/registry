class UsersController < ApplicationController

  before_action :require_user, except: [:new, :create]


  def new
    @user = User.new
  end

  def create
    @user = User.find_or_initialize_by(user_params)
    respond_to do |format|
      format.js {}
    end
  end


  private
    def user_params
      params.require(:user).permit(:first, :last, :email)
    end
end
