class Item
  include Mongoid::Document
  include Mongoid::Timestamps

  field :quantity, type: Integer



  belongs_to :gift
  belongs_to :cart
  belongs_to :contribution

  scope :sold, where(cart_id: nil)

  def sub_total
    quantity * self.gift.portion_size
  end




end