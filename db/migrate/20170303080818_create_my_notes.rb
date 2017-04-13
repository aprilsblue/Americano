class CreateMyNotes < ActiveRecord::Migration[5.0]
  def change
    create_table :my_notes do |t|

      t.string :title
      t.references :user
      t.references :book

      t.timestamps
    end
  end
end
