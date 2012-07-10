ActionMailer::Base.smtp_settings = {  
  :address              => "smtp.gmail.com",  
  :port                 => 587,  
  :domain               => "gmail.com",  
  :user_name            => "taskdeckmailer",  
  :password             => "Demo1234",  
  :authentication       => "plain",  
  :enable_starttls_auto => true  
}