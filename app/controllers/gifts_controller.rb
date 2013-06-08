class GiftsController < ApplicationController
  respond_to :html

  before_action :store_location, only: [:index]

  def index
    @cart = find_cart
    @gifts = Gift.all.to_a
    @user = User.new
  end

  def new
    @gift = Gift.new
  end

  def create
    @gift = Gift.new(gift_params)
    flash[:notice] = 'Gift was successfully created.' if @gift.save
    respond_with(@gift)
  end

  def show
    @gift = Gift.find(params[:id])
  end

  def edit
    @gift = Gift.find(params[:id])
  end

  def update
    @gift = Gift.find(params[:id])
    flash[:notice] = 'Gift was successfully updated.' if @gift.update_attributes(gift_params)
    respond_with(@gift)
  end

  private
    def gift_params
      params.require(:gift).permit(:title, :description, :amount, :portions, :image)
    end

end
