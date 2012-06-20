class UsersController < ApplicationController

	def new
		@user = User.new
	end

	def create
		@user = User.new(params[:user])
		if @user.save
			sign_in @user
			flash[:success] = "Your account has been created. Welcome to TaskDeck!"
			redirect_to '/'
		else
			render 'new'
		end
	end

end