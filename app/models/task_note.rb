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
#  task_type        :string(255)
#

class TaskNote < ActiveRecord::Base
  attr_accessible :task_id, :description, :percent_complete, :task_type
  belongs_to :task


  validates :task_id, presence: true
  validates :description, presence: true, length: { minimum: 5 }
  validates :percent_complete, presence: true

end
