class ProjectsController < ApplicationController
	def new
		@project = Project.new
	end

	def create
		name = params[:project][:name]
		desc = params[:project][:description]
		if current_user.team_leader?
			@project = Project.new(name: name, description: desc, 
						 team_id: current_user.team_id)
		else
			flash[:error] = "You are not allowed to do that."
		end

		if @project.save
			sign_in current_user
			flash[:success] = "Your project has been created."
			redirect_to '/projects'
		else
			flash[:error] = "Failure. Please try again."
			render 'new'
		end
	end


	def show
		@project = Project.find(params[:id])
	end

	def updateproject
		projectid = params[:project][:id]
		projectname = params[:project][:name]
		desc = params[:project][:description]

		proj = Project.find(projectid)

		proj.update_attributes(name: projectname, description: desc)

		redirect_to '/projects/' + projectid
		
	end
end