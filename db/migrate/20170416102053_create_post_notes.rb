class CreatePostNotes < ActiveRecord::Migration[5.0]
  def change
    create_table :post_notes do |t|

      t.references :post
      t.references :my_note
      t.integer    :number

      t.timestamps
    end
  end
end
