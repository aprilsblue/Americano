class ChangePublicToPrivate < ActiveRecord::Migration[5.0]
  def change
    change_column :yeahaps, :is_public, :boolean, default: 1
  end
end
