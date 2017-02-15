class CreateChapters < ActiveRecord::Migration[5.0]
  def change
    create_table :chapters do |t|
      t.string :title
      t.integer :ch_no

      t.belongs_to :user
      t.belongs_to :book
      t.timestamps
    end
  end
end
