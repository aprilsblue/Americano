class CreateReplies < ActiveRecord::Migration[5.0]
  def change
    create_table :replies do |t|

      t.string :content
      t.references :post
      t.references :user

      t.timestamps
    end
  end
end
