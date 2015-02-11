class Post < ActiveRecord::Base
	mount_uploader :picture, PictureUploader
	acts_as_taggable
	acts_as_taggable_on :tag
end
