# == Schema Information
#
# Table name: task_notes
#
#  id               :integer         not null, primary key
#  task_id          :integer
#  description      :text
#  percent_complete :integer
#  created_at       :datetime        not null
#  updated_at       :datetime        not null
#

require 'test_helper'

class TaskNoteTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
