json.array!(@paths) do |path|
  json.extract! path, :id, :line_id, :data
  json.url path_url(path, format: :json)
end
