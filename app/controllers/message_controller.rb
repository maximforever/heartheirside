class MessageController < ApplicationController

	def index
		@count = Message.count
	end

	def why
		@message = Message.new

		if params[:party] == "true"
			@candidate = "Donald Trump" 
		elsif params[:party] == "false"
			@candidate = "Hillary Clinton"
		else
			redirect_to root_path
		end

		puts "The candidate is: #{@candidate}"

	end


	def addwhy
		@message = Message.new(message_params)
		if @message.save
			if message_params[:complete] == "true"
				redirect_to results_path
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

		if params[:party] == "true"
			@candidate = "Hillary Clinton" 
		elsif params[:party] == "false"
			@candidate = "Donald Trump"
		else
			redirect_to whynot_path
		end

		puts "The candidate is: #{@candidate}"
		puts "The party is: #{params[:party]}"
	end

	def results

		@hill_good = Message.where(["party = ? and positive = ?", false, true])
		@hill_bad = Message.where(["party = ? and positive = ?", false, false])
		@don_good = Message.where(["party = ? and positive = ?", true, true])
		@don_bad = Message.where(["party = ? and positive = ?", true, false])

	end


	private

	def message_params
		params.require(:message).permit(:weight, :positive, :party, :body, :complete)
	end


end
