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

end