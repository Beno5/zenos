class BlogPostsController < ApplicationController
  def new
    @post = BlogPost.new
  end

  def edit
    @post = BlogPost.friendly.find(params[:slug])
  end

  def show
    @post = BlogPost.friendly.find(params[:slug])

    # Ako dolazi iz promene jezika (iz menija), proveri povezani post
    return unless params[:change]

    if @post.linked_blog_post_id.present?
      linked_post = BlogPost.find_by(id: @post.linked_blog_post_id, locale: I18n.locale.to_s)
      if linked_post
        redirect_to blog_post_path(linked_post)
      else
        redirect_to pages_blog_path(locale: I18n.locale)
      end
    else
      redirect_to pages_blog_path(locale: I18n.locale)
    end
  end

  def create
    @post = BlogPost.new(blog_post_params)
    if @post.save
      flash[:notice] = 'Blog post successfully created.'
      redirect_to blog_post_path(@post)
    else
      flash[:alert] = 'Error creating the blog post.'
      render 'new'
    end
  end

  def update
    @post = BlogPost.friendly.find(params[:slug])

    if @post.update(blog_post_params)
      # Ažuriraj povezani post (ako postoji)
      if @post.linked_blog_post_id.present?
        linked_post = BlogPost.find_by(id: @post.linked_blog_post_id)

        linked_post.update(linked_blog_post_id: @post.id) if linked_post
      end

      flash[:notice] = 'Blog post successfully updated.'
      redirect_to blog_post_path(@post)
    else
      flash[:alert] = 'Error updating the blog post.'
      render 'edit'
    end
  end

  def destroy
    @post = BlogPost.friendly.find(params[:slug])
    if @post.destroy
      redirect_to pages_blog_path, notice: 'Record deleted successfully.'
    else
      flash[:alert] = 'Failed to delete the record.'
      redirect_to blog_post_path(@post)
    end
  end

  private

  def blog_post_params
    params_edited = params.require(:blog_post).permit(:title, :description, :locale, :linked_blog_post_id, :main_image,
                                                      secondary_images: [])

    if params_edited.dig(:secondary_images).reject { |x| x == '' }.blank?
      params_edited.except(:secondary_images)
    else
      params_edited
    end
  end
end
