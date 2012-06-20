class OrganizationsController < ApplicationController

	def new
		@organization = Organization.new
	end

	def create
		@organization = Organization.new(params[:organization])
		if @organization.save
			current_user.update_attribute(:organization_id, @organization.id)
			flash[:success] = "Organization successfully created"
			redirect_to '/'
		else
			render 'new'
		end
	end


	def joinorg
		username = params[:organization][:username]
		password = params[:organization][:password]
  		@orgs = Organization.find_by_username_and_password username, password
  		if @orgs
  			@joinedtrue = true
  			current_user.update_attribute(:organization_id, @orgs.id)
   			flash.now[:success] = @orgs.full_name
  		else
  			flash[:error] = "Incorrect username/password combination"
  		end
	end

end