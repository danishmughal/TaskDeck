class TasksController < ApplicationController

	def new
		@task = Task.new
	end


	def create
		name = params[:task][:name]
		desc = params[:task][:description]
		@task = Task.new(name: name, description: desc, 
						 user_id: current_user.id,
						 percent_complete: 0)
		if @task.save
			sign_in current_user
			flash[:success] = "Task created."
			redirect_to '/'
		else
			flash[:error] = "Failure"
			render 'new'
		end
	end

end
