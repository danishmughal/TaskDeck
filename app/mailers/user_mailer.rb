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

end
