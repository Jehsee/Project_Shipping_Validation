class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.references :user, index: true, foreign_key: true
      t.string :fname
      t.string :lname
      t.string :username

      t.timestamps null: false
    end
  end
end
