class CreateMyNotes < ActiveRecord::Migration[5.0]
  def change
    create_table :my_notes do |t|

      t.string :title
      t.references :user

      t.timestamps
    end
  end
end
