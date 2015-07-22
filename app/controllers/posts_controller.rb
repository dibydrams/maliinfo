class PostsController < ApplicationController

  before_action :authenticate_user!, except: [:show, :index]
  
  def index
    @tags = Post.highlight.limit(4).order("published_at DESC")
    @marquee = Post.flashinfo.limit(1).order("published_at DESC")
    @posts = Post.all.order("published_at DESC")

    respond_to do |format|
          format.html
          format.rss { render :layout => false }

    @slides = Post.slideshow.limit(5).order("published_at DESC")
    # @whitepost = Post.highlight.limit(1)
    @firstpost = Post.highlight.limit(1).offset(0).order("published_at DESC")
    @greenpost = Post.highlight.limit(1).offset(1).order("published_at DESC")
    @yellowpost = Post.highlight.limit(1).offset(2).order("published_at DESC")
    @redpost = Post.highlight.limit(1).offset(3).order("published_at DESC")
    @otherposts = Post.news.limit(6).order("published_at DESC")
    end
  end

  def new
    @post = Post.new
    @post.published_at = Time.now
    @post.created_at = Time.now
    @post.flash = false
    @post.carousel = false
    @post.spotlight = false
    @post.inshort = false
  end

  def create
    post = Post.new(post_params)
      if post.save
        redirect_to action: 'index'
      else
        redirect_to action: 'new', error: post.error_messages
    end
  end

  def edit
    @post = Post.friendly.find params[:id]
  end

  def update
    post = Post.friendly.find params[:id]
    post.update_attributes(post_params)
      if post.save
        redirect_to action: 'index'
      else
        redirect_to action: 'new', error: post.error_messages
    end
  end

  def show
    @post = Post.friendly.find(params[:id])
    @news = Post.limit(7).order("published_at DESC")
  end

  private

  def post_params
    params.require(:post).permit(:title, :published_at, :content, :picture, :picture_cache, :tag_list, :spotlight, :inshort, category_ids: [])
  end
end