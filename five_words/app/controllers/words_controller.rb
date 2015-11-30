class WordsController < ApplicationController

	def create
		
		@word = current_user.words.new(word: params[:one], word_2: params[:two],
																	 word_3: params[:three], word_4: params[:four],
																	 word_5: params[:five], category: params[:category])
		if @word.save
				render "word_create.json.jbuilder"
			else
				render json: {errors: @word.errors.full_message },
				status: :unprocessable_entity
			end

	end


end
