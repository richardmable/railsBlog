class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :fname
      t.string :lname
      t.string :location
      t.integer :age
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
