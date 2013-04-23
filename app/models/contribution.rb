class Contribution
  include Mongoid::Document
  include Mongoid::Timestamps

  validates :user, presence: true

  belongs_to :gift
  belongs_to :user
  has_many :items


end
