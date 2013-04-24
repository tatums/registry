class ItemsController < ApplicationController


  def create
    @cart = find_cart
    params[:item][:gifts].reject {|k,v| v['quantity'] == ''}.each do |param|
      gift = Gift.find(param[0])
      quantity = param[1][:quantity]
      @cart.add_item(gift: gift, quantity: quantity)
    end
    redirect_to new_contribution_path
  end

  def destroy
    @item = find_item
    @item.destroy
    flash[:notice] = 'Item was removed.'
    redirect_to new_contribution_path
  end


  private

  def find_item
    Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:quantity, :gift)
  end

end