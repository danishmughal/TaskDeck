class ProjectTasksController < ApplicationController

	def new
		@project_task = ProjectTask.new
	end

	def create
		name = params[:project_task][:name]
		desc = params[:project_task][:description]
		projid = params[:project_task][:projectid]
		if current_user.team_leader?
			@project_task = ProjectTask.new(name: name, description: desc, 
						 project_id: projid)
		else
			flash[:error] = "You are not allowed to do that."
		end

		if @project_task.save
			sign_in current_user
			flash[:success] = "Your project's task has been created."
			redirect_to '/projects/' + projid.to_s
		else
			flash[:error] = "Failure. Please try again."
			render 'new'
		end
	end

	def show
		@project_task = ProjectTask.find(params[:id])
	end

	def assigntask
		team_member_id = params[:user][:id]
		project_task_id = params[:project_task][:id]
		user = User.find(team_member_id)
		project_task = ProjectTask.find(project_task_id)
		project_task.update_attributes(user_id: user.id)
		flash[:success] = "You have assigned the project task '" + project_task.name + "' to " + user.name + "."
		redirect_to '/projects/' + params[:project_task][:projectid]
	end



	def index
		
	end


	def completetask
		task = ProjectTask.find(params[:task][:id])
		task.update_attribute(:percent_complete, 100)
		redirect_to '/project_tasks'
	end

	def updateform
		@task = ProjectTask.find(params[:task][:id])
	end

	def updatetask
		task = ProjectTask.find(params[:task][:id])

		if params[:task][:task_note][:description].length() < 5
			flash[:error] = "ERROR: Your update description must be at least 5 characters long. Please try again."
			redirect_to "/project_tasks"
		else
			task.update_attribute(:percent_complete, params[:task][:percent_complete])
			@tasknote = TaskNote.new(task_id: task.id, description: params[:task][:task_note][:description], 
					  percent_complete: params[:task][:percent_complete], task_type: 'project_task')
			@tasknote.save!
			redirect_to '/'
		end

	end




end
