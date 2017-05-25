class AddPostionToYeahapboxex < ActiveRecord::Migration[5.0]
  def change
    add_column :yeahapboxes, :position, :integer, default: 0
  end
end
