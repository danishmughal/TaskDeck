# == Schema Information
#
# Table name: project_tasks
#
#  id               :integer         not null, primary key
#  project_id       :integer
#  user_id          :integer
#  name             :string(255)
#  description      :text
#  percent_complete :integer         default(0)
#  completed_at     :datetime
#  created_at       :datetime        not null
#  updated_at       :datetime        not null
#

require 'test_helper'

class ProjectTaskTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
