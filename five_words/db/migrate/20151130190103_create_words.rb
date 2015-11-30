class CreateWords < ActiveRecord::Migration
  def change
    create_table :words do |t|
    	t.string :word
    	t.string :category
    	t.integer :user_id
      t.timestamps null: false
    end
  end
end
