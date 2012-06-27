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

class Task < ActiveRecord::Base
  attr_accessible :name, :description, :user_id, :approved, 
  				  :percent_complete
  belongs_to :user
  

  validates :name, presence: true, length: { maximum: 50 }
  validates :description, presence: true
  validates :user_id, presence: true
  validates :percent_complete, presence: true



end
