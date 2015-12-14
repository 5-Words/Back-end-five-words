class FriendsController < ApplicationController
	def add
		friend = current_user.friends.new(username: params[:username])
		binding.pry
		if friend.save
			render json: {message: "Friend added"}, status: :ok
		end
	end

	def index
		@friends = current_user.friends
		render "friends.json.jbuilder"
	end

	def friend_profile
		@profile = User.find_by(username: params[:username])
		render "friend_profile.json.jbuilder"
	end	
end
