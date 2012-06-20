class OrganizationsController < ApplicationController

	def new
		@organization = Organization.new
	end

	def create
		if current_user.organization_id.nil?
			@organization = Organization.new(params[:organization])
			if @organization.save
				current_user.update_attribute(:organization_id, @organization.id)
				sign_in current_user
				flash[:success] = "Organization successfully created"
				redirect_to '/'
			else
				render 'new'
			end
		else
			flash[:error] = "Invalid Request"
	  		redirect_to '/'
	  	end
	end


	def joinorg
		if current_user.organization_id.nil?
			username = params[:organization][:username]
			password = params[:organization][:password]
	  		@orgs = Organization.find_by_username_and_password username, password
	  		if @orgs
	  			@joinedtrue = true
	  			current_user.update_attribute(:organization_id, @orgs.id)
	  			sign_in current_user
	  		else
	  			flash[:error] = "Incorrect username/password combination"
	  		end
	  	else
	  		flash[:error] = "Invalid Request"
	  		redirect_to '/'
	  	end
	end

end