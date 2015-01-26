class AddPosts < ActiveRecord::Migration
  def change
  	create_table :posts do |post|
  		post.string :title
  		post.text :content
  		
  		post.timestamp
  	end
  end
end
