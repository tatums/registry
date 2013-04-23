class CheckoutsController < ApplicationController
  respond_to :html

  def show
    @cart = find_cart
    redirect_to gifts_path if @cart.items.empty?
  end

end