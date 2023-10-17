class BlogPostsController < ApplicationController
  def new; end

  def edit; end

  def show
    @post = BlogPost.find(params[:id])
  end

  def create
    @post = BlogPost.new(blog_post_params)
    if @post.save
      # Uspješno ste stvorili blog post
    else
      # Prikazati greške i ponovno prikazati obrazac
    end

    #redirect to blogs
  end

  def update
    if @post.update(blog_post_params)
      # Uspješno ste ažurirali blog post
    else
      # Prikazati greške i ponovno prikazati obrazac
    end
  end

  private

  def blog_post_params
    params.permit(:title, :description, :main_image, secondary_images: [])
  end
end
