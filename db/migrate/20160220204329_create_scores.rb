class CreateScores < ActiveRecord::Migration
  def change
    create_table :scores do |t|
      t.belongs_to :user, index: {:unique=>true}, foreign_key: true
      t.integer :hits
      t.datetime :last_hit

      t.timestamps null: false
    end
  end
end
