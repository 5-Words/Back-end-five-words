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
	 image.destroy
	 	render json: {message: "Image deleted"}, status: :ok
	 end

	 def image
	 	@image = Image.where(id: params[:id])
	 	#binding.pry
	 	if current_user.images.exists?(@image)
	 		render "image.json.jbuilder"
	 	else
	 		render json: {message: "You do not have access to this image"}, status: :unauthorized
	 	end
	 end

end











