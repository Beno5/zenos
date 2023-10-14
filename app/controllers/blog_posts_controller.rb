class BlogPostsController < ApplicationController
  def new; end

  def edit; end

  def show
    @post = BlogPost.find(params[:id])
  end
end
