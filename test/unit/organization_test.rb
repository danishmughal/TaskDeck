# == Schema Information
#
# Table name: organizations
#
#  id         :integer         not null, primary key
#  full_name  :text
#  username   :string(255)
#  password   :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

require 'test_helper'

class OrganizationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
