json.array!(@deposits) do |deposit|
  json.extract! deposit, :id, :title, :metadata, :user_id
  json.url deposit_url(deposit, format: :json)
end
