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

class Project < ActiveRecord::Base
  attr_accessible :team_id, :name, :description, :completed_at
  belongs_to :team
  has_many :project_tasks

  validates :team_id, presence: true
  validates :name, presence: true
  validates :description, presence: true
  

end
