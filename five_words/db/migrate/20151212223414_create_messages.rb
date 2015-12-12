class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
    	t.string :subject
    	t.string :content, null: false
    	t.string :friends
    	t.integer :user_id
    	t.string :username
      t.timestamps null: false
    end
  end
end
