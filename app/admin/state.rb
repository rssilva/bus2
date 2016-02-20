ActiveAdmin.register State do

  index do
    selectable_column
    id_column
    column :name
    column "Country" do |row|
      row.country.name
    end
    actions
  end

  permit_params do
    permitted = [:name, :uf, :country_id]
    permitted
  end

end
