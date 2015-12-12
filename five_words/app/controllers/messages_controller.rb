class MessagesController < ApplicationController
	def new
		@message = Message.new(username: params[:username],
													 subject: params[:subject],
													 content: params[:content])
		if @message.save
			render json: {message: "Message sent"}, status: :ok
		end
	end
end
