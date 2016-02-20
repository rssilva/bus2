class CreateAlerts < ActiveRecord::Migration
  def change
    create_table :alerts do |t|
      t.belongs_to :user, index: true, foreign_key: true, null: false
      t.belongs_to :line, index: true, foreign_key: true, null: false
      t.string :position, null: false
      t.integer :range, null: false
      t.boolean :active, null: false

      t.timestamps null: false
    end
  end
end
