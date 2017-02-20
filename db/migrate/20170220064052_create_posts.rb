class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|

      t.string :content
      t.integer :page
      t.references :user
      t.references :book

      t.timestamps
    end
  end
end
