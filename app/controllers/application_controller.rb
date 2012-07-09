class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper

  before_filter :set_timezone  
  
	def set_timezone  
	  # current_user.time_zone #=> 'Central Time (US & Canada)'  
	  if signed_in?
	  	Time.zone = current_user.time_zone ||= 'Central Time (US & Canada)'  
	  end
	end  

end
