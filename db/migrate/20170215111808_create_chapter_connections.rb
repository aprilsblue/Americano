class CreateChapterConnections < ActiveRecord::Migration[5.0]
  def change
    create_table :chapter_connections do |t|
      t.references :superchapter, index: true, foreign_key: true
      t.references :subchapter, index: true,  foreign_key: true

      t.timestamps
    end
  end
end
