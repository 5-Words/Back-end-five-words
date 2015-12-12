class FriendsController < ApplicationController
	def add
		@friend = Friend.new(username: params[:username])
		if @freind.save
			render json: {message: "Friend added"}, status: :ok
		end
	end
end
