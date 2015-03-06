class AddPublishedAtToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :published_at, :datetime
    add_column :posts, :updated_at, :datetime
    add_column :posts, :created_at, :datetime
  end
end
