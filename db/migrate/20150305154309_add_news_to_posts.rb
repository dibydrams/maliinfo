class AddNewsToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :spotlight, :boolean
    add_column :posts, :inshort, :boolean
  end
end
