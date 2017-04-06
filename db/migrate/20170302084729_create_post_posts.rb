class CreatePostPosts < ActiveRecord::Migration[5.0]
  def change
    create_table :post_posts do |t|

      t.references :parent, index: true, foreign_key: true
      t.references :child, index: true, foreign_key: true

      t.timestamps
    end
  end
end
