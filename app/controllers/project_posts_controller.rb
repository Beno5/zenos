class ProjectPostsController < ApplicationController
  def new
    @post = ProjectPost.new
  end

  def edit
    @post = ProjectPost.friendly.find(params[:slug])  # Promijenjeno da koristi slug
  end

  def show
    @post = ProjectPost.friendly.find(params[:slug])  # Promijenjeno da koristi slug
  end

  def create
    @post = ProjectPost.new(project_post_params)
    if @post.save
      flash[:notice] = 'Project post successfully created.'
      redirect_to project_post_path(@post) # Ovdje će se generisati URL sa slugom
    else
      flash[:alert] = 'Error creating the project post.'
      render 'new'
    end
  end

  def update
    @post = ProjectPost.friendly.find(params[:slug]) # Promijenjeno da koristi slug
    if @post.update(project_post_params) # Uklonjena uzvičnica
      flash[:notice] = 'Project post successfully updated.'
      redirect_to project_post_path(@post) # Ovdje će se generisati URL sa slugom
    else
      flash[:alert] = 'Error updating the project post.'
      render 'edit'
    end
  end

  def destroy
    @post = ProjectPost.friendly.find(params[:slug]) # Promijenjeno da koristi slug
    if @post.destroy # Uklonjena uzvičnica
      redirect_to pages_projects_path, notice: 'Record deleted successfully.'
    else
      flash[:alert] = 'Failed to delete the record.'
      redirect_to project_post_path(@post)
    end
  end

  private

  def project_post_params
    params_edited = params.require(:project_post).permit(:title, :description, :locale, :main_image,
                                                         secondary_images: [])

    if params_edited.dig(:secondary_images).reject { |x| x == '' }.blank?
      params_edited.except(:secondary_images)
    else
      params_edited
    end
  end
end
