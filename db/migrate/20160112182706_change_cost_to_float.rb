class ChangeCostToFloat < ActiveRecord::Migration
  def change
  	remove_column :posts, :cost
  	add_column :posts, :cost, :float
  end
end
