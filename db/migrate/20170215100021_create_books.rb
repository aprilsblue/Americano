class CreateBooks < ActiveRecord::Migration[5.0]
  def change
    create_table :books do |t|

      t.string :title
      t.string :writer
      t.string :publisher
      t.datetime :published_at
      t.string :picture
      t.integer :edition

      t.belongs_to :user, index: true

      t.timestamps
    end
  end
end
