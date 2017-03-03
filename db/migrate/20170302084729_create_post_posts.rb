class CreatePostPosts < ActiveRecord::Migration[5.0]
  def change
    create_table :post_posts do |t|

      t.references :parent
      t.references :child

      t.timestamps
    end
  end
end
