class CreateInNotes < ActiveRecord::Migration[5.0]
  def change
    create_table :in_notes do |t|
      t.references :my_note
      t.references :yeahap

      t.timestamps
    end
  end
end
