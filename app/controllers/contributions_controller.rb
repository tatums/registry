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
      contribution = @cart.convert(current_user)
      flash[:notice] = 'Successfull'
    end
    redirect_to thank_you_contribution_path(contribution)
  end

  def thank_you
    @contribution = Contribution.find(params[:id])
  end

  def update
    @contribution = Contribution.find(params[:id])
    @contribution.update_attributes(contribution_params)
    UserMailer.personal_message(current_user, @contribution).deliver
    flash[:notice] = 'Your message has been sent.'
    redirect_to root_path
  end

private

  def contribution_params
    params.require(:contribution).permit!
  end

end