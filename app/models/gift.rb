class Gift
  include Mongoid::Document
  include Mongoid::Timestamps

  has_many :contributions
  has_many :items

  mount_uploader :image, ImageUploader

  field :title
  field :description
  field :amount, type: BigDecimal
  field :portions, type: Integer

  attr_accessor :quantity

  def portion_size
    amount / portions
  end

  def remaining_portions
    portions - Item.sold.select { |i|
          i.gift == self }.map(&:quantity).sum
  end

  def select_helper
    ( 1..remaining_portions ).to_a.map { |i| [ i, i ] }
  end

end