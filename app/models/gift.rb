class Gift
  include Mongoid::Document
  #include Mongoid::MultiParameterAttributes

  field :title
  field :description
  field :amount, type: BigDecimal

end