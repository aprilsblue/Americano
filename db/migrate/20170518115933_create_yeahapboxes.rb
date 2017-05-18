class CreateYeahapboxes < ActiveRecord::Migration[5.0]
  def change
    create_table :yeahapboxes do |t|
      t.references :user
      t.string :title
      t.timestamps
    end
  end
end
