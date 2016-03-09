class CreateBoats < ActiveRecord::Migration
  def change
    create_table :boats do |t|
      t.references :user, index: true, foreign_key: true
      t.string :name
      t.integer :ctn_amt
      t.string :cur_loc

      t.timestamps null: false
    end
  end
end
