class Gift
  include Mongoid::Document
  include Mongoid::Timestamps
  has_many :contributions

  mount_uploader :image, ImageUploader

  field :title
  field :description
  field :amount, type: BigDecimal
  field :portions, type: Integer


  def portion_size
    amount / portions
  end

end