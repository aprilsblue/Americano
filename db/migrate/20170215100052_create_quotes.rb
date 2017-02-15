class CreateQuotes < ActiveRecord::Migration[5.0]
  def change
    create_table :quotes do |t|
      t.text :content

      t.belongs_to :user
      t.belongs_to :chapter
      t.timestamps
    end
  end
end
