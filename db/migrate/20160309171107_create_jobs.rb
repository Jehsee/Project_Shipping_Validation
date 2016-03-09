class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.references :boat, index: true, foreign_key: true
      t.integer :ctn_need
      t.text :cargo
      t.string :origin
      t.decimal :cost
      t.string :destination

      t.timestamps null: false
    end
  end
end
