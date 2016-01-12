class AddCostToPosts < ActiveRecord::Migration
  def change
  	add_column :posts, :cost, :integer
  end
end
