class RemoveUserIdFromReward < ActiveRecord::Migration
  def up
    remove_column :rewards, :user_id
  end

  def down
    add_column :rewards, :user_id, :integer
  end
end
