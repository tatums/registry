class ContributionsController < ApplicationController
  respond_to :html

  before_action :require_user


  def new
    @cart = find_cart
    @contribution = Contribution.new
    if @cart.items.empty?
      flash[:alert] = 'You need to choose a quantity within the table.'
      redirect_to gifts_path
    end
  end

  def create
    @cart = find_cart
    if current_user
      @cart.convert(current_user)
      flash[:notice] = 'Successfull'
    end
    redirect_to thank_you_path
  end

  def thank_you

  end

end