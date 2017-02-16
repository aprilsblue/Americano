class CreateBookmarks < ActiveRecord::Migration[5.0]
  def change
    create_table :bookmarks do |t|
      t.references :book, index: true, foreign_key: true
      t.references :reader, index: true, foreign_key: true
      t.integer    :quote_id

      t.timestamps
    end
  end
end
