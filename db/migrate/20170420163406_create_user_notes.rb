class CreateUserNotes < ActiveRecord::Migration[5.0]
  def change
    create_table :user_notes do |t|

      t.integer :user_id
      t.integer :my_note_id
      t.string  :authority

      t.timestamps
    end
  end
end
