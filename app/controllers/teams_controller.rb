class TeamsController < ApplicationController

	def teampanel
	end

	def new
		@team = Team.new
	end

	def create
		name = params[:team][:name]
		org = current_user.organization_id
		@team = Team.new(name: name, organization_id: org)
		if @team.save
			current_user.update_attribute(:team_id, @team.id)
			current_user.update_attribute(:team_leader, true)
			sign_in current_user
			flash[:success] = "Team successfully created"
			redirect_to '/teampanel'
		else
			flash[:error] = "Failure"
			render 'new'
		end

	end

end
