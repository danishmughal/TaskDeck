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

class Organization < ActiveRecord::Base
	attr_accessible :full_name, :password, :username
	has_many :users

	before_save { |organization| organization.username = username.downcase }



	validates :full_name, presence: true, length: { minimum: 2 }
	validates :password, presence: true, length: { minimum: 6 }
	validates :username, presence: true, uniqueness: true

	
end
