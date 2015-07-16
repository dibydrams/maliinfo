class Category < ActiveRecord::Base
  extend FriendlyId
      friendly_id :name, use: :slugged
  has_many :post_categories
  has_many :posts, through: :post_categories
end