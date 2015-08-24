class UpdateDefaultsForPosts < ActiveRecord::Migration
  def change
  	change_column :posts, :spotlight, :boolean, null: false, default: false
  	change_column :posts, :inshort, :boolean, null: false, default: false
  	change_column :posts, :carousel, :boolean, null: false, default: false
  	change_column :posts, :flash, :boolean, null: false, default: false
  end
end
