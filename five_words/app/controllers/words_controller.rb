class WordsController < ApplicationController

	def create_1
		
		current_user.words.create(word: params[:one], 
														  category: params[:category])
		current_user.words.create(word: params[:two],
															category: params[:category])
		current_user.words.create(word: params[:three],
															category: params[:category])
		current_user.words.create(word: params[:four],
															category: params[:category])
		current_user.words.create(word: params[:five],
															category: params[:category])

		@words = 	Word.where(category: params[:category])
		render "word_create.json.jbuilder"
	
	end


end
