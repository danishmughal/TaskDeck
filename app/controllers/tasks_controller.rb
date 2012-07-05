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

	def approvetask
		task = Task.find(params[:id])
		task.update_attribute(:approved, true)
		redirect_to '/member_tasks'		
	end

	def rejecttask
		task = Task.find(params[:id])
		task.destroy
		redirect_to '/member_tasks'
	end

	def completetask
		task = Task.find(params[:task][:id])
		task.update_attribute(:percent_complete, 100)
		redirect_to '/'
	end

	def updateform
		@task = Task.find(params[:task][:id])
	end

	def updatetask
		task = Task.find(params[:task][:id])

		if params[:task][:task_note][:description].length() < 5
			flash[:error] = "ERROR: Your update description must be at least 5 characters long. Please try again."
			redirect_to "/"
		else
			task.update_attribute(:percent_complete, params[:task][:percent_complete])
			@tasknote = TaskNote.new(task_id: task.id, description: params[:task][:task_note][:description], 
					  percent_complete: params[:task][:percent_complete])
			@tasknote.save!
			redirect_to '/'
		end

	end

	def show
		@task = Task.find(params[:id])
	end

end
