# == Schema Information
#
# Table name: users
#
#  id              :integer         not null, primary key
#  name            :string(255)
#  email           :string(255)
#  organization_id :integer
#  admin           :boolean         default(FALSE)
#  team_id         :integer
#  team_leader     :boolean         default(FALSE)
#  created_at      :datetime        not null
#  updated_at      :datetime        not null
#  password_digest :string(255)
#  remember_token  :string(255)
#  team_pending    :boolean
#  time_zone       :string(255)
#

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
