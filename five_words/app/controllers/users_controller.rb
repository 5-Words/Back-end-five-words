class UsersController < ApplicationController

	def user_profile
		@user = User.find_by(username: params[:username])
		render "public_profile.json.jbuilder"
	end

	def private_profile
		@user = current_user
		render "private_profile.json.jbuilder"
	end

	def edit
		current_user.update(name: params[:name], email: params[:email],
												bio: params[:bio], birthday: params[:birthday],
												phone_number: params[:phone_number], location: params[:location],
												gender: params[:gender])
		if current_user.save
			render json: {message: "user updated"}, status: :ok
		end
	end

end
