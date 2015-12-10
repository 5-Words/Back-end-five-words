class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
    	t.attachment :image, null: false
    	t.string :title

      t.timestamps null: false
    end
  end
end
