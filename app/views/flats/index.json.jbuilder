json.array!(@flats) do |flat|
  json.extract! flat, :id, :title, :address, :description, :user_id
  json.url flat_url(flat, format: :json)
end
