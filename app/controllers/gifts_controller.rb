class GiftsController < ApplicationController
  def index
    @gifts = Gift.all.to_a
  end

  def show
  end

  def edit
  end

  def new
  end
end
