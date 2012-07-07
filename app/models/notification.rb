class Notification < ActiveRecord::Base
  attr_accessible :user_id, :description, :target, :seen

  validates :user_id, presence: true
  validates :description, presence: true
  validates :target, presence: true

end
