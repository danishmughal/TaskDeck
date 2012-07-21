class UserMailer < ActionMailer::Base
  default :from => "taskdeckmailer@gmail.com"  
  
  def registration_confirmation(user)
  	@user = user  
    mail(:to => user.email, :subject => "Registration Complete!")  
  end


  def team_requested(user, teamleader)
  	@user = user
  	@teamleader = teamleader
 	  mail(:to => teamleader.email, :subject => user.name + " has requested to join your team on TaskDeck.")
  end



  def send_team_confirmed(user)
  	@user = user
  	@recipients = User.where(team_id: user.team_id)
  	@recipients.each do |recipient|
  		team_confirmed(recipient, @user).deliver
  	end
  end

  def team_confirmed(recipient, user)
    @recipient = recipient
  	@user = user
  	mail(:to => recipient.email, :subject => user.name + " has joined your team on TaskDeck.")
  end


  def task_assigned(user, task)
    @user = user
    @task = task
    mail(:to => user.email, :subject => "You have been assigned a new task on TaskDeck.")
  end

=begin
  def send_reminder_email(reminders)
    reminders.each do |r|
      r.user = @user
      r.name = @reminder_name
      r.description = @reminder_description
      reminder_email(@user, @reminder_name, @reminder_description).deliver
    end
  end

  def reminder_email(user, reminder_name, reminder_description)
      @user = user
      @reminder_name = reminder_name
      @reminder_description = reminder_description
      mail(:to => user.email, :subject => "Reminder for " + reminder_name)
  end
=end

  def reminder_email(reminder)
    @reminder = reminder
    mail(:to => reminder.user.email, :subject => "Reminder for " + reminder.name)
  end
    
  def reset_password(admin, newpassword)
    @admin = admin
    @newpassword = newpassword
    mail(:to => admin.email, :subject => "Your Organization Password has been reset")
    
  end

end
