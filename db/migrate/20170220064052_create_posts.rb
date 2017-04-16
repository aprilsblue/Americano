class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|

      t.string      :content
      t.string      :qna
      t.integer     :page
      t.integer     :chapter
      t.integer     :caffeine
      t.boolean     :is_private, default: false
      t.boolean     :is_child, default: false
      t.references  :user
      t.references  :book

      t.timestamps
    end

    add_index :posts, :is_child
  end
end
