class CreateUserFriends < ActiveRecord::Migration[5.0]
  def change
    create_table :user_friends do |t|

      t.integer :follower_id
      t.integer :followee_id
      t.string  :status

      t.timestamps
    end

    add_index(:user_friends, [:follower_id, :followee_id], unique: true)
    add_index(:user_friends, [:followee_id, :follower_id], unique: true)
  end
end
