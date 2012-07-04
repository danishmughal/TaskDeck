class TaskNote < ActiveRecord::Base
  attr_accessible :task_id, :description
  belongs_to :task


  validates :task_id, presence: true
  validates :description, presence: true, length: { minimum: 20 }
  validates :percent_complete, presence: true

end