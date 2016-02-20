class CreatePaths < ActiveRecord::Migration
  def change
    create_table :paths do |t|
      t.belongs_to :line, index: {:unique=>true}, foreign_key: true
      t.text :data

      t.timestamps null: false
    end
  end
end
