class Post < ActiveRecord::Base
	mount_uploader :picture, PictureUploader
	acts_as_taggable
	acts_as_taggable_on :tag

	has_many :post_categories
	has_many :categories, through: :post_categories

end
