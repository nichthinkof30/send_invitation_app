class Invitation < ActiveRecord::Base
  attr_accessible :reward_id, :user_id

  belongs_to :reward
  belongs_to :user
  
end
