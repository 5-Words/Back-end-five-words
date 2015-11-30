class WordsController < ApplicationController

	def create
		
		@word = current_user.words.new(word: params[:word],
																	 category: params[:category])
		if @word.save
				render "word_create.json.jbuilder"
			else
				render json: {errors: @word.errors.full_message },
				status: :unprocessable_entity
			end

	end


end
