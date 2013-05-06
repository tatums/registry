class Cart
  include Mongoid::Document
  include Mongoid::Timestamps

  has_many :items

  def add_item(args)
    if item = items.detect { |i| i.gift == args[:gift] }
      item.update_attributes(quantity: args[:quantity])
    else
      items.create(gift: args[:gift], quantity: args[:quantity])
    end
  end

  def remove(gift)
    if item = items.detect { |i| i.gift == gift }
      item.destroy
    end
  end


  def convert(user)
    contribution = Contribution.create(user: user)
    items.each do |item|
      item.update_attributes(cart: nil, contribution: contribution)
    end
    return contribution
  end

end