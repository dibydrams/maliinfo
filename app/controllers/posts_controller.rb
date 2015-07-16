class PostsController < ApplicationController

  before_action :authenticate_user!, except: [:show, :index]
  
  def index
    @tags = Post.highlight.limit(4)
    @marquee = Post.highlight.limit(1)
    @posts = Post.all.order("published_at DESC")

    respond_to do |format|
          format.html
          format.rss { render :layout => false }

    @slides = Post.limit(5)
    # @whitepost = Post.highlight.limit(1)
    @firstpost = Post.limit(1).offset(0)
    @greenpost = Post.limit(1).offset(1)
    @yellowpost = Post.limit(1).offset(2)
    @redpost = Post.limit(1).offset(3)
    @otherposts = Post.limit(6).offset(4)
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