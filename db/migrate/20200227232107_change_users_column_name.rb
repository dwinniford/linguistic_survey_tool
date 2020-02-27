class ChangeUsersColumnName < ActiveRecord::Migration[5.2]
  def change
    change_table :users do |t|
      t.rename :user_name, :name
    end 
  end
end
