class Post < ActiveRecord::Base
  extend FriendlyId
    friendly_id :title, use: :slugged
  mount_uploader :picture, PictureUploader
  acts_as_taggable
  acts_as_taggable_on :tag

  has_many :post_categories
  has_many :categories, through: :post_categories

  scope :highlight, -> {where(spotlight: true)}
  scope :downplay, -> {where(inshort: true)}
end
