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

require 'test_helper'

class ReminderTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
