# == Schema Information
#
# Table name: teams
#
#  id              :integer         not null, primary key
#  name            :string(255)
#  organization_id :integer
#  created_at      :datetime        not null
#  updated_at      :datetime        not null
#

class Team < ActiveRecord::Base
	attr_accessible :name, :organization_id
	belongs_to :organization
	has_many :users
	has_many :projects

	validates :name, presence: true, length: { maximum: 30 }, uniqueness: true
	validates :organization_id, presence: true


end
