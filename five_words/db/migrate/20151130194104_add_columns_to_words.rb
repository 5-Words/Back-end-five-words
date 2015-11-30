class AddColumnsToWords < ActiveRecord::Migration
  def change
  	add_column :words, :word_2, :string
  	add_column :words, :word_3, :string
  	add_column :words, :word_4, :string
  	add_column :words, :word_5, :string
  end
end
