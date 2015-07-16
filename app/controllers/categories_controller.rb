class CategoriesController < ApplicationController
  def show
    @category = Category.friendly.find(params[:id])
    @posts = @category.posts.paginate(page: params[:page], per_page: 15).order("published_at DESC")
    @news = Post.limit(7).order("published_at DESC")
  end
end