class CreateSurveys < ActiveRecord::Migration[5.2]
  def change
    create_table :surveys do |t|
      t.string :name 
      t.string  :gender
      t.integer :age 
      t.string :first_language
      t.string :second_language
      t.integer :location_id 
      t.integer :user_id 
    end 
  end
end
