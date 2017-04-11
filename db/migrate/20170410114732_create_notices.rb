class CreateNotices < ActiveRecord::Migration[5.0]
  def change
    create_table :notices do |t|

      t.string :content;
      t.string :url;
      t.references :book, index: true, foreign_key: true

      t.timestamps
    end
  end
end
