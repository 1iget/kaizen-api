class AddDefaultValueToIsadminFieldInUsers < ActiveRecord::Migration[5.1]
  def change
    change_column :users, :isadmin, :boolean, :default => false
  end
end
