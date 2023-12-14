class BlogPostsController < ApplicationController
  def new
    @post = BlogPost.new
  end

  def edit
    @post = BlogPost.find(params[:id])
  end

  def show
    @post = BlogPost.find(params[:id])
  end

  def create
    @post = BlogPost.new(blog_post_params)
    if @post.save
      flash[:notice] = "Blog post successfully created."
      redirect_to blog_post_path(@post)
    else
      flash[:alert] = "Error creating the blog post."
    end
  end

  def update
    @post = BlogPost.find(params[:id])
    if @post.update!(blog_post_params)
      flash[:notice] = "Blog post successfully updated."
      redirect_to blog_post_path(@post)
    else
      flash[:alert] = "Error updating the blog post."
      render 'edit'
    end
  end

  def destroy
    @post = BlogPost.find(params[:id])
    if @post.destroy!
      redirect_to pages_blog_path, notice: "Record deleted successfully."
    else
      redirect_to blogs_path, alert: "Failed to delete the record."
    end
  end
  
  private

  def blog_post_params
    params.require(:blog_post).permit(:title, :description, :main_image, secondary_images: [])
  end
end
