# == Schema Information
#
# Table name: reminders
#
#  id          :integer         not null, primary key
#  user_id     :integer
#  name        :string(255)
#  description :text
#  reminder_at :datetime
#  created_at  :datetime        not null
#  updated_at  :datetime        not null
#

class Reminder < ActiveRecord::Base

	attr_accessible :user_id, :name, :description, :reminder_at
	belongs_to :user


	def check_for_reminders
	@reminders = Reminder.find(:all, :conditions => ["reminder_at <= ? and reminder_at > ?", Time.now.advance(:minutes => 2), Time.now])

		unless @reminders.nil?
			UserMailer.send_reminder_email(reminders)
		end
	end

end
