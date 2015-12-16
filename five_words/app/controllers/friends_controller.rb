class FriendsController < ApplicationController
		
	def add
		friend = current_user.friends.new(username: params[:username])
		if friend.save
			render json: {message: "Friend added"}, status: :ok
		end
	end

	def destroy
		friend = Friend.find_by(username: params[:username])
		if current_user.id == friend.user_id
			friend.destroy
				render json: {message: "Friend deleted"}, status: :ok
			else
				render json: {message: "You cannot delete this friend"}, status: :unauthorized
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
			render "friend_profile.json.jbuilder"
		end
	end	

	def friend_gallery
		user = User.find_by(username: params[:username])
		@images = user.images
		render "friend_gallery.json.jbuilder"
	end
	#def friend_gallery
	#	friend = Friend.where(username: params[:username])
	#	if current_user.id == friend[0]["user_id"]
	#		profile = User.find_by(username: params[:username])
	#		@images = Image.where(user_id: profile.id)
	#		render "friend_gallery.json.jbuilder"
	#	end
	#end


end






