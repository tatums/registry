class GiftsController < ApplicationController
  respond_to :html
  before_action :require_user

  def index
    @gifts = Gift.all.to_a
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
  end

  private
    def gift_params
      params.require(:gift).permit(:title, :description, :amount, :portions, :image)
    end

end
