# == Schema Information
#
# Table name: users
#
#  id              :integer         not null, primary key
#  name            :string(255)
#  email           :string(255)
#  created_at      :datetime        not null
#  updated_at      :datetime        not null
#  password_digest :string(255)
#  remember_token  :string(255)
#  organization_id :integer
#

class User < ActiveRecord::Base
	attr_accessible :name, :email, :password, :password_confirmation, :organization_id
	has_secure_password
	has_one :organization

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
