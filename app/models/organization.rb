class Organization < ActiveRecord::Base
	attr_accessible :name

	validates :name, presence: true, length: { minimum: 2 }

end