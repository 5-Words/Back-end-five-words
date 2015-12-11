class AddColumnsToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :birthday, :string
  	add_column :users, :phone_number, :string
  	add_column :users, :gender, :string
  	add_column :users, :location, :string
  end
end
