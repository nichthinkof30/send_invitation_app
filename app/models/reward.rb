class Reward < ActiveRecord::Base
  attr_accessible :name, :user_id

  has_many :invitations
  has_many :users, through: :invitations
  
  def self.generate_random_id
    reward_ids= []
    rewards = Reward.all
    rewards.each do |reward|
      reward_ids.push(reward.id)
    end

    random_id = reward_ids.sample
    random_id
  end
  
end
