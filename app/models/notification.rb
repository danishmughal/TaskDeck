# == Schema Information
#
# Table name: notifications
#
#  id          :integer         not null, primary key
#  user_id     :integer
#  description :text
#  target      :text
#  seen        :boolean
#  created_at  :datetime        not null
#  updated_at  :datetime        not null
#

class Notification < ActiveRecord::Base
  attr_accessible :user_id, :description, :target, :seen

  validates :user_id, presence: true
  validates :description, presence: true
  validates :target, presence: true

end
