class WordsController < ApplicationController

	def create
		
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

	def search_category
		@words = 	Word.where(category: params[:category])
		render "word_create.json.jbuilder"
	end


	def match
		@words = Word.where(word: params[:word], 
												category: params[:category])
				render "word_create.json.jbuilder"
	end



end
