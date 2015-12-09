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
					                         category: params[:category],
					                         username: current_user.username)
				#binding.pry
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

	def user_category
		@words = current_user.words.where(category: params[:category])
		render "word_create.json.jbuilder"
		#binding.pry
	end

	def user_words
		words = current_user.words.where(category: params[:category])
		
		@matches = Word.where(
													word: [words[0]["word"], words[1]["word"],
																 words[2]["word"], words[3]["word"],
																 words[4]["word"]]).where.not(user_id: current_user.id).where(category: params[:category])
	  # ver 1: get the user for each match
		# ver 2: group/order them by user
		# we might consider eager loading associations
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
