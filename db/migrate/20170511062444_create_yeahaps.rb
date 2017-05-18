class CreateYeahaps < ActiveRecord::Migration[5.0]
  def change
    create_table :yeahaps do |t|
      t.string :content
      t.references :user
      t.references :page
      t.references :yeahapbox
      t.timestamps
    end
  end
end
