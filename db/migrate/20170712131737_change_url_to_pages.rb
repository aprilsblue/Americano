class ChangeUrlToPages < ActiveRecord::Migration[5.0]
  def change
    change_column :pages, :url, :text
  end
end
