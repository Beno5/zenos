class ProjectPostsController < ApplicationController
  def new
    @post = ProjectPost.new
  end

  def edit
    @post = ProjectPost.friendly.find(params[:slug]) # Promijenjeno da koristi slug
  end

  def show
    @post = ProjectPost.friendly.find(params[:slug])

    # Ako dolazi iz promene jezika (iz menija), proveri povezani post
    return unless params[:change]

    # Ako postoji povezani post (na suprotnom jeziku), preusmeri na njega
    if @post.linked_project_post_id.present?
      linked_post = ProjectPost.find_by(id: @post.linked_project_post_id, locale: I18n.locale.to_s)

      if linked_post
        redirect_to project_post_path(linked_post)
      else
        # Ako povezani post ne postoji na trenutnom jeziku, preusmeri na blog index
        redirect_to pages_projects_path(locale: I18n.locale)
      end
    else
      # Ako nema povezanog posta, preusmeri na blog index
      redirect_to pages_projects_path(locale: I18n.locale)
    end
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
    @project_post = ProjectPost.friendly.find(params[:slug])

    if @project_post.update(project_post_params)
      # Ažuriraj povezani post (ako postoji)
      if @project_post.linked_project_post_id.present?
        linked_project_post = ProjectPost.find_by(id: @project_post.linked_project_post_id)

        linked_project_post.update(linked_project_post_id: @project_post.id) if linked_project_post
      end

      flash[:notice] = 'Project post successfully updated.'
      redirect_to project_post_path(@project_post)
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
    params_edited = params.require(:project_post).permit(:title, :description, :linked_project_post_id, :locale, :main_image,
                                                         secondary_images: [])

    if params_edited.dig(:secondary_images).reject { |x| x == '' }.blank?
      params_edited.except(:secondary_images)
    else
      params_edited
    end
  end
end
