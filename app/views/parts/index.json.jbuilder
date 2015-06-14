json.array!(@parts) do |part|
  json.extract! part, :id, :file, :sha1
  json.url part_url(part, format: :json)
end
