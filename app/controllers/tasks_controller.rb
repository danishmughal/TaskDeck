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
			@teamleader = User.find(:first, :conditions => ["team_id = ? and team_leader = ?", current_user.team_id, true])
			@notification = Notification.new(user_id: @teamleader.id, 
								 description: current_user.name + " has created a task '" + @task.name + "' which must be approved.",
								 target: "/member_tasks",
								 seen: false)
			@notification.save!
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
		@notification = Notification.new(user_id: task.user.id, 
								 description: "Your pending task " + task.name + " has been approved by your team leader.",
								 target: "/tasks/" + task.id.to_s,
								 seen: false)
		@notification.save!
		redirect_to '/member_tasks'		
	end

	def rejecttask
		task = Task.find(params[:id])
		@notification = Notification.new(user_id: task.user.id, 
								 description: "Your pending task " + task.name + " has been REJECTED by your team leader.",
								 target: "/",
								 seen: false)
		@notification.save!
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


	def assigntaskform
	end

	def assigntask
		id = params[:user][:id]
		name = params[:task][:name]
		desc = params[:task][:description]
		@task = Task.new(name: name, description: desc, 
						 user_id: id,
						 percent_complete: 0,
						 approved: true)
		if @task.save
			sign_in current_user
			@taskuser = User.find(id)
			UserMailer.task_assigned(@taskuser, @task).deliver
			@notification = Notification.new(user_id: @taskuser.id, 
								 description: "You have been assigned a new task " + name + " by your Team Leader.",
								 target: "/tasks/" + @task.id.to_s,
								 seen: false)
			@notification.save!
			flash[:success] = "The task " + name + " has been assigned to " + @taskuser.name + "."
			redirect_to '/assigntask'
		else
			flash[:error] = "Failure"
			render 'new'
		end
	end

end
