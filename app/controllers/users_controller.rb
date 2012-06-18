class UsersController < ApplicationController

	def new
		@user = User.new
	end

	def create
		@user = User.new(params[:user])
		if @user.save
			sign_in @user
			flash[:success] = "User successfully created"
			redirect_to '/'
		else
			render 'new'
		end
	end


end