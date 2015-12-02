class Word < ActiveRecord::Base
	has_many :users, through: :user_words
	has_many :user_words

	validates :word, presence: true
	validates :category, inclusion: { in: %w(travel golden tech sports
																					 foodie cars books music film
																					 pets),
    message: "%{value} is not a valid category" }
end

