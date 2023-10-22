class ProjectPostsController < ApplicationController
  def new; end

  def edit
    @post = BlogPost.find(params[:id])
  end

  def show
    @post = ProjectPost.find(params[:id])
  end

  def create
    @post = ProjectPost.new(blog_post_params)
    if @post.save
      # Uspješno ste stvorili blog post
    else
      # Prikazati greške i ponovno prikazati obrazac
    end

    #redirect to blogs
  end

  def update
    @post = ProjectPost.find(params[:id])

    if @post.update(project_post_params)
      # Uspješno ste ažurirali blog post
    else
      # Prikazati greške i ponovno prikazati obrazac
    end
  end

  private

  def project_post_params
    params.permit(:title, :description, :main_image, secondary_images: [])
  end
end
