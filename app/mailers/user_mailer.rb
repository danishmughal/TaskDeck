class UserMailer < ActionMailer::Base
  default :from => "taskdeckmailer@gmail.com"  
  
  def registration_confirmation(user)
  	@user = user  
    mail(:to => user.email, :subject => "Registration Complete!")  
  end

end
