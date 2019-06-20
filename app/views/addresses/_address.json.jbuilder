json.extract! address, :id, :street_and_number, :city, :state, :zipcode, :created_at, :updated_at
json.url address_url(address, format: :json)
