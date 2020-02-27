class CreateLocations < ActiveRecord::Migration[5.2]
  def change
    create_table :locations do |t|
      t.string :province
      t.string :county
      t.string :village
    end 
  end
end
