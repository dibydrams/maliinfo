class PostsController < ApplicationController
	def index
		@posts = Post.all

		respond_to do |format|
      		format.html
      		format.rss { render :layout => false } #index.rss.builder
    	end
	end
end