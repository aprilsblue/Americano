class AddPositionToYeahaps < ActiveRecord::Migration[5.0]
  def change
    add_column :yeahaps, :position, :integer, default: 0
  end
end
