class CreateOpinions < ActiveRecord::Migration[5.0]
  def change
    create_table :opinions do |t|
      t.text :content
      t.string :category

      t.belongs_to :user
      t.belongs_to :quote 
      
      t.timestamps
    end
  end
end
