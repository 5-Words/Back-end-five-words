class ImagesController < ApplicationController

	def add
		@image =	current_user.images.new(image: params[:image])
		if @image.save
			render json: {message: "Imaged Saved"}, status: :ok
		end

	end
end
