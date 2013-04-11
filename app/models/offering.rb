# class Offering < ActiveRecord::Base
#   has_many :contributions

#   validates :portions, :amount, :title, presence: true

#   after_create :setup_contributions

#   def portion_size
#     amount / portions
#   end

#   def portion_size
#     amount / portions
#   end

# private

#   def setup_contributions
#     portions.times do
#       contributions.create(amount: portion_size)
#     end
#   end

# end
