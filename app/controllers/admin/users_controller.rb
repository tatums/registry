class Admin::UsersController < ApplicationController
  respond_to :html
  #before_action :require_user, except: [:new, :create]

  def index
    @users = User.all
  end
end