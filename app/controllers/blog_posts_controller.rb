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
      flash[:notice] = 'Blog post successfully created.'
      redirect_to blog_post_path(@post)
    else
      flash[:alert] = 'Error creating the blog post.'
    end
  end

  def update
    @post = BlogPost.find(params[:id])
    if @post.update!(blog_post_params)
      flash[:notice] = 'Blog post successfully updated.'
      redirect_to blog_post_path(@post)
    else
      flash[:alert] = 'Error updating the blog post.'
      render 'edit'
    end
  end

  def destroy
    @post = BlogPost.find(params[:id])
    if @post.destroy!
      redirect_to pages_blog_path, notice: 'Record deleted successfully.'
    else
      flash[:alert] = 'Failed to delete the record.'
    end
  end

  private

  def blog_post_params
    params_edited = params.require(:blog_post).permit(:title, :description, :locale, :main_image, secondary_images: [])

    if params_edited.dig(:secondary_images).reject do |x|
      x == ''
    end.blank?
      params_edited.except(:secondary_images)
    else
      params_edited
    end
  end
end
