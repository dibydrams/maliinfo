class PostsController < ApplicationController
	def index
		@posts = Post.offset(4)

		respond_to do |format|
      		format.html
      		format.rss { render :layout => false }

    	@slides = Post.limit(5)
    	@whitepost = Post.highlight.limit(1)
    	@greenpost = Post.limit(1).offset(1)
    	@yellowpost = Post.limit(1).offset(2)
    	@redpost = Post.limit(1).offset(3)
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