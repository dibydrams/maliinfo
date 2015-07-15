class CategoriesController < ApplicationController
  def show
    @category = Category.find(params[:id])
    @posts = @category.posts
    @news = Post.limit(7).order("published_at DESC")
  end
end