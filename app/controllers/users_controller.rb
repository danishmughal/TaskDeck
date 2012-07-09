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
			teamid = params[:id]
			@teamleader = User.find(:first, :conditions => ["team_id = ? and team_leader = ?", teamid, true])
			@notification = Notification.new(user_id: @teamleader.id, 
								 description: current_user.name + " has requested to join your team.",
								 target: "/team_management",
								 seen: false)
			@notification.save!
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
		@notification = Notification.new(user_id: user.id, 
								 description: "You have been accepted into the team '" + current_user.team.name + "'' by " + current_user.name + ".",
								 target: "/teampanel",
								 seen: false)
		@notification.save!
		user.update_attribute(:team_pending, false)
		flash[:success] = user.name + " has been added into your team."
		redirect_to '/team_management' 
	end

	def denyteam
		user = User.find(params[:id])
		@notification = Notification.new(user_id: user.id, 
								 description: current_user.name + " has denied your request to join the team '" + current_user.team.name + "'",
								 target: "/orgpanel",
								 seen: false)
		@notification.save!
		user.update_attribute(:team_pending, false)
		user.update_attribute(:team_id, nil)
		flash[:success] = user.name + " has been denied from your team."
		redirect_to '/team_management'
	end


	def removeuserteam
		user = User.find(params[:id])
		@notification = Notification.new(user_id: user.id, 
								 description: current_user.name + " has removed you from the team '" + current_user.team.name + "'",
								 target: "/orgpanel",
								 seen: false)
		@notification.save!
		user.update_attribute(:team_pending, false)
		user.update_attribute(:team_id, nil)
		flash[:success] = user.name + " has been removed from your team."
		redirect_to '/team_management'
	end


	def show
		@user = User.find(params[:id])		
	end




	def edit
		@user = current_user
	end

	def update
		@user = current_user
	    if @user.update_attributes(params[:user])
	      #handle a successful update
	      flash[:success] = "Profile updated succesfully"
	      sign_in @user
	      redirect_to '/settings'
	    else
	      render 'edit'
	    end
	end







end