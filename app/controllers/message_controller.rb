class MessageController < ApplicationController

	def index
		@count = Message.count
	end

	def why
		@message = Message.new
		@candidate = "Donald Trump" if params[:party]
		@candidate = "Hillary Clinton" if !params[:party]
		puts "The candidate is: #{@candidate}"

	end


	def addwhy
		@message = Message.new(message_params)
		if @message.save
			if message_params[:complete]
				redirect_to root_path
				flash[:success] = "Thank you for participating!"
			else
				redirect_to whynot_path(party: @message.party)
			end

		else
			render why_path
		end
	end

	def whynot
		@message = Message.new
		@candidate = "Donald Trump" if !params[:party]
		@candidate = "Hillary Clinton" if params[:party]
		puts "The candidate is: #{@candidate}"
		puts "The party is: #{params[:party]}"
	end



=begin	def create
		@message = Message.new(message_params)
		if @message.save
			redirect_to root_path
		else
			render 'why_path'
		end
	end
=end
	private

	def message_params
		params.require(:message).permit(:weight, :positive, :party, :body, :complete)
	end


end
