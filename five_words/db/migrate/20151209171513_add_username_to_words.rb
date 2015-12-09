class AddUsernameToWords < ActiveRecord::Migration
  def change
  	add_column :words, :username, :string
  end
end
