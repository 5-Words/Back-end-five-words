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

end
