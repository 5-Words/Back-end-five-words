class Word < ActiveRecord::Base
	has_many :users, through: :user_words
	has_many :user_words
end

