collection @cities
attributes :id, :name
child :state do
  attributes :name
  child :country do
    attributes :name
  end
end