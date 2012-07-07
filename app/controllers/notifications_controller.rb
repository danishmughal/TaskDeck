class NotificationsController < ApplicationController

	def clearnotifs
		id = params[:notification][:id]
		Notification.update_all({seen: true}, {user_id: id})
		redirect_to(:back)
	end

	def index
		
	end

end
