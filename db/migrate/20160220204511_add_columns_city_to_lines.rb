class AddColumnsCityToLines < ActiveRecord::Migration
  def change
    add_reference :lines, :city, index: true, foreign_key: true
  end
end
