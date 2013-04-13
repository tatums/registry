class User
  include Mongoid::Document

  field :first
  field :last
  field :email

  def full_name
    "#{first} #{last}"
  end

end