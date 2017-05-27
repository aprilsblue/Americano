class AddPublicAndUrlToYeahaps < ActiveRecord::Migration[5.0]
  def change
    add_column :yeahaps, :is_public, :boolean, default: 0
    add_column :yeahaps, :favicon_url, :string, default: "default"
  end
end
