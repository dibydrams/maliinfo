class AddCategoriesToPost < ActiveRecord::Migration
  def up
  	create_table :categories do |cat|
  		cat.string :name
  	end

  	create_table :post_categories do |p|
  		p.belongs_to :post
  		p.belongs_to :category
  	end
  end

  def down
  	drop_table :categories
  	drop_table :post_categories
  end

end
