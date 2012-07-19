# == Schema Information
#
# Table name: projects
#
#  id           :integer         not null, primary key
#  team_id      :integer
#  name         :string(255)
#  description  :text
#  completed_at :datetime
#  created_at   :datetime        not null
#  updated_at   :datetime        not null
#

require 'test_helper'

class ProjectTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
