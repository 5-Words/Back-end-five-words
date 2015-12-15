class ImagesController < ApplicationController

	def add
		@image =	current_user.images.new(image: params[:image])
		if @image.save
			render json: {message: "Imaged Saved"}, status: :ok
		end
	end

		def index 
			@images = current_user.images
			render "gallery.json.jbuilder"
	  end

	 def destroy
	 image = Image.find_by(id: params[:id])
		if current_user.id == image.user_id
	 	image.destroy
	 		render json: {message: "Image deleted"}, status: :ok
	 	else
	 		render json: {message: "You do not have access to this image"}, status: :unauthorized
	 	end
	 end

	 def image
	 	@image = Image.where(id: params[:id])
	 	#binding.pry
	 	if current_user.id == @image[0]["user_id"]
	 		render "image.json.jbuilder"
	 	else
	 		render json: {message: "You do not have access to this image"}, status: :unauthorized
	 	end
	 end

	 def friend_image
	 	@image = Image.where(id: params[:id])
	 	
	 	render "single_image.json.jbuilder"
	 end
end











