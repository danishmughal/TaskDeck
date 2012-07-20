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

class ProjectTask < ActiveRecord::Base
  attr_accessible :project_id, :user_id, :name, :description, :percent_complete, :completed_at
  belongs_to :project
  belongs_to :user


  validates :project_id, presence: true
  validates :name, presence: true
  validates :description, presence: true
  
end
