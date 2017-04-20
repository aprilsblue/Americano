class CreateMyPages < ActiveRecord::Migration[5.0]
  def change
    create_table :my_pages do |t|

      t.timestamps
    end
  end
end
