class ProjectPostsController < ApplicationController
  def new
    @post = ProjectPost.new
  end

  def edit
    @post = ProjectPost.find(params[:id])
  end

  def show
    @post = ProjectPost.find(params[:id])
  end

  def create
    @post = ProjectPost.new(project_post_params)
    if @post.save
      flash[:notice] = 'Project post successfully created.'
      redirect_to project_post_path(@post)
    else
      flash[:alert] = 'Error creating the project post.'
    end
  end

  def update
    @post = ProjectPost.find(params[:id])
    if @post.update!(project_post_params)
      flash[:notice] = 'Project post successfully updated.'
      redirect_to project_post_path(@post)
    else
      flash[:alert] = 'Error updating the project post.'
      render 'edit'
    end
  end

  def destroy
    @post = ProjectPost.find(params[:id])
    if @post.destroy!
      redirect_to pages_projects_path, notice: 'Record deleted successfully.'
    else
      flash[:alert] = 'Failed to delete the record.'
    end
  end

  private

  def project_post_params
    params_edited = params.require(:project_post).permit(:title, :description, :locale, :main_image,
                                                         secondary_images: [])

    if params_edited.dig(:secondary_images).reject do |x|
      x == ''
    end.blank?
      params_edited.except(:secondary_images)
    else
      params_edited
    end
  end
end
