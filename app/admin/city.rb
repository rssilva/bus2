ActiveAdmin.register City do

  index do
    selectable_column
    id_column
    column :name
    column "state" do |row|
      row.state.name
    end
    column "Country" do |row|
      row.state.country.name
    end
    actions
  end

  permit_params do
    permitted = [:name, :state_id]
    permitted
  end


end
