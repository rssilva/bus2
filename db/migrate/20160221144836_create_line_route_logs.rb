class CreateLineRouteLogs < ActiveRecord::Migration
  def change
    create_table :line_route_logs do |t|
      t.string :location
      t.references :user, index: true, foreign_key: true
      t.references :line, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
