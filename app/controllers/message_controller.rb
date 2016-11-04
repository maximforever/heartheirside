class MessageController < ApplicationController

	def index
		@count = Message.count
		session[:complete] = 0
		puts "!!! -- SESSION COMPLETE is: #{session[:complete]}"
	end

	def why

		puts "!!! WHY -- SESSION COMPLETE is: #{session[:complete]}"

		@message = Message.new
		
		if session[:complete] != 0
			session[:complete] = 0
			redirect_to root_path
		elsif params[:party] == "true"
			@candidate = "Donald Trump" 
		elsif params[:party] == "false"
			@candidate = "Hillary Clinton"
		else
			redirect_to root_path
		end

		puts "The candidate is: #{@candidate}"

	end

	def addwhy

		puts "!!! -- POSTING!"
		puts "!!! post -- INIT: SESSION COMPLETE is: #{session[:complete]}"

		@message = Message.new(message_params)
		
		if @message.save
			puts "!!! post -- START: SESSION COMPLETE is: #{session[:complete]}"

			if session[:complete] == 0
				puts "upping to 1"
				session[:complete] = 1
				redirect_to whynot_path(party: @message.party)
			elsif session[:complete] == 1
				puts "upping to 2"
				session[:complete] = 2
				redirect_to results_path
			else
				flash[:success] = "Something went wrong here."
				redirect_to root_path
			end
			
			puts "!!! post -- END: SESSION COMPLETE is: #{session[:complete]}"

		else
			redirect_to root_path
			flash[:success] = "Something went wrong here."
		end


	end

	def whynot

		puts "!!! WHYNOT start -- SESSION COMPLETE is: #{session[:complete]}"

		@message = Message.new

		if session[:complete] != 1
			session[:complete] = 0
			redirect_to root_path
		elsif params[:party] == "true"
			@candidate = "Donald Trump" 
		elsif params[:party] == "false"
			@candidate = "Hillary Clinton"
		else
			redirect_to whynot_path
		end

		session[:complete] = 1

		puts "The candidate is: #{@candidate}"
		puts "The party is: #{params[:party]}"
	end

	def results


		# redirect_to root_path if session[:complete] != 2

		session[:complete] == 0

		@hill_good = Message.where(["party = ? and positive = ?", false, true])
		@hill_bad = Message.where(["party = ? and positive = ?", false, false])
		@don_good = Message.where(["party = ? and positive = ?", true, true])
		@don_bad = Message.where(["party = ? and positive = ?", true, false])

		gon.hill_good = @hill_good
		gon.hill_bad = @hill_bad
		gon.don_good = @don_good
		gon.don_bad = @don_bad

	end


	private

	def message_params
		params.require(:message).permit(:weight, :positive, :party, :body, :complete)
	end


end
