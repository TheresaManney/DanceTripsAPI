class FixTravelerTable < ActiveRecord::Migration[5.0]
  def change
    remove_column :travelers, :name

    add_column :travelers, :first_name, :string
    add_column :travelers, :last_name, :string
    add_column :travelers, :password_digest, :string    
  end
end
