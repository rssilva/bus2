ActiveAdmin.register Country do

  index do
    selectable_column
    id_column
    column :name
    actions
  end

  permit_params do
    permitted = [:name]
    permitted
  end


end
