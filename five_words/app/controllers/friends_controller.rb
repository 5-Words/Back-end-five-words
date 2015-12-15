class FriendsController < ApplicationController
	def add
		friend = current_user.friends.new(username: params[:username])
		
		if friend.save
			render json: {message: "Friend added"}, status: :ok
		end
	end

	def index
		@friends = current_user.friends
		render "friends.json.jbuilder"
	end

	def friend_profile
		friend = Friend.where(username: params[:username])
		if current_user.id == friend[0]["user_id"]
			@profile = User.find_by(username: params[:username])
			@images = Image.where(user_id: @profile.user_id)
			render "friend_profile.json.jbuilder"
		end
	end	
end
