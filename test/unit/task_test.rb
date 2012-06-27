# == Schema Information
#
# Table name: tasks
#
#  id               :integer         not null, primary key
#  name             :text
#  description      :text
#  user_id          :integer
#  approved         :boolean         default(FALSE)
#  percent_complete :integer
#  created_at       :datetime        not null
#  updated_at       :datetime        not null
#

require 'test_helper'

class TaskTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
