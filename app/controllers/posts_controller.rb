class PostsController < ApplicationController
	def index
		@posts = Post.all

		respond_to do |format|
      		format.html
      		format.rss { render :layout => false }

    	@slides = Post.limit(5)
    	end
	end

	def new
		@post = Post.new
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
		@post = Post.find params[:id]
	end

	def update
		post = Post.find params[:id]
		post.update_attributes(post_params)
			if post.save
				redirect_to action: 'index'
			else
				redirect_to action: 'new', error: post.error_messages
		end
	end

	def show
		@post = Post.find(params[:id])
	end

	private

	def post_params
		params.require(:post).permit(:title, :picture, :picture_cache, :content, :tag_list, category_ids: [])
	end
end