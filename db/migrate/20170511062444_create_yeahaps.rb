class CreateYeahaps < ActiveRecord::Migration[5.0]
  def change
    create_table :yeahaps do |t|
      t.string :content
      t.string :favicon_url, default: "default"
      t.integer :position, default: 0
      t.boolean :is_public, default: 0
      t.references :user
      t.references :page
      t.references :yeahapbox
      t.timestamps
    end
  end
end
