class Contribution
  include Mongoid::Document
  include Mongoid::Timestamps

  validates :user, presence: true

  belongs_to :gift
  belongs_to :user
  has_many :items

  field :notes


  def attr_for_user(arg)
    if user
      user.send(arg)
    else
      'unknown'
    end
  end

end
