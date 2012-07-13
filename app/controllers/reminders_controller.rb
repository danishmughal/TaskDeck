class RemindersController < ApplicationController

	def new
		@reminder = Reminder.new
	end

	def create
		name = params[:reminder][:name]
		desc = params[:reminder][:description]
		reminder = params[:reminder][:reminder_at]
		@reminder = Reminder.new(user_id: current_user.id, name: name, description: desc,
								 reminder_at: reminder)
		if @reminder.save
			UserMailer.delay({:run_at => @reminder.reminder_at}).reminder_email(@reminder)
			sign_in current_user
			flash[:success] = "Reminder set."
			redirect_to '/reminders'
		else
			flash[:error] = "Failure"
			render 'new'
		end
	end



end
