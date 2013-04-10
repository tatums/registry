json.array!(@offerings) do |offering|
  json.extract! offering, :title, :description, :amount
  json.url offering_url(offering, format: :json)
end