class ContributionsController < ApplicationController
  respond_to :html, :js

  def create
    @cart = find_cart
    @cart.convert(current_user) if current_user
  end

end