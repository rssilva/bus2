json.array!(@lines) do |line|
  json.extract! line, :id, :name
  json.url line_url(line, format: :json)
end
