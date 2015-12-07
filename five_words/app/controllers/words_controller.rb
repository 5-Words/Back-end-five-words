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
		@words= current_user.words
		render "word_create.json.jbuilder"
	end

	def creates
		@words = params[:words]
		@words.map do |word|
			begin
				current_user.words.create!(word: word,
					                         category: params[:category])
			rescue ActiveRecord::SaveFailure
				render json: { message: "Couldn't save supplied words." }, status: :unproccessable_entity
			end
    end
    @words= current_user.words
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

	def user_words
		word_hash = Word.where(category: params[:category])
		@matches = word_hash.each do |match|
			 Word.where(match[:word], category: params[:category])
		end
		#binding.pry

			render "matches.json.jbuilder"
	end

	def edit
		params[:words].each do |new_word|
			word = Word.find(new_word[:id])
			word.update(word: new_word[:new])
		end
		render "word_create.json.jbuilder"
	end
	


end
