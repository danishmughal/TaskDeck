class TaskNotesController < ApplicationController

	def new_note
		flash[:succes] = "Success!!!"
		redirect_to '/'
	end


end
