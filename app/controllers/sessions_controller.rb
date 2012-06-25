class SessionsController < ApplicationController

	def new
	end

	def create
		user = User.find_by_email(params[:session][:email])
		if user && user.authenticate(params[:session][:password])
			sign_in user
			redirect_to root_path
			flash[:success] = "Welcome back to TaskDeck. You have X notifications."
		else
			flash.now[:error] = 'Invalid email/password combination. Please try again.'
			render 'new'
		end
	end

	def destroy
		sign_out
		redirect_to root_path
	end


end
