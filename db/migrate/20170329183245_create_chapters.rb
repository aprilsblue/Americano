class CreateChapters < ActiveRecord::Migration[5.0]
  def change
    create_table :chapters do |t|

      t.integer    :unit
      t.string     :title
      t.references :book, index: true, foreign_key: true

      t.timestamps
    end
  end
end
