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

class User < ActiveRecord::Base
	attr_accessible :name, :email, :password, :password_confirmation, :organization_id, :time_zone
	has_secure_password
	belongs_to :organization
	belongs_to :team
	has_many :tasks
	has_many :reminders
	accepts_nested_attributes_for :tasks


	before_save :create_remember_token
	before_save { |user| user.email = email.downcase }

	validates :name, presence: true, length: { maximum: 50 }

	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
			  uniqueness: true


	validates :password, presence: true, length: { minimum: 6 }
	validates :password_confirmation, presence: true



	private

		def create_remember_token
			self.remember_token = SecureRandom.urlsafe_base64
		end

end
