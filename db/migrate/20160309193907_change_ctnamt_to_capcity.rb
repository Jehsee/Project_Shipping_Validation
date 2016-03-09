class ChangeCtnamtToCapcity < ActiveRecord::Migration
  def change
    rename_column :boats, :ctn_amt, :capacity
  end
end
