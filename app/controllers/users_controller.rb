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


	def jointeam
		if current_user.team_id.nil?
			current_user.update_attribute(:team_id, params[:id])
			current_user.update_attribute(:team_pending, true)
			sign_in current_user
			flash[:success] = "You have submitted your request to join the team. You will officially become 
			a part of the team once the Team Leader accepts your request to join the team."
			redirect_to '/orgpanel'
		else
			flash[:error] = "Invalid Request"
		end
	end

	def confirmteam
		user = User.find(params[:id])
		user.update_attribute(:team_pending, false)
		flash[:success] = user.name + " has been added into your team."
		redirect_to '/teampanel#tab2'
	end

	def denyteam
		user = User.find(params[:id])
		user.update_attribute(:team_pending, false)
		user.update_attribute(:team_id, nil)
		flash[:success] = user.name + " has been denied from your team."
		redirect_to '/teampanel#tab2'
	end


	def removeuserteam
		user = User.find(params[:id])
		user.update_attribute(:team_pending, false)
		user.update_attribute(:team_id, nil)
		flash[:success] = user.name + " has been removed from your team."
		redirect_to '/teampanel'
		
	end


end