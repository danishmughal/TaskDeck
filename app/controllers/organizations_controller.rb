class OrganizationsController < ApplicationController

	def new
		@organization = Organization.new
	end

	def create
		if current_user.organization_id.nil?
			@organization = Organization.new(params[:organization])
			if @organization.save
				current_user.update_attribute(:organization_id, @organization.id)
				current_user.update_attribute(:admin, true)
				sign_in current_user
				flash[:success] = "Organization successfully created. Welcome to your TaskDeck."
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



	def orgpanel
	end

	def admin
		
	end

	def updateprefs
		orgid = params[:organization][:orgid]
		name = params[:organization][:name]

		org = Organization.find(orgid)
		oldname = org.full_name
		org.update_attributes(full_name: name)
		flash[:success] = "Your organizaton's name has been changed from " + oldname + " to " + org.full_name + "."
		redirect_to '/admin'

	end

	def updatepassword
		if params[:organization][:password] == params[:organization][:password_confirmation]
			org = Organization.find(params[:organization][:orgid])
			pass = params[:organization][:password]
			org.update_attributes(password: pass)
			flash[:success] = "Your organization's password has been successfully changed."
			redirect_to '/admin'
		else
			flash[:error] = "Your passwords did not match. Please try again."
			redirect_to '/admin'
		end
	end


end